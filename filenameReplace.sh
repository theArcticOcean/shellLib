#! /usr/bin/bash
if [ $# -lt 2 ]; then
        echo "useage: script <oldName> <newName>"
        exit 1
fi
oldName=$1
newName=$2
var=$(ls)
beforeList=($var) # to array
len=${#beforeList[@]} # array length
afterList=($(ls |sed s/${oldName}/${newName}/g))
#echo ${afterList[@]}

i=0
while [ $i -lt $len ]; do
        echo ${beforeList[$i]}" --> "${afterList[$i]}
        mv ${beforeList[$i]} ${afterList[$i]} 2>/dev/null
        i=$(expr $i + 1)
done
