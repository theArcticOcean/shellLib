# /bin/bash
# this script is used to implement progress bar simply.

glob=0
cnt=0
# put start: 0%[
echo -n -e 0%"  ["  # 5
# put end: move 26 bytes from start and output `]`, if we just move, the `]` would be delete. so we output 
#echo -n -e "\r\033[26C]"

for i in {1..20}; do echo -n " "; done
echo -n "]"

add(){
	glob=$(expr $glob + 1)
	sleep 0.1
}

Len(){
	num=$1
	hundred=$(expr $num / 100)
	ten=$(expr $num / 10)
	
	if [ $hundred -gt 0 ]; then
		return 3
	elif [ $ten -gt 0 ]; then
		return 2
	else
		return 1
	fi
}

while [ $glob -lt 20 ]; do
	add
	Len $glob
	length=$?
	cnt=$(expr $cnt + 5)

#deal rate start:
	echo -e -n "\r"
	if [[ $length -eq 1 ]]; then
		echo  -e -n $cnt%
	elif [[ $length -eq 2 ]]; then
		echo -e -n $cnt%
	else 
		echo -e -n $cnt%
	fi
#end rate start

#move right: 1. move glob bytes; 2. back one byte and output =>
	all=$(expr 5 + ${glob} )
	echo -e -n "\r\033[${all}C\b=>"
done
echo -e "\b]"
