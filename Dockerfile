FROM bioconductor/bioconductor_docker:RELEASE_3_13

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
RUN sudo -H -u rstudio echo 'export PATH="/home/rstudio/.local/bin:$PATH"' >> /home/rstudio/.bashrc
RUN sudo -H -u rstudio echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> /home/rstudio/.profile
COPY --chown=rstudio:rstudio setup setup
WORKDIR setup

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
# Python
RUN apt-get -y install python3 python3-pip
# For building C-Python bindings
RUN apt-get -y install libcurl4-openssl-dev python3-dev
# Extras for pypath
RUN apt-get -y install python3-igraph libcairo2-dev pkg-config

RUN apt-get clean

# Must be installed before the others (unstated dependencies?)
RUN sudo -H -u rstudio pip3 install --user --no-warn-script-location \
    numpy scipy statsmodels pycurl pycairo
# Saez Python tools in PyPI
RUN sudo -H -u rstudio pip3 install --user --no-warn-script-location \
    pypath-omnipath omnipath bioservices
# Saez Python tools from git
RUN sudo -H -u rstudio pip3 install --user --no-warn-script-location \
    git+https://github.com/saezlab/progeny-py.git
RUN sudo -H -u rstudio pip3 install --user --no-warn-script-location \
    git+https://github.com/saezlab/dorothea-py.git
RUN sudo -H -u rstudio pip3 install --user --no-warn-script-location \
    git+https://github.com/saezlab/kinact.git
RUN rm -rf /home/rstudio/.cache/pip

RUN chmod +x *.sh
RUN sudo bash dependencies.sh

RUN Rscript --vanilla install.R

WORKDIR /home/rstudio/
RUN rm -rf setup
