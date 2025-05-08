#!/bin/bash

notify-send "Remember to study dude, not only for yourself, but for all of your beloved ones"

model_name="resnet18"
echo ${model_name^^}
echo "$model_name^^"
unset model_name

read -p "Nhap a > b > c" a b c
if (( a > b && b > c )); then
   echo "$a > $b > $c"
else
   echo "you have math issue"
fi
