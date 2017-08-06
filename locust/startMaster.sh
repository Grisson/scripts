#!/usr/bin/env bash

locust -f ~/_c/scripts/PrebidLoadTest.py \
    --host=http://13.64.159.153 \
    --master &