# ZKBoo

Zero Knowledge Prover and Verifier for Boolean Circuits. Currently available is a prover and verifier for SHA-256. They depend on OpenSSL for doing commits and randomness generation and use OpenMP for parallelization.

When starting either prover, it will prompt for an input to hash. After entering the input, the proof will be generated as a file in the directory the program resides in. The file is named out<NUM_ROUNDS>.bin where <NUM_ROUNDS> is the number of rounds of the algorithm run (Set to 136 by defauly, but can be changed in shared.h. Likewise, the verifier will look for a file in its directory with the same naming syntax to verify.

This was improved on by [ZKB++](https://eprint.iacr.org/2017/279.pdf), an improved version of ZKBOO with NIZK proofs that are less than half the size of ZKBOO proofs. Moreover, benchmarks show that this size reduction comes at no extra computational cost.

## Usage

Compile the prover with the command
```
gcc MPC_SHA256.c -o mpc_proof.out -L/usr/lib64 -lcrypto -lomp -w
```

Compile the verifier with the command
```
gcc MPC_SHA256.c -o mpc_verify.out -L/usr/lib64 -lcrypto -lomp -w
```

## Requirements

Requires `libomp` which can be installed under package name `libomp-devel` on Fedora.
