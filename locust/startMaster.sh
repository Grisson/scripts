#!/usr/bin/env bash

# PACSG
locust -f ~/_c/scripts/locust/PrebidLoadTest.py \
    --host=http://13.64.255.79 \
    --master &

# PACSG2
locust -f ~/_c/scripts/locust/PrebidLoadTest.py \
    --host=http://13.91.109.71 \
    --master &

locust -f ~/_c/scripts/locust/PrebidLoadTest.py \
    --host=http://13.64.159.153 \
    --master &
