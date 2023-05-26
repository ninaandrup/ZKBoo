#!/bin/bash

echo "Enter max number of threads."
read THREADS

for ((n=1; n<=$THREADS; n++))
do
    echo "Running for $n threads"
    cd MPC_SHA256
    ./benchmark.sh $n
    cd ..
    python3 python/parse_times.py -p MPC_SHA256/proof_times.txt -v MPC_SHA256/verify_times.txt -o threads-$n.csv
    rm MPC_SHA256/proof_times.txt MPC_SHA256/verify_times.txt
done
