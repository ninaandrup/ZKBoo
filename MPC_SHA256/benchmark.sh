#!/bin/bash

gcc MPC_SHA256.c -o mpc_proof -L/usr/lib64 -lcrypto -fopenmp -w
gcc MPC_SHA256_VERIFIER.c -o mpc_verify -L/usr/lib64 -lcrypto -fopenmp -w

for n in {1..1000};
do
    echo "Running benchmark $n"
    echo "hello world" | OMP_NUM_THREADS=$1 ./mpc_proof >> proof_times.txt
    OMP_NUM_THREADS=$1 ./mpc_verify >> verify_times.txt

    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt

    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
done
