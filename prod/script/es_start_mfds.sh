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

logfile=$ENVTOP/logs/start_es_mfds.log
export logfile
rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   

. /var/microfocuslicensing/bin/restartboth.sh       >>$logfile

mfds &                                              >>$logfile

db2start                                            >>$logfile

ps -ef | grep 'casmgr32' | grep -v 'grep' | awk '{print $2}' | xargs kill -9  >>$logfile
casstart /r$ES_SERVER                               >>$logfile


  if [ $START_ES_REMOTE = 'Y' ]; then
    . /opt/microfocus/EnterpriseDeveloper/remotedev/startrdoserver    >>$logfile
  fi 
  
echo "****"                                         >>$logfile

cat $logfile
	
exit