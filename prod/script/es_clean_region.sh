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

logfile=$ENVTOP/clean_es_server.log
export logfile

rm -f $logfile
             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
 
 
 rm -f $ENVTOP/failedbuild/*               >>$logfile
 rm -f $ENVTOP/listing/*                   >>$logfile
 rm -f $ENVTOP/failedbuild/*               >>$logfile
 rm -f $ENVTOP/System/ctf/logs/*           >>$logfile
 rm -f $ENVTOP/System/logs/*               >>$logfile
 rm -f $ENVTOP/logs/*                      >>$logfile
 rm -f $ENVTOP/System/TESTCOVER/*          >>$logfile
 rm -f $ENVTOP/System/tcreport/*           >>$logfile
 rm -f $ENVTOP/System/profile/*            >>$logfile
 rm -f $ENVTOP/logs/*                      >>$logfile
 rm -f $ENVTOP/script/mfcomp_bulk_log      >>$logfile
 rm -f $ENVTOP/script/cobol_prog_list      >>$logfile
 rm -f $ENVTOP/script/mfcomp_bulk_Status_log  >>$logfile
 rm -f $ENVTOP/script/mfcomp_bulk_failed_log  >>$logfile
 rm -f $ENVTOP/script/mfrebuildMF.sh          >>$logfile
 rm -f /var/mfcobol/es/$ES_SERVER/*            >>$logfile
	
echo "****"                                >>$logfile 
cat $logfile

rm -f $logfile

exit