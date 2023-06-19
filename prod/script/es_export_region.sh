#!/bin/bash
# *********************************************
# MLC command file
# *********************************************
#
# V00  - Initial Version           Rc Nov '22'
#
# *********************************************

# Create Enterprise Developer COBOL Environment

.  setenv_global.sh

if [ $MF_DEBUG_OPTION  = 'Y' ]; then
  set -x
fi

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP

if [[ -z $1 ]];
then 
    ES_SERVER=$ES_DEF_SERVER
else
    ES_SERVER=$1
fi
export ES_SERVER

ES_CIS_DEF=$ENVTOP/System/config
export ES_CIS_DEF

logfile=$ENVTOP/logs/export_region_def.log
export logfile

rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "ES_CIS_DEF    = " $ES_CIS_DEF          >>$logfile 

echo  "casesxml      =   casesxml export -v -s -a -c -o -t60  -w. -r$ES_SERVER -d$ES_CIS_DEF"   >>$logfile 
casesxml export -v -s -a -c -o  -w. -r$ES_SERVER -d$ES_CIS_DEF      

echo "****"                                   >>$logfile

cat $logfile
	 
exit
