#!/bin/bash

source ~/.saez/bin/activate
# Saez Python tools in PyPI
pip3 install --user --no-warn-script-location pypath-omnipath omnipath decoupler
# Saez Python tools from git
pip3 install --user --no-warn-script-location git+https://github.com/saezlab/kinact.git
