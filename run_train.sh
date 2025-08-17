#!/bin/bash

# BEFORE RUNNING: give execution permissions with chmod +x run_train.sh
# Then run with ./run_train.sh

set -e  # Exit on error
# set -x  # Echo commands for debugging

# BUILD image
hare build -t ceh94/ffa .

# START THE CONTAINER and RUN TEST CODE
hare run --rm --gpus '"device=4,5"' --shm-size=128g \
  --mount type=bind,source=/mnt/fast1/ceh94/FFA-Net/data,target=/FFA-Net/data \
  --mount type=bind,source=/mnt/fast1/ceh94/FFA-Net/logs,target=/FFA-Net/logs  \
   --mount type=bind,source=/mnt/fast1/ceh94/FFA-Net/numpy_files,target=/FFA-Net/numpy_files \
  --mount type=bind,source=/mnt/fast1/ceh94/FFA-Net/trained_models,target=/FFA-Net/trained_models \
  ceh94/ffa \
  net/main.py --net='ffa' --crop --crop_size=240 --blocks=19 --gps=3 --bs=2 --lr=0.0001 --trainset='a_train' --testset='a_test' --steps=500000 --eval_step=5000





