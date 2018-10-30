#sudo modprobe dummy
if [ $# -ne 1 ]; then
    echo "dummy_interface_setup.sh <interface_offset>"
    exit 1
fi

dummy=dummy$1
ip_offset=$((10 + $1))

echo Creating $dummy interface with ip address $ip_offset.0.0.2/24

sudo ifconfig $dummy down && sudo ip link del $dummy type dummy 

sudo ip link add $dummy type dummy && \
sudo ip addr add $ip_offset.0.0.2/24 dev $dummy && \
sudo ip link set $dummy up
