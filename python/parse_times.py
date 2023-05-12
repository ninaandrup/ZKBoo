import argparse
import os

def process_args() -> str:
    parser = argparse.ArgumentParser("Parser for ZKBoo raw proof and verify times.")
    parser.add_argument('-p', '--proof', action='store', dest='proof', help="the proof input file (relative path)")
    parser.add_argument('-v', '--verify', action='store', dest='verify', help="the verify input file (relative path)")
    
    args = parser.parse_args()

    proof_file  = args.proof
    verify_file = args.verify
    if proof_file == None and verify_file == None:
        raise Exception("At least one of proof and verify should be specified as input. Help: python3 parse_times.py -h")
    
    curr_path   = os.getcwd()
    proof_path  = None if proof_file  == None else os.path.join(curr_path, proof_file)
    verify_path = None if verify_file == None else os.path.join(curr_path, verify_file)
    return (proof_path, verify_path)

if __name__ == '__main__':
    (proof_path, verify_path) = process_args()
    
    if proof_path != None:
        proof_file = open(proof_path)
        proof      = proof_file.readlines()
        proof_file.close()

        times: list[int] = []

        for line in proof:
            is_total_time = line[:7] == 'Total: '
            if is_total_time:
                times.append(int(line[7:]))
        
        print(times)

    if verify_path != None:
        verify_file = open(verify_path)
        verify      = verify_file.readlines()
        verify_file.close()

