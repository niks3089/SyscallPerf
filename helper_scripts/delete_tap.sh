#Example: 
#delete_tap tap100 dummy0 br100
if [ $# -ne 1 ]; then
    echo "delete_tap <tap_offset>"
    exit 1
fi

tap=tap10$1
dummy=dummy$1
bridge_id=$((100 + $1))
BRIDGE=br$bridge_id

#clear things
sudo ifconfig $BRIDGE down && sudo brctl delbr $BRIDGE
sudo ip tuntap del $tap mode tap
sudo ifconfig $dummy down
