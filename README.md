# ZKBoo

Link to the original ZKBoo implementation: https://github.com/Sobuno/ZKBoo

## Requirements

Requires `libomp` which can be installed under package name `libomp-devel` on Fedora.

## Usage (Linux)

### Compile project

Compile the prover with the command
```
gcc MPC_SHA256.c -o mpc_proof.out -L/usr/lib64 -lcrypto -lomp -w
```

Compile the verifier with the command
```
gcc MPC_SHA256.c -o mpc_verify.out -L/usr/lib64 -lcrypto -lomp -w
```

### Benchmark

The following script will run 1000 benchmarks
```
bench_linux.sh
```
The user should specify the number of threads to use. *The thread support for Linux is not guarenteed working properly.*

The script will output a file `out.csv` with the prover and verifier times for each run.

## Usage (Windows)

### Compile project

Compiling on `c` code on `Windows` can be a bit tricky. Make sure you have `gcc` installed!

Compile the prover with the command
```
gcc MPC_SHA256.c -o mpc_proof.out -lcrypto -fopenmp -w
```

Compile the verifier with the command
```
gcc MPC_SHA256.c -o mpc_verify.out -lcrypto -fopenmp -w
```

### Benchmark

Scripting on `Windows` is annoying, which means the user will need to do a bit more work to get this up and running.

Make sure you have `gcc` installed. And it is recommended to run this in `Git bash` or some other terminal, which supports `bash`-scripts.

First, `cd` into the project subfolder 
```
cd MPC_SHA256/
```

Then run the script for `Windows`
```
./benchmark-win.sh
```
This will prompt the user to specify the number of threads to use.

When the script is done, the user can use the python script `python/parse_times.py` to process the output times from the script into a `csv`-file. The script should can be run like this:

```
python3 python/parse_times.py -p MPC_SHA256/proof_times.txt -v MPC_SHA256/verify_times.txt
```

This will output a file `out.csv`.

**NOTE: DELETE the _proof_times.txt_ and _verify_times.txt_** if you want to benchmark several times with different number of threads. Otherwise the new times will just be appended to the existing file.
