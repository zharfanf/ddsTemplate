#!/bin/bash

output=$(python checkGPU.py)
echo ${output}

if [ $output -gt 0 ]; then
    ./run-gpu.sh
else
    ./run-cpu.sh
fi

./run-vap.sh