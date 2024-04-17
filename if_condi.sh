#!/bin/bash 

read -p "enter a" a  
read -p "enter b" b
read -p "enter c" c

if [ $a -gt 40 -o $b -lt 60 ]

	then 
		echo ""a samll b big
else 
	echo ""notsatisfied
fi
