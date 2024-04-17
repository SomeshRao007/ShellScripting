#!/bin/bash

#string='1.1.1.1';
read -p "enter IP" string
if [[ $string =~ .*:.* ]]
then
  printf "IPv4"
else
  printf "IDK"
fi
