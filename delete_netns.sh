if [ $# -ne 1 ]; then
    echo "delete_netns.sh <number of Network namespace>"
    exit 1
fi

current_netns=0
while [ $current_netns -lt $1 ]
do
    next=`expr $current_netns + 1`
    sudo ip netns delete dummy_netns$current_netns
    sudo ifconfig dummy$current_netns down
    sudo ifconfig br$current_netns down && sudo brctl delbr br$current_netns

    current_netns=`expr $current_netns + 1`
done

brctl show
sudo ip netns list
