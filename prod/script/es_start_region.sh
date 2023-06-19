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

logfile=$ENVTOP/logs/start_es_region.log
export logfile
rm -f $logfile


ES_EMP_EXIT_1=cassclue.so
export ES_EMP_EXIT_1
echo  "ES_EMP_EXIT_1 = " $ES_EMP_EXIT_1       >>$logfile


LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ENVTOP/System/mfbsiload
export LD_LIBRARY_PATH
echo  "LD_LIBRARY_PATH  = " $LD_LIBRARY_PATH   >>$logfile

COBPATH=$ENVTOP/System/mfbsiload
export COBPATH
echo  "COBPATH = " $COBPATH  >>$logfile
 
CLUEDEBUG="Y"
export CLUEDEBUG

echo "****"                                     >>$logfile
echo  "ES_SERVER       = " $ES_SERVER           >>$logfile
echo  "COBMODE         = " $COBMODE             >>$logfile
echo  "VERSION         = " $MFVERBLD            >>$logfile
echo  "DATE            = " ${CURRENTDATE}       >>$logfile 
echo  "USER            = " $MF_USER             >>$logfile   
echo  "ES_EMP_EXIT_1   = " $ES_EMP_EXIT_1       >>$logfile  
echo  "LD_LIBRARY_PATH = " $LD_LIBRARY_PATH     >>$logfile  
echo  "CLUEDEBUG       = " $CLUEDEBUG           >>$logfile  
 

casclsec casstart /r$ES_SERVER   /uUSR /pPWD    >>$logfile

echo "****"                                   >>$logfile

cat $logfile
	
exit