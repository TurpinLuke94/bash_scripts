#!/bin/bash
# A shell script to combine the mkdir and cd commands
# This file should be sourced

if [ "$#" -eq 0 ]
then
    echo mkcd: missing directory operand
    return 1
elif [ "$#" -gt 1 ]
then
    echo 'mkcd: only 1 argument permitted for the directory operand'
    echo Use \'mkdir\' to create multiple directories.
    return 1
else
    if mkdir -- "$1"
    then
        if cd -- "$1"
        then
            echo cd: changed working directory to \'"$1"\'
        else
            return 1
        fi
    else
        return 1
    fi
fi
