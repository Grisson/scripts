#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y python-pip
pip install --upgrade pip
pip install locustio pyzmq

