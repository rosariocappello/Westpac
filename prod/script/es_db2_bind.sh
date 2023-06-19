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

logfile=$ENVTOP/logs/db2_bind.log
export logfile

rm -f $logfile
             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
  
db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD >>$logfile

cd $ENVTOP/dbrm/

ls *.bnd > $ENVTOP/script/bind_prog_list


exec 5< bind_prog_list
   for i in `ls *.bnd`
   do
      echo                           >>$logfile
      echo "binding program $i"      >>$logfile
      echo                           >>$logfile
      export PROGNAME=$(basename $i .bnd)

     db2 rebind $PROGNAME
     return_code=$?

     echo "Db2 Bind  for " $i " = " $return_code  >>$logfile

   done

rm -f $ENVTOP/script/bind_prog_list

cat $logfile

exit