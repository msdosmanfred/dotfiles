#!/bin/bash
sudo ip link add br0 type bridge
sudo ip link set dev enp3s0 master br0
sudo ip link set br0 up

sudo ip tuntap add dev tap-vde mode tap user $USER
sudo ip link set dev tap-vde up
sudo ip link set tap-vde master br0

/usr/bin/vde_switch -tap tap-vde -s /tmp/vde.ctl --mgmt /tmp/vde.mgmt -mod 660 --daemon
