#Example: 
#create_tap tap100 dummy0 br100 10.0.0.2 02:01:02:03:04:08
if [ $# -ne 1 ]; then
    echo "create_tap <tap_offset>"
    exit 1
fi

tap=tap10$1
dummy=dummy$1
bridge_id=$((100 + $1))
ip_offset=$((10 + $1))
mac_offset=$((10 + $1))

BRIDGE=br$bridge_id
GATEWAY=$ip_offset.0.0.2
MAC=02:01:02:03:04:$mac_offset

#add things
sudo brctl addbr $BRIDGE && \
sudo ifconfig $BRIDGE up && \
sudo ip tuntap add $tap mode tap && \
sudo ip link set dev $tap up && \
sudo ifconfig $dummy 0.0.0.0 && \
sudo ifconfig $tap hw ether $MAC && \
sudo brctl addif $BRIDGE $tap && \
sudo brctl addif $BRIDGE $dummy && \
sudo ifconfig $BRIDGE $GATEWAY
