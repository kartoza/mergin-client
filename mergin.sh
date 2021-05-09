#!/bin/bash
export PYTHONPATH=/usr/local/lib/python3.8/site-packages
# First get a token
source `mergin-client login --login $MERGIN_USER --password $MERGIN_PASSWORD`

# Allow for variable numbers of arguments to be passed on to mergin
mergin $1 $2 $3 $4 $5 $6
