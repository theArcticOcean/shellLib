#! /usr/bin/bash
files=()
find . -name "*.gz" -print0 >tmpfile
while IFS=  read -r -d $'\0'; do
    files+=("$REPLY")
done < tmpfile

# echo ${files[@]} #print all
len=${#files[*]}
newFiles=()
for(( i=0;i<${len};i++ )); do
    newDir=$(echo ${files[$i]} |sed s/.gz/.txt/g)
    newFiles+=("$newDir")
done;

for(( i=0;i<${len};i++ )); do
    echo ${files[$i]}" ==> "${newFiles[$i]}
    cp "${files[$i]}" "${newFiles[$i]}"
done
