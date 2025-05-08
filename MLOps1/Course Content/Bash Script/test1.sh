#!/bin/bash
echo "val 1 = $1"
echo "val 2 = $2"
echo $SHELL

epoch=$1
if [ "$epoch" -ne 128 ]; then
    echo "Epoch != 128"
fi

echo "hello" | tr '[:lower:]' '[:upper:]'

read -p "Enter value for var: " var
var=${var:-0}
echo "var = $var"
if [ "$var" -gt 100 ]; then
   echo "$var > 100"
fi

date


# Model training script

train_data=$3
test_data=$4

echo "Train: $train_data"
echo "Test: $test_data"

# python train.py --train "$train_data" --test "$test_data"


read -p "run to which num?" n
n=${n:-0}
echo "value of n is $n"
for ((i=0; i<n; i++)); do
   echo $i
done

while [ "$n" -ne 0 ]; do
   echo "n=$n"
   n=$((n-1))
done


path="/home/user/documents"
echo "Updated path: ${path/home/house}"


