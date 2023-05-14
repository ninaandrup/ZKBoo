#!/bin/bash
cd MPC_SHA256
./benchmark.sh
cd ..
python3 python/parse_times.py -p MPC_SHA256/proof_times.txt -v MPC_SHA256/verify_times.txt
rm MPC_SHA256/proof_times.txt MPC_SHA256/verify_times.txt