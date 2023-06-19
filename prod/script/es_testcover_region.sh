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

Testcover_filename=$ENVTOP/System/TESTCOVER/$ES_SERVER.tcz 
export Testcover_filename

location=$ENVTOP/System/tcreport
export location

logfile=$ENVTOP/logs/testcover_region.log
export logfile

rm -f $logfile
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "Filename      = " $Testcover_filename  >>$logfile 
echo  "RPT LOC       = " $location            >>$logfile 
 

cobtcreport $Testcover_filename reportloc\(./System/tcreport\)  verbs >>$logfile
echo "****"                                   >>$logfile

cat $logfile
	
exit