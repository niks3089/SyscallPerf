tap=$1
dummy=$2
BRIDGE=$3
GATEWAY=$4

#Example: 
#create_tap tap100 dummy0 br100 10.0.0.2
if [ $# -ne 4 ]; then
    echo "create_tap <tap> <dummy> <bridge> <bridge ip>"
    exit 1
fi

#clear things
sudo ifconfig $BRIDGE down && sudo brctl delbr $BRIDGE
sudo ip tuntap del $tap mode tap
sudo ifconfig $dummy down
