#!/bin/bash
# *********************************************
# MLC command file
# *********************************************
#
# V00  - Initial Version           Rc Nov '22'
#
# *********************************************

# Create Enterprise Developer COBOL Environment

ENVTOP=/opt/mlc
export ENVTOP

logfile=$ENVTOP/logs/start_es_region_stop.log
export logfile
rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   

casstop /r$ES_SERVER                         >>$logfile

echo "****"                                   >>$logfile

cat $logfile
	
exit