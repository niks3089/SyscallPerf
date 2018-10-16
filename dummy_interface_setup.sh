sudo modprobe dummy

sudo ifconfig dummy0 down && sudo ip link del dummy0 type dummy 
sudo ifconfig dummy1 down && sudo ip link del dummy1 type dummy
sudo ifconfig dummy2 down && sudo ip link del dummy2 type dummy

sudo ip link add dummy0 type dummy && \
sudo ip link add dummy1 type dummy && \
sudo ip link add dummy2 type dummy && \
sudo ip addr add 10.0.0.2/24 dev dummy0 && \
sudo ip addr add 11.0.0.2/24 dev dummy1 && \
sudo ip addr add 12.0.0.2/24 dev dummy2 && \
sudo ip link set dummy0 up && \
sudo ip link set dummy1 up && \
sudo ip link set dummy2 up
