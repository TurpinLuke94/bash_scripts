#!/bin/bash
# A shell script to wrap the touch command

if [ "$#" -eq 0 ]
then
    echo touch: missing file operand
    exit 1
fi

errors=0
counter=1
for file in "$@"
do
    echo file "${counter}":
    if [ -e "$file" ]
    then
        action='updated'
    else
        action='created'
    fi

    if touch -- "$file"
    then
        echo touch: "$action" \'"$file"\'
    else
        (( errors++ ))
    fi
    (( counter++ ))
done

echo $(( "$#" - "$errors" )) of "$#" file\(s\) sucessfully created or updated
if [ "$errors" -gt 0 ]
then
    exit 1
fi
