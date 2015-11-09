#!/usr/bin/python 

from flask import Flask, Response, jsonify, request, send_file
from functools import wraps
from alfred_config import *
import signal, sys, math

from PIL import Image
from StringIO import StringIO

import rospy
from std_msgs.msg import String

from actionlib.action_client import *
from move_base_msgs.msg import *
from nav_msgs.msg import *
from map_msgs.msg import *
from std_msgs.msg import String
from alfred_server.msg import *

import numpy as np
import trim_map
import random

MAP_FILE = "/home/avengineer/alfred_ws/ros_alfred/src/alfred_maps/pharos_lab/pharos_lab.pgm"
inventory = {}
inventory.update(DEFAULT_INV)

latest_data = [0 for i in range(1984 * 1984)]
latest_map = Image.open(MAP_FILE)
latest_odom = (0, 0, 0)

def update_odom_callback(msg):
    global latest_odom
    latest_odom = msg.pose.pose.position

def color_filter(x):
  if x == 0:
    return (240, 240, 240)
  if x == 100:
    return (0, 0, 0)
  return (204-x/2, 235-x/2, 250-x/2)

def map_callback(msg):
    global latest_map
    global latest_data

    width = int(math.sqrt(len(msg.data)))
    size = (width, width)
    im = Image.new('RGB', size)
    im.putdata([color_filter(x) for x in msg.data])
    latest_map = trim_map.trim(im)
    latest_data = np.reshape(msg.data, size)
    if isinstance(msg, OccupancyGrid):
        rospy.Subscriber("/move_base/global_costmap/costmap_updates",
            OccupancyGridUpdate, update_map_callback)

def update_map_callback(msg):
    global latest_data
    up_data = np.reshape(msg.data, (msg.height, msg.width))
    latest_data[msg.y:msg.y+msg.height:, msg.x:msg.x+msg.width:] = up_data

    msg = OccupancyGridUpdate()
    msg.data = latest_data.flatten()
    map_callback(msg)

app = Flask(__name__)
rospy.init_node('alfred_server')
rospy.loginfo("ros node initialized")
rospy.Subscriber("/odom", Odometry, update_odom_callback)
rospy.Subscriber("/move_base/global_costmap/costmap", OccupancyGrid, map_callback)
pub = rospy.Publisher('/alfred_server/set_goal', ItemRequest, queue_size=10)
hard_stop = rospy.Publisher('/alfred_server/hard_stop', String, queue_size=10)

def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth = request.headers.get('Authorization', 'None')
        if auth != SECRET_TOKEN:
            rospy.logwarn("Invalid secret token: " + auth)
            return Response(status=401)
        return f(*args, **kwargs)
    return decorated

def serve_pil_image(pil_img):
    img_io = StringIO()
    pil_img.save(img_io, 'PNG')
    img_io.seek(0)
    return send_file(img_io, mimetype='image/png')

@app.route("/map")
def show_map():
    rospy.loginfo("/map")
    return serve_pil_image(latest_map)

@app.route("/sync")
def sync():
    rospy.loginfo("/sync")
    inv = [{"name":k, "quantity":v} for k,v in inventory.items() if v > 0]
    return jsonify({"inv":inv})

@app.route("/location")
def location():
    rospy.loginfo("/location")

    res = 0.05
    x = (latest_odom[0] + 0.5) / latest_map.size[0] / res + 0.5
    y = (latest_odom[0] - 0.5) / latest_map.size[1] / res + 0.5

    return jsonify({"x": x, "y": y})

@app.route("/deliver", methods=['POST'])
@requires_auth
def items():
    rospy.loginfo("/deliver")
    item = request.json.get('item')
    loc = request.json.get('location')

    if loc == None:
        return jsonify({"error": "Parameter 'location' is required"})

    if not isinstance(loc, list):
        return jsonify({"error": "Parameter 'location' must be a list"})

    if len(loc) != 2:
        return jsonify({"error": "Parameter 'location' must contain two elements"})

    if not(item in inventory):
        return jsonify({"error": "Not a valid item"})

    res = 0.05
    x = (loc[0] - 0.5) * latest_map.size[0] * res - 0.5
    y = (loc[1] - 0.5) * latest_map.size[1] * res + 0.5
    # Not needed with latest map: y = -y

    # dispense item at loc
    msg = ItemRequest()
    msg.item = item
    msg.goal = [x, y]
    msg.uid = random.randint(0, 0xffffffff)
    pub.publish(msg)

    res = None
    try:
      while True:
          res = rospy.wait_for_message("/alfred_server/result", ItemResult, timeout=300)
          if res.uid == msg.uid:
              break
    except:
      return jsonify({"error": "Internal server error"})

    if res.dispensed:
      inventory[item] -= 1

    if res.error:
      return jsonify({"error": res.error})
    else:
      return jsonify({"name":item, "quantity":inventory[item]})

@app.route("/stop", methods=['DELETE'])
def stop():
    rospy.loginfo("/stop")
    hard_stop.publish("stop")
    return "stopping"

@app.route("/reset")
def reset():
    rospy.loginfo("/reset")
    inventory.update(DEFAULT_INV)
    inv = [{"name":k, "quantity":v} for k,v in inventory.items() if v > 0]
    return jsonify({"inv":inv})

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    app.run(host='0.0.0.0', threaded=True, debug=True)
