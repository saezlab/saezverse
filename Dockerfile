FROM bioconductor/bioconductor_docker:RELEASE_3_13

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
COPY --chown=rstudio:rstudio setup setup
WORKDIR setup

RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
RUN sudo apt-get -y install python3 python3-pip
RUN pip3 install --user pypath-omnipath omnipath
RUN pip3 install --user git+https://github.com/saezlab/progeny-py.git
RUN pip3 install --user git+https://github.com/saezlab/dorothea-py.git

RUN chmod +x *.sh
RUN sudo bash dependencies.sh

RUN Rscript --vanilla install.R

WORKDIR /home/rstudio/
RUN rm -rf setup
