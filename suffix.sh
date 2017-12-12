#! /bin/bash
cmd1=$(ls |grep c.gz)
cmd2=$(ls |grep c.gz |sed 's/\.gz//g')

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
	echo ${array1[$i]}"==>"${array2[$i]}
	mv ${array1[$i]} ${array2[$i]}
done
