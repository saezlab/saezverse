#!/bin/bash

source ~/.saez/bin/activate
# Saez Python tools in PyPI
pip install --no-warn-script-location pypath-omnipath omnipath decoupler liana[common] networkcommons corneto
# Saez Python tools from git
pip install --no-warn-script-location git+https://github.com/saezlab/kinact.git
