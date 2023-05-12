import argparse
import os

def process_args() -> str:
    parser = argparse.ArgumentParser("Parser for ZKBoo raw proof and verify times.")
    parser.add_argument('-i', '--input', action='store', dest='input_file', help="the input file (relative path)", required=True)
    
    args = parser.parse_args()
    
    curr_path = os.getcwd()
    input_path = os.path.join(curr_path, args.input_file)
    return input_path

if __name__ == '__main__':
    file_path = process_args()
    print(file_path)
