# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/avengineer/alfred_ws/ros_alfred/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/avengineer/alfred_ws/ros_alfred/build

# Include any dependencies generated for this target.
include segbot_simulation_apps/CMakeFiles/door_handler.dir/depend.make

# Include the progress variables for this target.
include segbot_simulation_apps/CMakeFiles/door_handler.dir/progress.make

# Include the compile flags for this target's objects.
include segbot_simulation_apps/CMakeFiles/door_handler.dir/flags.make

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o: segbot_simulation_apps/CMakeFiles/door_handler.dir/flags.make
segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o: /home/avengineer/alfred_ws/ros_alfred/src/segbot_simulation_apps/src/nodes/door_handler.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/avengineer/alfred_ws/ros_alfred/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o"
	cd /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o -c /home/avengineer/alfred_ws/ros_alfred/src/segbot_simulation_apps/src/nodes/door_handler.cpp

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.i"
	cd /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/avengineer/alfred_ws/ros_alfred/src/segbot_simulation_apps/src/nodes/door_handler.cpp > CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.i

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.s"
	cd /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/avengineer/alfred_ws/ros_alfred/src/segbot_simulation_apps/src/nodes/door_handler.cpp -o CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.s

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.requires:
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.requires

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.provides: segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.requires
	$(MAKE) -f segbot_simulation_apps/CMakeFiles/door_handler.dir/build.make segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.provides.build
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.provides

segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.provides.build: segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o

# Object files for target door_handler
door_handler_OBJECTS = \
"CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o"

# External object files for target door_handler
door_handler_EXTERNAL_OBJECTS =

/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: segbot_simulation_apps/CMakeFiles/door_handler.dir/build.make
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /home/avengineer/alfred_ws/ros_alfred/devel/lib/libsegbot_simulation_apps.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libbwi_planning_common.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libbwi_mapper.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libimage_loader.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libbwi_tools.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libbwi_tools_json.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/libtbb.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/libtbbmalloc.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libroslib.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libtf.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libtf2_ros.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libactionlib.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libmessage_filters.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libroscpp.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libtf2.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/librosconsole.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/liblog4cxx.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/librostime.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /opt/ros/indigo/lib/libcpp_common.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler: segbot_simulation_apps/CMakeFiles/door_handler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler"
	cd /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/door_handler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
segbot_simulation_apps/CMakeFiles/door_handler.dir/build: /home/avengineer/alfred_ws/ros_alfred/devel/lib/segbot_simulation_apps/door_handler
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/build

segbot_simulation_apps/CMakeFiles/door_handler.dir/requires: segbot_simulation_apps/CMakeFiles/door_handler.dir/src/nodes/door_handler.cpp.o.requires
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/requires

segbot_simulation_apps/CMakeFiles/door_handler.dir/clean:
	cd /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps && $(CMAKE_COMMAND) -P CMakeFiles/door_handler.dir/cmake_clean.cmake
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/clean

segbot_simulation_apps/CMakeFiles/door_handler.dir/depend:
	cd /home/avengineer/alfred_ws/ros_alfred/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/avengineer/alfred_ws/ros_alfred/src /home/avengineer/alfred_ws/ros_alfred/src/segbot_simulation_apps /home/avengineer/alfred_ws/ros_alfred/build /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps /home/avengineer/alfred_ws/ros_alfred/build/segbot_simulation_apps/CMakeFiles/door_handler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : segbot_simulation_apps/CMakeFiles/door_handler.dir/depend

