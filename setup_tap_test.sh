if [ $# -ne 1 ]; then
    echo "setup_tap_test.sh <number of tap interfaces>"
    exit 1
fi

./delete_tap_test.sh $1

curr_interface=0
while [ $curr_interface -lt $1 ]
do
    ./dummy_interface_setup.sh $curr_interface
    ./helper_scripts/create_tap.sh $curr_interface 
    # Delete static arp entries
    sudo arp -d $((10 + $curr_interface)).0.0.100

    # Add static arp entries
    sudo sudo arp -s $((10 + $curr_interface)).0.0.100 `cat /sys/class/net/dummy$curr_interface/address`
    curr_interface=`expr $curr_interface + 1`
done

brctl show
