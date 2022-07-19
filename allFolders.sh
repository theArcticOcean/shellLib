#! /usr/bin/bash

dirs=()
find . -type d -print0 >tmpfile
while IFS=  read -r -d $'\0'; do
    dirs+=("$REPLY")
done < tmpfile

#echo ${dirs[@]}
#echo ${#dirs[@]}

dirArray=()
len=${#dirs[*]}
for(( i=0;i<${len};i++ )); do
    str=${dirs[$i]}
    if [[ "${str:0:3}" = ./. ]]; then
        continue
    fi
    dirArray+=("${str}")
done

for(( i=0;i<${#dirArray[*]};i++)); do
    echo ${dirArray[$i]}
done
