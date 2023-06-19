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
    ES_SERVER=$S_DEF_SERVER
else
    ES_SERVER=$1
fi
export ES_SERVER

Region_File=$ENVTOP/System/catalog/$ES_SERVER.xml
export Region_File
 
 . /opt/microfocus/EnterpriseDeveloper/bin/cobsetenv

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

 

cd $ENVTOP/System/catalog/

mfcatxml 'FUNC(imp)' 'INFILE(mlc.xml)' 'RELATIVE_PATH(Y)'
 
cd $ENVTOP/script                      

echo "****"                                   >>$logfile

cat $logfile
	
exit