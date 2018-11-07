#Important: For this to work, make sure /proc/sys/net/ipv4/ip_forward is set to 1 
if [ $# -ne 1 ]; then
    echo "setup_netns.sh <number of Network namespace>"
    exit 1
fi

echo "Clearing existing network namespace"
./delete_netns.sh $1

echo "Creating new network namespaces"
current_netns=0
while [ $current_netns -lt $1 ]
do
    next=`expr $current_netns + 1`
    sudo ip netns add dummy_netns$current_netns
    sudo ip link add veth$current_netns type veth peer name veth$next
    sudo ip link set veth$next netns dummy_netns$current_netns
    sudo ifconfig veth$current_netns `expr $current_netns + 10`.0.0.50 netmask 255.255.255.0
    sudo ip netns exec dummy_netns$current_netns ifconfig veth$next `expr $current_netns + 10`.0.0.49 netmask 255.255.255.0 up
    sudo ip netns exec dummy_netns$current_netns route add default gw `expr $current_netns + 10`.0.0.50 

    ./helper_scripts/dummy_interface_setup.sh $current_netns

    sudo brctl addbr br$current_netns && \
    sudo ifconfig br$current_netns up && \
    sudo ifconfig dummy$current_netns 0.0.0.0 && \
    sudo ifconfig veth$current_netns 0.0.0.0 && \
    sudo brctl addif br$current_netns veth$current_netns && \
    sudo brctl addif br$current_netns dummy$current_netns && \
    sudo ifconfig br$current_netns `expr $current_netns + 10`.0.0.2
    sudo ifconfig br$current_netns `expr $current_netns + 10`.0.0.50
    sudo ip route add `expr $current_netns + 100`.0.0.100/32  dev dummy$current_netns

    # Add static arp entries into namespace
    sudo ip netns exec dummy_netns$current_netns sudo arp -s `expr $current_netns + 10`.0.0.100 `cat /sys/class/net/dummy$current_netns/address`
    sudo ip netns exec dummy_netns$current_netns sudo arp -s `expr $current_netns + 100`.0.0.50 `cat /sys/class/net/br$current_netns/address`

    # Add/delete static entries out of namespace
    #sudo arp -d `expr $current_netns + 10`.0.0.100
    #sudo arp -s `expr $current_netns + 10`.0.0.100 `cat /sys/class/net/dummy$current_netns/address` -i dummy$current_netns

    current_netns=`expr $current_netns + 1`
done

sudo ip netns list
sudo brctl show
