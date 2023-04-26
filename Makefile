prove:
	gcc MPC_SHA256/MPC_SHA256.c -o MPC_SHA256/mpc_proof.out -L/usr/lib64 -lcrypto -lomp -w
	./MPC_SHA256/mpc_proof.out

verify:
	gcc MPC_SHA256/MPC_SHA256_VERIFIER.c -o MPC_SHA256/mpc_verify.out -L/usr/lib64 -lcrypto -lomp -w
	./MPC_SHA256/mpc_verify.out
