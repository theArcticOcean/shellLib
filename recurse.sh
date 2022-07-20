#! /usr/bin/bash

set -e
if [ -z "$1" ]; then
    echo "Usage: `basename $0` number"
    exit 1
fi

#define a function factorial
fact ()
{
    value=$1
    if [ $value -eq 1 ]; then
        result=1
    else
        para=$(expr $value - 1)
        rest=$(fact $para)
        result=$(expr $value \* $rest)
    fi

    echo $result
}

myValue=$( fact $1 )
echo "result is $myValue"
