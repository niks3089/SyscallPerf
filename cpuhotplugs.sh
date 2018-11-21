if [ $# -ne 3 ]; then
    echo "hotplugcpus.sh <Number of cpus> <start_cpu> <off|on>"
    exit 1
fi

now_cpu=0
cpu=$2
online=1

if [ "$3" = "off" ]; then
    online=0
fi

while [ $now_cpu -lt $1 ]
do
    echo $3 cpu : $cpu
    sudo sh -c "echo $online > /sys/devices/system/cpu/cpu$cpu/online"
    now_cpu=`expr $now_cpu + 1`
    cpu=`expr $cpu + 1`
done
