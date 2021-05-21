FROM bioconductor/bioconductor_docker:devel

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
COPY --chown=rstudio:rstudio setup setup
WORKDIR setup

RUN sudo apt-get -y upgrade

RUN chmod +x *.sh
RUN sudo bash dependencies.sh

RUN Rscript --vanilla install.R

WORKDIR /home/rstudio/
RUN rm -rf setup
