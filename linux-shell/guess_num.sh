#!/bin/bash
#author luoxf
#wirte time 202011102

#guess random num in 1~100
echo "===================================================="
echo "This is a game ,The Computer will random a number"
echo "you can choose a number in [1-99]"
echo "How many times can you guess right?"
echo "===================================================="
rand=`echo $((RANDOM%100))`

while true
do
    let i++
read -p "Please input a number in [1~99]:" num
if [ $num -gt $rand ]
    then
    echo "Your number is greater"
elif [ $num -lt $rand ]
    then
    echo "Your number is less"
else
    echo "Your number is Right! You totol guess $i times"
    exit
fi
done