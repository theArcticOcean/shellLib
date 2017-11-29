#! /bin/bash

var=$(ls |tr " " "\n")
# default IFS is '\n'
beforeList=($var)
len=${#beforeList[@]}
afterList=($(ls |awk '{ print $1 }' |sed 's/netmusicapp/XMLABookApp/g' |tr " " "\n"))

i=0
while [ $i -lt $len ]; do
	echo ${beforeList[$i]}" --> "${afterList[$i]}
	mv ${beforeList[$i]} ${afterList[$i]} 2>/dev/null
	i=$(expr $i + 1)
done
