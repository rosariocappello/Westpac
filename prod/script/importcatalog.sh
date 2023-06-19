#!/bin/bash
set -x 
#
# export Catalog
#
# Modification History
# --------------------
# 21-Apr-2023   Rosario Cappello      Original version

export LOC_CAT=/home/db2inst1/MLC/prod/System/catalog
export LOC_XML=/home/db2inst1/MLC/prod/System/xml
export COBLOC=/opt/microfocus/EnterpriseDeveloper/bin
export LOGFILE=$LOC_CAT/mfexpcat.log

export COBMODE=32
echo   COBMODE=$COBMODE                                       >>$LOGFILE

. $COBLOC/cobsetenv

cat $COBLOC/cobsetenv                                         >>$LOGFILE

if [ -f $LOGFILE ]  
  then 
    echo 'Exists'   $LOGFILE 
    rm  -f          $LOGFILE
    touch           $LOGFILE
fi

chmod 777 $LOGFILE

 
if [ -d $LOC_CAT/new/catalog ]  
  then 
    echo 'Exists' $LOC_CAT/new                            >>$LOGFILE
    rm   -f       $LOC_CAT/new/*.*
  else 
    echo 'Not found'  $LOC_CAT/new                           >>$LOGFILE
    mkdir      $LOC_CAT/new
    chmod 777  $LOC_CAT/new
fi

export MFSYSCAT=$LOC_CAT/new/catalog.dat

export Start_Date=$(date +%Y-%m-%d_%H-%M-%S)      
echo "Start Mfcatimp Date " $Start_Date                         >>$LOGFILE

export MFSYSCAT=$LOC_CAT/new/catalog.dat

mfcatxml "func(imp) infile($LOC_XML/catalog.xml)"          >>$LOGFILE
echo done $LOC_XML/catalog.xml  


export END_Date=$(date +%Y-%m-%d_%H-%M-%S)  

echo "End Mfcatexp Date " $END_Date                            >>$LOGFILE
 
ls -al  $LOC_CAT/new                                           >>$LOGFILE

cat $LOGFILE
exit