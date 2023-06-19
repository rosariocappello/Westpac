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


ES_SERVER=$ES_DEF_SERVER
export ES_SERVER

Region_File=$ENVTOP/System/catalog/$ES_SERVER.xml
export Region_File
 
MFSYSCAT=$ENVTOP/System/catalog/catalog.dat
export MFSYSCAT

logfile=$ENVTOP/logs/unload_region_catalog.log
export logfile
rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "Region_File   = " $Region_File         >>$logfile 
echo  "MFSYSCAT      = " $MFSYSCAT            >>$logfile 

rm -f $Region_File

cd $ENVTOP/System/catalog/

mfcatxml "FUNC(exp)" "OUTFILE($ES_SERVER.xml)" "RELATIVE_PATH(Y)"

 cat  $Region_File                           >>$logfile 

cd $ENVTOP/script                      

echo "****"                                   >>$logfile

cat $logfile
	
exit