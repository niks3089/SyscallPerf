if [ $# -ne 1 ]; then
    echo "delete_tap_test.sh <number of tap interfaces>"
    exit 1
fi

curr_interface=0
while [ $curr_interface -lt $1 ]
do
    ./helper_scripts/delete_tap.sh $curr_interface
    curr_interface=`expr $curr_interface + 1`
done

brctl show
