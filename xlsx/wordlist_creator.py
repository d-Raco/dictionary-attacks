#!/usr/bin/python

''' Reduce and permutate operation '''

import sys

def print_with_nums(s):
    ''' Given a string, concatenate all possible numbers from 00 to 99 '''
    for i in range(0, 10):
        for j in range(0, 10):
            print s + str(i) + str(j)


def print_cases(s):
    ''' Call print_with_nums with all the needed case types '''
    print_with_nums(s)
    print_with_nums(s.upper())
    print_with_nums(s.capitalize())


def print_combinations(s):
    ''' Concatenate '&' at the beginning of a string and call the permutation methods '''
    s = '&' + s
    print_cases(s)

    # Given a string, create all possible substitutions where i = 1, e = 3, o = 0
    if('i' in s):
        print_cases(s.replace('i', '1'))
        if('e' in s):
            print_cases(s.replace('i', '1').replace('e', '3'))
            if('o' in s):
                print_cases(s.replace('i', '1').replace('e', '3').replace('o', '0'))
        if('o' in s):
            print_cases(s.replace('i', '1').replace('o', '0'))
    if('e' in s):
        print_cases(s.replace('e', '3'))
        if('o' in s):
            print_cases(s.replace('e', '3').replace('o', '0'))
    if('o' in s):
        print_cases(s.replace('o', '0'))
    


# Delete the words whose length exceeds 8 characters and call the combination functions
for line in sys.stdin: 
    word = line.split()[0] 
    if (len(word) <= 8):
        print_combinations(word)
           