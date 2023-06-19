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

logfile=$ENVTOP/logs/unload_region_catalog.log
export logfile

rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile 
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile 

 if [[ -f  $ENVTOP/System/catalog/catalog.dat ]]; then    
    rebuild -n $ENVTOP/System/catalog/catalog.dat >>$logfile 
 fi
 if [[ -f  $ENVTOP/System/catalog/SPLDSN.dat ]]; then    
   rebuild -n $ENVTOP/System/catalog/SPLDSN.dat  >>$logfile 
 fi
if [[ -f  $ENVTOP/System/catalog/SPLMSG.dat ]]; then    
   rebuild -n $ENVTOP/System/catalog/SPLMSG.dat  >>$logfile 
 fi
 if [[ -f  $ENVTOP/System/catalog/SPLJOB.dat ]]; then    
   rebuild -n $ENVTOP/System/catalog/SPLJOB.dat  >>$logfile 
 fi
 if [[ -f  $ENVTOP/System/config/dfhdrdat   ]]; then  
    rebuild -n $ENVTOP/System/config/dfhdrdat     >>$logfile 
 fi
echo "****"                                   >>$logfile

cat $logfile
	
exit