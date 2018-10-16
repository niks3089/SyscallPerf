./dummy_interface_setup.sh
./helper_scripts/create_tap.sh tap100 dummy0 br100 10.0.0.2 02:01:02:03:04:08
./helper_scripts/create_tap.sh tap101 dummy1 br101 11.0.0.2 02:01:02:03:04:09
./helper_scripts/create_tap.sh tap102 dummy2 br102 12.0.0.2 02:01:02:03:04:10

brctl show
