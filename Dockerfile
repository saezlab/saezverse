FROM bioconductor/bioconductor_docker:RELEASE_3_20

ENV PASSWORD=saezlab

WORKDIR /home/rstudio/
RUN echo 'export PATH="/home/rstudio/.local/bin:$PATH"' >> ~/.bashrc
RUN echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> ~/.profile
COPY setup setup
WORKDIR setup

RUN apt -y update
RUN apt -y upgrade
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2

RUN Rscript -e 'options(repos = c(CRAN = "https://cloud.r-project.org")); BiocManager::install(ask = FALSE)'

RUN chmod +x *.sh
RUN bash dependencies.sh

RUN bash installpy.sh

RUN bash installr.sh


WORKDIR /home/rstudio/
RUN rm -rf ~/.cache/pip
RUN rm -rf setup
