#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/avengineer/alfred_ws/ros_alfred/src/segbot_sensors"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/avengineer/alfred_ws/ros_alfred/install/lib/python2.7/dist-packages:/home/avengineer/alfred_ws/ros_alfred/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/avengineer/alfred_ws/ros_alfred/build" \
    "/usr/bin/python" \
    "/home/avengineer/alfred_ws/ros_alfred/src/segbot_sensors/setup.py" \
    build --build-base "/home/avengineer/alfred_ws/ros_alfred/build/segbot_sensors" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/avengineer/alfred_ws/ros_alfred/install" --install-scripts="/home/avengineer/alfred_ws/ros_alfred/install/bin"
