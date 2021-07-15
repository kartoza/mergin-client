#!/bin/bash
export PYTHONPATH=/usr/local/lib/python3.8/site-packages
# First get a token
mergin login --login $MERGIN_USER --password $MERGIN_PASSWORD | grep "export" > /tmp/creds.txt
source /tmp/creds.txt

# If pull is the first arg, iterate through the directories in /home/mergin
# Running pull in each
if [ $1 = "pull" ]
  then
    echo "Updating all projects"
    for d in /home/mergin/*/ ; do
      echo "$d"
      cd $d
      mergin pull
    done
    exit
fi

# If download-shared is the first arg, iterate through the 
# projects shared with the provided user, checking each out into 
# directories in /home/mergin
if [ $1 = "download-shared" ]
  then
    echo "Downloading all projects shared with $MERGIN_USER"
    cd /home/mergin
    for p in `mergin list-projects --flag shared | awk '{ print $1 "/" $3 " /home/mergin/"$3 }'`  ; do
      echo "Downloading $p"
      mergin download $p 
    done
    exit
fi

# If none of the special cases above match, delegate the arguments
# to the normal mergin command, passing along any args
# Allow for variable numbers of arguments to be passed on to mergin
# $@ passes all positional params to the command
# See /usr/src/geonode/entrypoint.sh
mergin $@
