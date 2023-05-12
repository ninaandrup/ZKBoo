#!/bin/bash

gcc MPC_SHA256.c -o mpc_proof -L/usr/lib64 -lcrypto -lomp -w
gcc MPC_SHA256_VERIFIER.c -o mpc_verify -L/usr/lib64 -lcrypto -lomp -w

for n in {1..1000};
do
    echo "Running benchmark $n"
    echo "hello world" | ./mpc_proof >> proof_times.txt
    ./mpc_verify >> verify_times.txt

    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt
    echo "" >> proof_times.txt

    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
    echo "" >> verify_times.txt
done
