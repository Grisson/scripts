#!/usr/bin/env bash

locust -f ~/_c/scripts/locust/PrebidLoadTest.py \
    --slave --master-host=40.83.139.151 \
    --master-port=5557 \
    2> ~/_c/log/error.log 1> ~/_c/log/output.log &