#!/bin/bash

if [ -f singularity.def ]
then
    echo "singularity.def file found"
else
    echo "ERROR, singularity.def file not found!"
    exit 1
fi

grep -v "NOTFORFINAL" singularity.def > tmp.def
IMAGENAME=final_$(basename $(dirname "$(pwd)"))_$(date +%Y-%m-%d_%H_%M_%S).simg
echo "start downloading..."
singularity build -f --fakeroot $IMAGENAME tmp.def
echo "download finished, let's clean that mess..."
rm ./tmp.def
echo "done"
