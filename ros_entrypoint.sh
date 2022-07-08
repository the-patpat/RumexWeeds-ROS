#!/bin/bash
set +e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/rumexweeds_github/tools/catkin_ws/devel/setup.bash"
source "/catkin_ws_bridge/install/setup.bash" --extend
exec "$@"
