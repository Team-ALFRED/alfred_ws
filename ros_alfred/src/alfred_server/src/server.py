#!/usr/bin/python 

from flask import Flask, jsonify, request, send_file
import signal, sys

import rospy
from std_msgs.msg import String

app = Flask(__name__)
pub = rospy.Publisher('chatter', String, queue_size=10)
rospy.init_node('talker', anonymous=True)
rospy.loginfo("ros node initialized")

inv = [{"name":"Water", "quantity":10}, {"name":"Granola", "quantity":5}]
rooms = ["living room", "kitchen", "dining room"]

@app.route("/map")
def show_map():
    return send_file("static/map.png")

@app.route("/sync")
def inventory():
    return jsonify({"inv":inv,"map":rooms})

@app.route("/deliver", methods=['POST'])
def items():
    item = request.json.get('item')
    loc = request.json.get('location')

    #if loc == None:
    #    return jsonify({"error": "Parameter 'location' is required"})

    #if not(loc in rooms):
    #    return jsonify({"error": "Not a valid location"})

    #if not(item in inv):
    #    return jsonify({"error": "Not a valid item"})

    # dispense item at loc
    msg = "{}:{}".format(item, loc)
    rospy.loginfo(msg)
    pub.publish(msg)

    inv[item] -= 1
    return jsonify({"name":item, "quantity":inv[item]})

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    app.run(host='0.0.0.0')
