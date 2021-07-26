#!/bin/bash

# Saez Python tools in PyPI
pip3 install --user --no-warn-script-location pypath-omnipath omnipath bioservices
# Saez Python tools from git
pip3 install --user --no-warn-script-location git+https://github.com/saezlab/progeny-py.git \
	git+https://github.com/saezlab/dorothea-py.git \
	git+https://github.com/saezlab/kinact.git
