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
 
MergeArchloc=$ENVTOP/System/mergeespool
export MergeArchloc

ArchSystemLOC=$ENVTOP/ArchSystem
export ArchSystemLOC
 
 . /opt/microfocus/EnterpriseDeveloper/bin/cobsetenv

logfile=$ENVTOP/logs/merge_region_catalog.log
export logfile

rm -f $logfile

echo "****"                                   >>$logfile
echo  "ES_SERVER     = " $ES_SERVER           >>$logfile
echo  "COBMODE       = " $COBMODE             >>$logfile
echo  "VERSION       = " $MFVERBLD            >>$logfile
echo  "DATE          = " ${CURRENTDATE}       >>$logfile 
echo  "USER          = " $MF_USER             >>$logfile   
echo  "MergeArchloc  = " $MergeArchloc        >>$logfile 
echo  "ArchSystemLOC = " $ArchSystemLOC       >>$logfile 

cp   $MergeArchloc/m_catalog.dat  $ArchSystemLOC/catalog/catalog.dat 
cp   $MergeArchloc/M_SPLDSN.dat   $ArchSystemLOC/catalog/SPLDSN.dat
cp   $MergeArchloc/M_SPLJOB.dat   $ArchSystemLOC/catalog/SPLJOB.dat
cp   $MergeArchloc/M_SPLMSG.dat   $ArchSystemLOC/catalog/SPLMSG.dat 
cp   $MergeArchloc/M_SPLOUT.dat   $ArchSystemLOC/catalog/SPLOUT.dat 
cp   $MergeArchloc/M_SPLOUTX.dat  $ArchSystemLOC/catalog/SPLOUTX.dat
cp   $MergeArchloc/M_SPLSUB.dat   $ArchSystemLOC/catalog/SPLSUB.dat  

echo "****"                                   >>$logfile

cat $logfile
	
exit