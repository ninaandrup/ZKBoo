ifndef threads
override threads = 1
endif

prove:
	gcc MPC_SHA256/MPC_SHA256.c -o MPC_SHA256/mpc_proof.out -L/usr/lib64 -lcrypto -lomp -w -O2

verify:
	gcc MPC_SHA256/MPC_SHA256_VERIFIER.c -o MPC_SHA256/mpc_verify.out -L/usr/lib64 -lcrypto -lomp -w -O2

bench_prove:
	./MPC_SHA256/mpc_proof.out $(threads)

bench_verify:
	./MPC_SHA256/mpc_verify.out $(threads)

bench: bench_prove bench_verify
