#!/usr/bin/python 

from flask import Flask, jsonify, request, send_file
import signal, sys

from PIL import Image
from StringIO import StringIO

import rospy
from std_msgs.msg import String

app = Flask(__name__)
pub = rospy.Publisher('chatter', String, queue_size=10)
rospy.init_node('talker', anonymous=True)
rospy.loginfo("ros node initialized")

MAP_FILE = "/home/avengineer//alfred_ws/ros_alfred/src/alfred_maps/maps/uta_basement.pgm"
inventory = {"Water":10, "Granola":5}
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

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    app.run(host='0.0.0.0')
