#!/bin/bash

# For building C-Python bindings
apt -y install libcurl4-openssl-dev python3-dev
# Extras for pypath
apt -y install python3-igraph libcairo2-dev pkg-config


# Python tools dependencies (unstated dependencies?)
pip3 install --user --no-warn-script-location bioservices numpy scipy statsmodels pycurl pycairo

# PHONEMeS dependencies
apt -y install coinor-cbc
Rscript --vanilla -e 'BiocManager::install(c("BioNet", "hash", "tidyverse", "qvalue"), ask = FALSE)'

# R to python and back
Rscript --vanilla -e 'install.packages("reticulate")'
pip3 install rpy2
