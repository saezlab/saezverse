FROM bioconductor/bioconductor_docker:RELEASE_3_13

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
COPY --chown=rstudio:rstudio setup setup
WORKDIR setup

ARG DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
# Python
RUN sudo apt-get -y install python3 python3-pip
# For building C-Python bindings
RUN sudo apt-get -y install libcurl4-openssl-dev python3-dev
# Extras for pypath
RUN sudo apt-get -y install python3-igraph libcairo2-dev pkg-config

# Must be installed before the others (unstated dependencies?)
RUN pip3 install --user numpy scipy statsmodels pycurl pycairo
# Saez Python tools in PyPI
RUN pip3 install --user pypath-omnipath omnipath bioservices
# Saez Python tools from git
RUN pip3 install --user git+https://github.com/saezlab/progeny-py.git
RUN pip3 install --user git+https://github.com/saezlab/dorothea-py.git
RUN pip3 install --user git+https://github.com/saezlab/kinact.git

RUN chmod +x *.sh
RUN sudo bash dependencies.sh

RUN Rscript --vanilla install.R

WORKDIR /home/rstudio/
RUN rm -rf setup
