#sudo modprobe dummy
if [ $# -ne 1 ]; then
    echo "setup_dummies.sh <number of dummy interfaces>"
    exit 1
fi

curr_interface=0
while [ $curr_interface -lt $1 ]
do
    sudo ifconfig dummy$curr_interface down && sudo ip link del dummy$curr_interface type dummy
    curr_interface=`expr $curr_interface + 1`
done
