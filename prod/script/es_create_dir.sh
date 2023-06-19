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

logfile=$ENVTOP/es_create_dir.log
export logfile
rm -f $logfile

DIRLOC=$ENVTOP/dir/mfdb2.dir
export DIRLOC
rm -f $DIRLOC

             
echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "DIRLOC        = " $DIRLOC              >>$logfile   
 

echo  "DB2(FORMAT=EUR,VALIDATE=BIND,HCO,BIND)"        >>$DIRLOC
echo  "db2(BINDDIR=$ENVTOP/dbrm)"                     >>$DIRLOC 
echo  "db2(ACCESS,ALLOW-NESTED)"                      >>$DIRLOC  
echo  "db2(DB=$ES_DB2_DB_NAME)"                       >>$DIRLOC
echo  "db2(PASS=$MF_DB2_USER.$ES_DB2_DB_PWD)"         >>$DIRLOC
echo  "db2(QUALIFIER=CLIENT)"                         >>$DIRLOC  
    
 
cat $DIRLOC                                     >>$logfile 


echo "****"                                      >>$logfile 
cat $logfile

rm -f $logfile

exit