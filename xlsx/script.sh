#!/bin/bash

# Crack the password of an encrypted excel file using JohnTheRipper and a wordlists generated from some permutations of words found on Wikipedia

# Get the words from the Wikipedia page, perform the permutations and save it to wordlists.txt
cewl -d 0 -m 6 --lowercase https://en.wikipedia.org/wiki/Petro_Poroshenko | python wordlist_creator.py > wordlist.txt

# Extract the hash of the excel file using JohnTheRipper (sed used to delete the name of the file and only leave the hash)
python /usr/share/john/office2john.py ./Petro_Poroshenko_enc.xlsx | sed 's/^[^:]*://' > excel_hash.txt

# Crack the password through JohnTheRipper using the hash and wordlist previously obtained
john --wordlist=wordlist.txt excel_hash.txt

#Show the cracked password
john --show excel_hash.txt