import sys
import numpy as np

if __name__ == "__main__":
    segment_id = int(sys.argv[1])
    segment_size = int(sys.argv[2])
    segment_file_out = sys.argv[3]

    delivered = np.zeros(segment_size, dtype=np.int32)
    np.save(segment_file_out, delivered)
