#!/bin/bash

echo "Enter number of threads."
read threads

gcc MPC_SHA256.c -o mpc_proof -L/usr/lib64 -lcrypto -fopenmp -w
gcc MPC_SHA256_VERIFIER.c -o mpc_verify -L/usr/lib64 -lcrypto -fopenmp -w

for n in {1..1000};
do
    echo "Running benchmark $n"
    echo "hello world" | ./mpc_proof.exe $threads >> proof_times.txt
    ./mpc_verify.exe $threads >> verify_times.txt

    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt

    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
done
