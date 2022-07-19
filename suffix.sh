#! /usr/bin/bash
set -e
if [ $# -lt 2 ]; then
    echo "useage: script <oldSuffix> <newSuffix>"
    exit 1
fi
oldSuffix=$1
newSuffix=$2
cmd1=$(ls)
cmd2=$(ls |sed s/${oldSuffix}/${newSuffix}/g)

array1=()
len1=0
for i in $cmd1; do
	array1[$len1]=$i
	len1=$(expr $len1 + 1)
done

array2=()
len2=0
for i in $cmd2; do
	array2[$len2]=$i
	len2=$(expr $len2 + 1)
done

for(( i=0;i<$len1;i++)); do
	if [ "${array1[$i]}" != "${array2[$i]}" ]; then
        echo ${array1[$i]}" ==> "${array2[$i]}
        mv ${array1[$i]} ${array2[$i]}
    fi
done
