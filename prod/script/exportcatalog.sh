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

if [ -d $LOC_XML ]  
  then 
    echo 'Exists' $LOC_XML                                     >>$LOGFILE
    rm   -f       $LOC_XML/*.xml
   
  else 
    echo 'Not found'  $LOC_XML                                 >>$LOGFILE
    mkdir      $LOC_XML
   
fi

chmod 777 $LOC_XML
chmod 777 *.xml

export Start_Date=$(date +%Y-%m-%d_%H-%M-%S)      
echo "Start Mfcatexp Date " $Start_Date                        >>$LOGFILE



export MFSYSCAT=$LOC_CAT/catalog.dat
echo   MFSYSCAT=$MFSYSCAT                                      >>$LOGFILE
chmod 777 *.xml
echo   mv *.xml  $LOC_XML/                                     >>$LOGFILE
       mv *.xml  $LOC_XML/

rm -f    $LOC_XML/CATALOG*.xml                                 >>$LOGFILE
echo mfcatxml "func(exp) outfile(catalog.xml)"                 >>$LOGFILE
     mfcatxml "func(exp) outfile(catalog.xml)"                 >>$LOGFILE

chmod 777 *.xml
mv *.xml  $LOC_XML/

export END_Date=$(date +%Y-%m-%d_%H-%M-%S)  

echo "End Mfcatexp Date " $END_Date                            >>$LOGFILE
 
ls -al  $LOC_XML                                                >>$LOGFILE

cat $LOGFILE
exit