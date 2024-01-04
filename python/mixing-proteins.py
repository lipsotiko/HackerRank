#!/bin/python3

import math
import os
import random
import re
import sys
from uu import Error

# https://www.hackerrank.com/challenges/pmix/problem
# Complete the 'pmix' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s
#  2. INTEGER k
#
# Constraints
# 1 <= N <= 1000000
# 1 <= K <= 1000000000

#     A   B   C   D
#     _   _   _   _
# A|  A   B   C   D
# B|  B   A   D   C
# C|  C   D   A   B
# D|  D   C   B   A

look_up = {
    'AA': 'A',
    'AB': 'B',
    'AC': 'C',
    'AD': 'D',
    'BA': 'B',
    'BB': 'A',
    'BC': 'D',
    'BD': 'C',
    'CA': 'C',
    'CB': 'D',
    'CC': 'A',
    'CD': 'B',
    'DA': 'D',
    'DB': 'C',
    'DC': 'B',
    'DD': 'A'
}

def pmix(s, k):
    i = 0
    while(i < k):
        s = next(s, k)
        i += 1
    return s

def next(prot, i):
    tmp = ''
    for idx, x in enumerate(prot):
        if (idx < len(prot) - 1):
            tmp += look_up[x + prot[idx + 1]]
        else:
            tmp += look_up[x + prot[0]]
    return tmp

def assertThat(expected, result):
    if (expected != result):
        raise Error('Expected does not match result', expected, result)
    else:
        print('Passed', expected, result)

print(sys.getrecursionlimit())
assertThat('DDDDA', pmix('AAAAD', 15))
assertThat('DDA', pmix('CBC', 10))
assertThat('AAAAABBAAAAAABB', pmix('ABABABABABABABA', 1000000000))
