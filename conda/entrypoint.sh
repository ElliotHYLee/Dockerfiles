#!/bin/bash --login
set -e
conda activate avb_imu
exec "$@"
