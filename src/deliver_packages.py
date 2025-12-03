#!/usr/bin/env python

import sys
import numpy as np

_PRIME_LIST = []

def is_prime(number):
    if number < 2:
        return False
    for i in range(2, int(np.sqrt(number))):
        if number % i == 0:
            return False
    return True

def end_with_three(number):
    if number%10 == 3:
        return True
    return False

def average_five(number):
    tot = 0
    n_number = 0
    while number > 0:
        n_number += 1
        tot += number%10
        number = number // 10
    if tot == n_number*5:
        return True

def repeated(number):
    last_num = -1
    while number > 0:
        if number%10 == last_num:
            return True
        last_num = (number%10)
        number = number // 10
    return False


def no_nine(number):
    while number > 0:
        if (number % 10) == 9:
            return False
        number = number // 10
    return True

if __name__ == "__main__":
    segment_id = int(sys.argv[1])
    segment_file_in = sys.argv[2]
    segment_file_out = sys.argv[3]
    method = sys.argv[4]
    
    delivered = np.load(segment_file_in)
    segment_size = len(delivered)
    start = segment_id*segment_size
    end = (segment_id+1)*segment_size
    # print(delivered.sum())
    for i in range(start, end):
        if delivered[i-start]:
            continue
        if method == "prime":
            condition = is_prime(i)
        elif method == "end_three":
            condition = end_with_three(i)
        elif method == "average_five":
            condition = average_five(i)
        elif method == "repeat":
            condition = repeated(i)
        elif method == "nine":
            condition = no_nine(i)
        else:
            raise ValueError(f"Unknown method '{method}'")
        if condition:
            delivered[i-start] = 1
    np.save(segment_file_out, delivered)
            
        
