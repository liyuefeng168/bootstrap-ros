# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/arthur/ros_varient/sim-install/console-bridge-0.3.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arthur/ros_varient/sim-install/console-bridge-0.3.2

# Include any dependencies generated for this target.
include test/CMakeFiles/console_TEST.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/console_TEST.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/console_TEST.dir/flags.make

test/CMakeFiles/console_TEST.dir/console_TEST.cc.o: test/CMakeFiles/console_TEST.dir/flags.make
test/CMakeFiles/console_TEST.dir/console_TEST.cc.o: test/console_TEST.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arthur/ros_varient/sim-install/console-bridge-0.3.2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/console_TEST.dir/console_TEST.cc.o"
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-deprecated-declarations -o CMakeFiles/console_TEST.dir/console_TEST.cc.o -c /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test/console_TEST.cc

test/CMakeFiles/console_TEST.dir/console_TEST.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/console_TEST.dir/console_TEST.cc.i"
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-deprecated-declarations -E /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test/console_TEST.cc > CMakeFiles/console_TEST.dir/console_TEST.cc.i

test/CMakeFiles/console_TEST.dir/console_TEST.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/console_TEST.dir/console_TEST.cc.s"
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-deprecated-declarations -S /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test/console_TEST.cc -o CMakeFiles/console_TEST.dir/console_TEST.cc.s

test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.requires:

.PHONY : test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.requires

test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.provides: test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.requires
	$(MAKE) -f test/CMakeFiles/console_TEST.dir/build.make test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.provides.build
.PHONY : test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.provides

test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.provides.build: test/CMakeFiles/console_TEST.dir/console_TEST.cc.o


# Object files for target console_TEST
console_TEST_OBJECTS = \
"CMakeFiles/console_TEST.dir/console_TEST.cc.o"

# External object files for target console_TEST
console_TEST_EXTERNAL_OBJECTS =

test/console_TEST: test/CMakeFiles/console_TEST.dir/console_TEST.cc.o
test/console_TEST: test/CMakeFiles/console_TEST.dir/build.make
test/console_TEST: test/libgtest_main.a
test/console_TEST: test/libgtest.a
test/console_TEST: libconsole_bridge.so.0.2
test/console_TEST: test/CMakeFiles/console_TEST.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arthur/ros_varient/sim-install/console-bridge-0.3.2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable console_TEST"
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/console_TEST.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/console_TEST.dir/build: test/console_TEST

.PHONY : test/CMakeFiles/console_TEST.dir/build

test/CMakeFiles/console_TEST.dir/requires: test/CMakeFiles/console_TEST.dir/console_TEST.cc.o.requires

.PHONY : test/CMakeFiles/console_TEST.dir/requires

test/CMakeFiles/console_TEST.dir/clean:
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test && $(CMAKE_COMMAND) -P CMakeFiles/console_TEST.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/console_TEST.dir/clean

test/CMakeFiles/console_TEST.dir/depend:
	cd /home/arthur/ros_varient/sim-install/console-bridge-0.3.2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arthur/ros_varient/sim-install/console-bridge-0.3.2 /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test /home/arthur/ros_varient/sim-install/console-bridge-0.3.2 /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test /home/arthur/ros_varient/sim-install/console-bridge-0.3.2/test/CMakeFiles/console_TEST.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/console_TEST.dir/depend
