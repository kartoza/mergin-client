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

# Allow for variable numbers of arguments to be passed on to mergin
mergin $1 $2 $3 $4 $5 $6
