#!/bin/bash

set -euo pipefail

# Creates a new file
touch results/metadata.tsv

#Displays the first line of the metadata
tail -n 1 "data/metadata.tsv"