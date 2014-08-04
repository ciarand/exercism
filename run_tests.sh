#!/usr/bin/env bash

for t in "$(find . -name 'test.sh')";
do
    $t
done
