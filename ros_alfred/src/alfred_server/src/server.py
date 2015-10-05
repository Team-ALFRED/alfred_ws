#!/usr/bin/python 

from flask import Flask, jsonify, request, send_file
import signal, sys

from PIL import Image
from StringIO import StringIO

import rospy
from std_msgs.msg import String

from actionlib.action_client import *
from move_base_msgs.msg import *
 
app = Flask(__name__)
pub = rospy.Publisher('chatter', String, queue_size=10)
rospy.init_node('talker', anonymous=True)
rospy.loginfo("ros node initialized")

MAP_FILE = "/home/avengineer//alfred_ws/ros_alfred/src/alfred_maps/maps/uta_basement.pgm"
inventory = {"water":10, "granola":5}
rooms = ["living room", "kitchen", "dining room"]

def serve_pil_image(pil_img):
    img_io = StringIO()
    pil_img.save(img_io, 'PNG')
    img_io.seek(0)
    return send_file(img_io, mimetype='image/png')

@app.route("/map")
def show_map():
    im = Image.open(MAP_FILE)
    return serve_pil_image(im)

@app.route("/sync")
def sync():
    inv = [{"name":k, "quantity":v} for k,v in inventory.items() if v > 0]
    return jsonify({"inv":inv,"map":rooms})

@app.route("/deliver", methods=['POST'])
def items():
    item = request.json.get('item')
    loc = request.json.get('location')

    if loc == None:
        return jsonify({"error": "Parameter 'location' is required"})

    if not(loc in rooms):
        return jsonify({"error": "Not a valid location"})

    if not(item in inventory):
        return jsonify({"error": "Not a valid item"})

    # dispense item at loc
    msg = "{}:{}".format(item, loc)
    rospy.loginfo(msg)
    pub.publish(msg)

    inventory[item] -= 1
    return jsonify({"name":item, "quantity":inventory[item]})

# TODO: move to state machine
def move(x, y):
    width = 1984
    height = 1984
    resolution = 0.05
    origin = [-50, -50]

    x -= width / 2
    y -= height / 2

    x -= origin[0] * resolution
    y -= origin[1] * resolution

    ac = ActionClient('move_base', MoveBaseAction)
    ac.wait_for_server()
    rospy.loginfo("Got move_base client")

    goal = MoveBaseGoal()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.orientation.w = 1.0
    goal.target_pose.header.frame_id = 'map'

    rospy.loginfo("Sending goal")
    ac.send_goal(goal)
    ac.wait_for_server()
    rospy.loginfo("Goal reached")

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    app.run(host='0.0.0.0')
