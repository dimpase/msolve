#!/bin/bash

file=bug-chgvar

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -l 2 -t 1
if [ $? -gt 0 ]; then
    exit 1
fi

diff test/diff/$file.res output_files/$file.res
if [ $? -gt 0 ]; then
    exit 2
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -p 256 -l 2 -t 1
if [ $? -gt 0 ]; then
    exit 3
fi

diff test/diff/$file.res output_files/$file.p256.res
if [ $? -gt 0 ]; then
    exit 4
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -p 256 -l 2 -t 2
if [ $? -gt 0 ]; then
    exit 5
fi

diff test/diff/$file.res output_files/$file.p256.res
if [ $? -gt 0 ]; then
    exit 6
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -l 2 -t 2
if [ $? -gt 0 ]; then
    exit 21
fi

diff test/diff/$file.res output_files/$file.res
if [ $? -gt 0 ]; then
    exit 22
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -l 44 -t 1
if [ $? -gt 0 ]; then
    exit 41
fi

diff test/diff/$file.res output_files/$file.res
if [ $? -gt 0 ]; then
    exit 42
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -l 44 -t 2
if [ $? -gt 0 ]; then
    exit 61
fi

diff test/diff/$file.res output_files/$file.res
if [ $? -gt 0 ]; then
    exit 62
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -p 256 -l 44 -t 1
if [ $? -t 0 ]; then
    exit 63
fi

diff test/diff/$file.res output_files/$file.p256.res
if [ $? -gt 0 ]; then
    exit 64
fi

$(pwd)/msolve -f input_files/$file.ms -o test/diff/$file.res \
      -p 256 -l 44 -t 2
if [ $? -gt 0 ]; then
    exit 65
fi

diff test/diff/$file.res output_files/$file.p256.res
if [ $? -gt 0 ]; then
    exit 66
fi

rm test/diff/$file.res
