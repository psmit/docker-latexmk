#!/bin/bash

for d in $(find . -name .latexmkrc | cat <(echo ".") - | xargs dirname | sort -u); do
        pushd $d
        latexmk -outdir=build/$d "$@"
        popd
done
