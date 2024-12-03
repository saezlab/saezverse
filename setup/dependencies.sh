#!/bin/bash

# For building C-Python bindings
apt -y install libcurl4-openssl-dev python3-dev
# Extras for pypath
apt -y install python3-igraph libcairo2-dev pkg-config python3-pip

CRAN='options(repos = c(CRAN = "https://cloud.r-project.org"))'

echo "$CRAN" >> ~/.Rprofile

python -m venv ~/.saez
echo 'source ~/.saez/bin/activate' >> ~/.bashrc
source ~/.saez/bin/activate

# Python tools dependencies (unstated dependencies?)
pip install --no-warn-script-location bioservices numpy scipy statsmodels pycurl pycairo

# PHONEMeS dependencies
apt -y install coinor-cbc
Rscript --vanilla -e "$CRAN;"' BiocManager::install(c("BioNet", "hash", "tidyverse", "qvalue"), ask = FALSE)'

# LIANA dependencies
Rscript --vanilla -e "$CRAN;"' remotes::install_github("raivokolde/RobustRankAggreg")'

# R to python and back
Rscript --vanilla -e "$CRAN;"' install.packages("reticulate")'

pip install rpy2
