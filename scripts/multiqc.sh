#!/bin/bash

set -euo pipefail

#Will create directory if necessary
mkdir -p "$2"

#MultiQC Container

CONTAINER=oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

#Input and Output

indir="$1"
outdir="$2"

#Run code 

apptainer exec "$CONTAINER" multiqc "$1" -o "$2"