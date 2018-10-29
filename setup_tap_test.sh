./dummy_interface_setup.sh
./helper_scripts/create_tap.sh tap100 dummy0 br100 10.0.0.2 02:01:02:03:04:08
./helper_scripts/create_tap.sh tap101 dummy1 br101 11.0.0.2 02:01:02:03:04:09
./helper_scripts/create_tap.sh tap102 dummy2 br102 12.0.0.2 02:01:02:03:04:10

# Delete static arp entries
sudo arp -d 10.0.0.100
sudo arp -d 11.0.0.100
sudo arp -d 12.0.0.100

# Add static arp entries
sudo  sudo arp -s 10.0.0.100 `cat /sys/class/net/dummy0/address`
sudo  sudo arp -s 11.0.0.100 `cat /sys/class/net/dummy1/address`
sudo  sudo arp -s 12.0.0.100 `cat /sys/class/net/dummy2/address`

brctl show
