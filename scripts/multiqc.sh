#!/bin/bash

set -euo pipefail

#Will create directory if necessary
mkdir -p results/multiqc

#Run MultiQC

 apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc results/fastqc/ -o results/multiqc/ 
