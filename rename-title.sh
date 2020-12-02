#!/bin/bash

for f in *.org; do
    tname=${f%%.*};
    sed -i "1s/.*/#+title: $tname/" $f
done
