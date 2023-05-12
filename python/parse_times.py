import argparse
import os
import csv

def process_args() -> str:
    parser = argparse.ArgumentParser("Parser for ZKBoo raw proof and verify times.")
    parser.add_argument('-p', '--proof',  action='store', dest='proof',  help="the proof input file (relative path)")
    parser.add_argument('-v', '--verify', action='store', dest='verify', help="the verify input file (relative path)")
    parser.add_argument('-o', '--output', action='store', dest='output', help="the output file", default='out.csv')
    
    args = parser.parse_args()

    proof_file  = args.proof
    verify_file = args.verify
    if proof_file == None and verify_file == None:
        raise Exception("At least one of proof and verify should be specified as input. Help: python3 parse_times.py -h")
    
    curr_path   = os.getcwd()
    proof_path  = None if proof_file  == None else os.path.join(curr_path, proof_file)
    verify_path = None if verify_file == None else os.path.join(curr_path, verify_file)
    
    return (proof_path, verify_path)

def get_times(path: str, match: str) -> list[int]:
    proof_file = open(path)
    proof      = proof_file.readlines()
    proof_file.close()

    times: list[int] = []
    idx = len(match)

    for line in proof:
        is_total_time = line[:idx] == match
        if is_total_time:
            times.append(int(line[idx:]))
    
    return times

if __name__ == '__main__':
    (proof_path, verify_path) = process_args()
    
    fields = ['Proof', 'Verify']

    rows = [[], []]
    
    if proof_path != None:
        times = get_times(proof_path, 'Total: ')
        rows[0] = times

    if verify_path != None:
        times = get_times(verify_path, 'Total time: ')
        rows[1] = times


    with open('GFG', 'w') as f:
        write = csv.writer(f)
        
        write.writerow(fields)
        write.writerows(rows)

