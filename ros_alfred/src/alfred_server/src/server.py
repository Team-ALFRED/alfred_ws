#!/usr/bin/python 

from flask import Flask, Response, jsonify, request, send_file
from functools import wraps
from alfred_config import *
import signal, sys

from PIL import Image
from StringIO import StringIO

import rospy
from std_msgs.msg import String

from actionlib.action_client import *
from move_base_msgs.msg import *
from alfred_server.msg import *
 
app = Flask(__name__)
rospy.init_node('alfred_server')
rospy.loginfo("ros node initialized")
pub = rospy.Publisher('/alfred_server/set_goal', ItemRequest, queue_size=10)

MAP_FILE = "/home/avengineer/alfred_ws/ros_alfred/src/alfred_maps/pharos_lab/pharos_lab.pgm"
inventory = DEFAULT_INV

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
    im = Image.open(MAP_FILE)
    return serve_pil_image(im)

@app.route("/sync")
def sync():
    rospy.loginfo("/sync")
    inv = [{"name":k, "quantity":v} for k,v in inventory.items() if v > 0]
    return jsonify({"inv":inv})

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
    im = Image.open(MAP_FILE)
    x = (loc[0] - 0.5) * im.size[0] * res - 0.5
    y = (loc[1] - 0.5) * im.size[1] * res + 0.5
    y = -y

    # dispense item at loc
    msg = ItemRequest()
    msg.item = item
    msg.goal = [x, y]
    pub.publish(msg)

    inventory[item] -= 1
    return jsonify({"name":item, "quantity":inventory[item]})

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    app.run(host='0.0.0.0', debug=True)
