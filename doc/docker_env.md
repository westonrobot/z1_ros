## Docker Environment Setup

+ This Dockerfile provides a ROS Noetic environment with the required depencies for Z1.

### Setup ROS Workspace

```bash
mkdir -p ~/z1_ws/src
cd ~/z1_ws/src
git clone --recursive https://github.com/westonrobot/z1_ros.git

mv docker ../..
mv scripts ../..
```

### Build Docker Image

```bash
cd ~/z1_ws
docker build -t z1_ros -f docker/Dockerfile .
```
### Start Docker Container

+ Edit the ROS_HOSTNAME to your machine's IP address and choose the appropriate launch file in ~/z1_ws/scripts/entrypoint.sh

```bash
cd ~/z1_ws/docker
docker compose up
```
+ By default, this will launch the real_arm.launch with RVIZ.



