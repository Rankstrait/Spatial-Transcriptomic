# Spatial Transcriptomic

Project for spatial transcriptomics analysis.

## Structure

- data/ → raw data (not tracked by git)
- notebooks/ → analysis notebooks


## Setup

see requirments folder

YAML file contain library names
to replicate the spatialdata enviroment with YAML file: conda env create -f spatialdata.yml -n new_env_name 

TXT file contain library names and its specific version, more reproducible but less flexible
to replicate the spataildata enviroment with TXT file: conda create --name new_env_name --file spatialdata-spec.txt
