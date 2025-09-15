#!/bin/bash

TEST_NAMES="testnames.txt"
while read -r test_case; do
if [[ -n "$test_case" ]]; then
./run.sh coverage $test_case
cat irun.log > "${test_case}.log"
fi
done<"$TEST_NAMES"
