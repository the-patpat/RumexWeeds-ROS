FROM rumexweeds_ros:melodic-desktop-full-bionic

#Copy the yolor folder, including weights
COPY ./yolor /yolor
COPY best_ap.pt /yolor/best_ap.pt

COPY ./RumexWeeds /rumexweeds_github

RUN apt update && apt upgrade -q -y

RUN apt install -q -y vim

RUN pip3 install --upgrade pip && pip install setuptools && pip install cython && pip install -r /yolor/requirements.txt

RUN pip3 install fiftyone

#Python 3 ros adjustment

RUN apt install python3-pip python3-yaml python-catkin-tools python3-dev -q -y
RUN pip3 install rospkg catkin_pkg empy


RUN mkdir -p /catkin_ws_bridge/src && cd /catkin_ws_bridge
RUN cd /catkin_ws_bridge && catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so
RUN cd /catkin_ws_bridge && catkin config --install

RUN cd /catkin_ws_bridge/src && git clone -b melodic https://github.com/ros-perception/vision_opencv.git && git clone -b melodic-devel https://github.com/ros/geometry.git && \
                git clone -b melodic-devel https://github.com/ros/geometry2.git
RUN cd / && . "/opt/ros/melodic/setup.sh" && cd /catkin_ws_bridge && catkin build cv_bridge geometry geometry2

RUN apt install ros-melodic-vision-msgs -q -y
RUN cd / && cd rumexweeds_github/tools/catkin_ws/ && . "/opt/ros/melodic/setup.sh" && catkin_make

RUN apt install ros-melodic-imu-filter-madgwick ros-melodic-imu-transformer -q -y

COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]





