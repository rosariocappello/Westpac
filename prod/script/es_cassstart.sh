#!/bin/bash
# *********************************************
# MLC command file
# *********************************************
#
# V00  - Initial Version           Rc Nov '22'
#
# *********************************************

# Create Enterprise Developer COBOL Environment

set -x

ENVTOP=/home/db2inst1/MLC/prod/System
export ENVTOP


logfile=$ENVTOP/logs/start_es_region.log
export logfile
rm -f $logfile
touch $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   


process_name=casmgr32

if pgrep -x "$process_name" > /dev/null
then
    echo "$process_name is already running"    >>$logfile
else
    casstart /r$ES_SERVER           >>$logfile
fi


casstart /r$ES_SERVER                         >>$logfile

echo "****"                                   >>$logfile

cat $logfile
	
 