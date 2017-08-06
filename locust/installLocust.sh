#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y python-pip
sudo pip install --upgrade pip
sudo pip install locustio pyzmq

mkdir -p ~/_c/log
touch ~/_c/log/error.log
touch ~/_c/log/output.log
cd ~

# locust -f ~/_c/scripts/PrebidLoadTest.py  --host=http://13.64.159.153 --master &
# locust -f ~/_c/scripts/PrebidLoadTest.py --slave --master-host=40.83.139.151 --master-port=5557 2> ~/_c/log/error.log > output.log &