#! /bin/bash
# this script is used to implement progress bar simply.

glob=0
echo -n ">"

add(){
	glob=$(expr $glob + 1)
	sleep 0.1
}

while [ $glob -le 20 ]; do
	add
	echo -e -n "\b=>"
done

echo ""
