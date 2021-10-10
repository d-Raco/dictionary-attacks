#!/bin/bash

COUNTER=1

while read line; 
do 
    unzip -P $line flag.zip; 
    if [ $? = 0 ]
    then
        echo found
        echo $line >> found.txt
        break
    fi
    echo $COUNTER $line
    COUNTER=$(( COUNTER + 1 ))
done < passwords.txt