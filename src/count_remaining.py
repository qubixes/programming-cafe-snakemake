import sys
import numpy as np


if __name__ == "__main__":
    output_file = sys.argv[-1]
    input_files = sys.argv[1:-1]

    delivered = 0
    total = 0
    for in_file in input_files:
        data = np.load(in_file)
        delivered += data.sum()
        total += len(data)
    with open(output_file, "w") as handle:
        handle.write(f"Delivered: {delivered}\nTotal: {total}\n")
