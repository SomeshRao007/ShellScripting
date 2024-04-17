#!/bin/bash

i=1
while [[ $i -le 10 ]] ; do
	printf "$i"
	((i +=1))
done

