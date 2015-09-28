# CMake generated Testfile for 
# Source directory: /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy
# Build directory: /home/avengineer/alfred_ws/ros_alfred/build/teleop_twist_joy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(_ctest_teleop_twist_joy_roslint_package "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/roslint-teleop_twist_joy.xml" "--working-dir" "/home/avengineer/alfred_ws/ros_alfred/build/teleop_twist_joy" "--return-code" "/opt/ros/indigo/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/roslint-teleop_twist_joy.xml make roslint_teleop_twist_joy")
ADD_TEST(_ctest_teleop_twist_joy_roslaunch-check_launch_teleop.launch "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/roslaunch-check_launch_teleop.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy" "/opt/ros/indigo/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/roslaunch-check_launch_teleop.launch.xml' '/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/launch/teleop.launch' ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_differential_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_differential_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_differential_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/differential_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_holonomic_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_holonomic_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_holonomic_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/holonomic_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_six_dof_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_six_dof_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_six_dof_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/six_dof_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_no_enable_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_no_enable_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_no_enable_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/no_enable_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_turbo_enable_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_turbo_enable_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_turbo_enable_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/turbo_enable_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_only_turbo_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_only_turbo_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_only_turbo_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/only_turbo_joy.test ")
ADD_TEST(_ctest_teleop_twist_joy_rostest_test_turbo_angular_enable_joy.test "/home/avengineer/alfred_ws/ros_alfred/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/avengineer/alfred_ws/ros_alfred/build/test_results/teleop_twist_joy/rostest-test_turbo_angular_enable_joy.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy --package=teleop_twist_joy --results-filename test_turbo_angular_enable_joy.xml --results-base-dir \"/home/avengineer/alfred_ws/ros_alfred/build/test_results\" /home/avengineer/alfred_ws/ros_alfred/src/teleop_twist_joy/test/turbo_angular_enable_joy.test ")
