#!/bin/bash

for dr in $(find . -name .latexmkrc | cat <(echo ".") - | xargs dirname | sort -u); do
        d=$(realpath $dr) 
        bd=$(realpath build/$dr)
        pushd $d
        mkdir -p $bd 
        echo $d
        echo $bd
        latexmk -outdir=$bd "$@"
        popd
done


mkdir artifacts
for f in $(find build -name "*.pdf" ); do
 cp $f artifacts/
done
