#!/bin/bash

echo "Enter number of threads."
read threads

gcc MPC_SHA256.c -o mpc_proof -L/usr/lib64 -lcrypto -lomp -w
gcc MPC_SHA256_VERIFIER.c -o mpc_verify -L/usr/lib64 -lcrypto -lomp -w

for n in {1..1000};
do
    echo "Running benchmark $n"
    echo "hello world" | ./mpc_proof $threads >> proof_times.txt
    ./mpc_verify $threads >> verify_times.txt

    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt

    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
done
