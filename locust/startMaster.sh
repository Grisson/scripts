#!/usr/bin/env bash

locust -f ~/_c/scripts/locust/PrebidLoadTest.py \
    --host=http://13.64.159.153 \
    --master &