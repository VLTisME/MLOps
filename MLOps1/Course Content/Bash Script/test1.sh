#!/bin/bash
echo "val 1 = $1"
echo "val 2 = $2"
echo $SHELL

epoch = $3
if (epoch != 128); then
    echo "Epoch != 128"
