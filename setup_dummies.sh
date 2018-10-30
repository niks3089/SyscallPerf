#sudo modprobe dummy
if [ $# -ne 1 ]; then
    echo "setup_dummies.sh <number of dummy interfaces>"
    exit 1
fi

curr_interface=0
while [ $curr_interface -lt $1 ]
do
    ./helper_scripts/dummy_interface_setup.sh $curr_interface
    curr_interface=`expr $curr_interface + 1`
done
