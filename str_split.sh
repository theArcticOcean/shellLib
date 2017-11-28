#! /bin/bash

test="hello world wei"
old_IFS=$IFS
IFS=' '
arr=($test)
i=0
len=${#arr[@]}
while [ $i -lt $len ]; do
	echo ${arr[$i]}
	i=$(expr $i + 1)
done
