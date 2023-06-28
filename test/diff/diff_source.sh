#!/bin/bash

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res -P 2
if [ ! $? ]; then
    exit 1
fi

diff test/diff/$file.res output_files/$file.res
if [ !  $? ]; then
    exit 2
fi

rm test/diff/$file.res
