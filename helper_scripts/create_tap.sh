tap=$1
dummy=$2
BRIDGE=$3
GATEWAY=$4
MAC=$5

#Example: 
#create_tap tap100 dummy0 br100 10.0.0.2 02:01:02:03:04:08
if [ $# -ne 5 ]; then
    echo "create_tap <tap> <dummy> <bridge> <bridge ip> <mac>"
    exit 1
fi

./delete_tap.sh $tap $dummy $BRIDGE $GATEWAY

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
