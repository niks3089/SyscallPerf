sudo rmmod scsi_debug
sudo modprobe scsi_debug
sudo sh -c "echo $1 > /sys/bus/pseudo/drivers/scsi_debug/max_luns"
sudo sh -c "echo $1 > /sys/bus/pseudo/drivers/scsi_debug/num_tgts"
sudo sh -c "echo '- 0 -' > /sys/class/scsi_host/host6/scan"
