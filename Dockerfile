FROM bioconductor/bioconductor_docker:RELEASE_3_13

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
RUN sudo -H -u rstudio echo 'export PATH="/home/rstudio/.local/bin:$PATH"' >> /home/rstudio/.bashrc
RUN sudo -H -u rstudio echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> /home/rstudio/.profile
COPY --chown=rstudio:rstudio setup setup
WORKDIR setup

RUN apt -y update
RUN apt -y upgrade
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2

RUN Rscript -e 'BiocManager::install(ask = FALSE)'

RUN chmod +x *.sh
RUN bash dependencies.sh

RUN bash installpy.sh

RUN Rscript --vanilla install.R


WORKDIR /home/rstudio/
RUN rm -rf .cache/pip
RUN rm -rf setup
