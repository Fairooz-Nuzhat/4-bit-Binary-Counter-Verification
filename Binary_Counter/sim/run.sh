#!/bin/bash

source /tools/script/bashrc
source /tools/script/bashrc_ius_15.2.08
export WORKDIR=$PWD/.. 
MODE=$1
test_case=$2;
if [[ $MODE == "batch" ]]; then irun -timescale 1ns/1ps -f filelist.f -access +rwc +$test_case
elif [[ $MODE == "gui" ]]; then irun -timescale 1ns/1ps -f filelist.f -access +rwc -gui +$test_case
elif [[ $MODE == "coverage" ]]; then
irun -timescale 1ns/1ps -f filelist.f -access +rwc +$test_case -coverage all -covtest $test_case
fi
grep "*W" irun.log > "warning.txt"

