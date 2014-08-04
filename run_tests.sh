#!/usr/bin/env bash

for t in $(find . -name 'test.sh');
do
    echo cd "$(dirname $t)"
    cd "$(dirname $t)"
    ./$(basename $t)
    cd -
done
