FROM moveit/moveit:noetic-release

ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

### Install z1_ros system dependencies
RUN apt update && apt install -y git libboost-all-dev libeigen3-dev liburdfdom-dev
RUN apt install -y ros-noetic-gazebo-ros
RUN ln -s /usr/include/eigen3/Eigen /usr/local/include/Eigen
RUN ln -s /usr/include/eigen3/unsupported /usr/local/include/unsupported

# Install pinocchio
RUN apt install -y ros-noetic-pinocchio

# z1_ros
RUN mkdir -p /app/src
COPY src /app/src
WORKDIR /app/src

# Install pybind11
RUN git clone https://github.com/pybind/pybind11.git
WORKDIR pybind11/build
RUN cmake .. -DPYBIND11_TEST=OFF
RUN make -j
RUN sudo make install

# Build z1_ros
WORKDIR /app
RUN rosdep install --from-paths src --ignore-src -yr --rosdistro noetic
RUN source /opt/ros/noetic/setup.bash && catkin_make --pkg unitree_legged_msgs
RUN source /opt/ros/noetic/setup.bash && catkin_make --pkg z1_sdk
RUN source /opt/ros/noetic/setup.bash && catkin_make -j

# Cleanup installation
RUN apt-get clean && rm -rf /var/lib/apt/lists/*