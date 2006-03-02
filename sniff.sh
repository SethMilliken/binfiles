#!/bin/sh
ettercap -zU
sudo chmod 777 /dev/bpf*
sudo ettercap -C -i en1
