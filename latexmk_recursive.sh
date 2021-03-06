#!/bin/bash

mkdir -p build
for dr in $(find . -name .latexmkrc | cat <(echo ".") - | xargs dirname | sort -u); do
        d=$(realpath $dr) 
        mkdir -p build/$dr
        bd=$(realpath build/$dr)
        pushd $d
        echo $d
        echo $bd
        latexmk -outdir=$bd "$@"
        popd
done


mkdir artifacts
for f in $(find build -name "*.pdf" ); do
 cp $f artifacts/
done
