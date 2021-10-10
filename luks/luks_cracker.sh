#!/bin/bash

COUNTER=1

while read line; 
do 
    printf $line | sudo cryptsetup luksOpen --test-passphrase encrypted_volume.iso; 
    if [ $? = 0 ]
    then
        echo found
        echo $line >> found.txt
        break
    fi
    echo $COUNTER $line
    COUNTER=$(( COUNTER + 1 ))
done < passwords.txt