if [ $# -ne 2 ]; then
    echo "busyloop_multiplecpus.sh <Number of programs> <start_cpu>"
    exit 1
fi

curr_interface=0
cpu=$2
while [ $curr_interface -lt $1 ]
do
    curr_interface=`expr $curr_interface + 1`
    echo Starting program to loop on cpu: $cpu
    timeout 600 ./busyloop $cpu &
    cpu=`expr $cpu + 1`
done
