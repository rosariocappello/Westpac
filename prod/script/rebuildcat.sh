#!/bin/sh
#
# Rebuild Catalog
#
# Modification History
# --------------------
# 21-04-23  Rosario Cappello      Original version

set -x

export BASELOC=/home/db2inst1/ZMLC/prod/System/mergeespool
export CATALOGDIR=$BASELOC
export COBLOC=/opt/microfocus/EnterpriseDeveloper/bin
export LOGFILE=$CATALOGDIR/rebuild.log

export COBMODE=32
echo COBMODE=$COBMODE >>$LOGFILE

. $COBLOC/cobsetenv

cat $COBLOC/cobsetenv >>$LOGFILE

if [ -f $LOGFILE ]; then
  echo 'Exists' $LOGFILE
  rm -f $LOGFILE
  touch $LOGFILE
fi

export Start_Date=$(date +%Y-%m-%d_%H-%M-%S) >>$LOGFILE

ls -al $CATALOGDIR/*.dat >>$LOGFILE

if [ -f $CATALOGDIR/m_catalog.dat ]; then
  echo rebuild -i $CATALOGDIR/m_catalog.dat >>$LOGFILE
  rebuild -i $CATALOGDIR/m_catalog.dat >>$LOGFILE
else
  echo 'File not found = ' $CATALOGDIR/m_catalog.dat >>$LOGFILE
fi

if [ -f $CATALOGDIR/M_SPLOUT.dat]; then
  echo rebuild -i $CATALOGDIR/M_SPLOUT.dat >>$LOGFILE
  rebuild -i $CATALOGDIR/M_SPLOUT.dat >>$LOGFILE
else
  echo 'File not found = ' $CATALOGDIR/M_SPLOUT.dat >>$LOGFILE
fi

if [ -f $CATALOGDIR/M_SPLJOB.dat ]; then
  echo rebuild -i $CATALOGDIR/M_SPLJOB.dat >>$LOGFILE
  rebuild -i $CATALOGDIR/M_SPLJOB.dat >>$LOGFILE
else
  echo 'File not found = ' $CATALOGDIR/M_SPLJOB.dat >>$LOGFILE
fi

if [ -f $CATALOGDIR/M_SPLMSG.dat ]; then
  echo rebuild -i $CATALOGDIR/M_SPLMSG.dat >>$LOGFILE
  rebuild -i $CATALOGDIR/M_SPLMSG.dat >>$LOGFILE
else
  echo 'File not found = ' $CATALOGDIR/M_SPLMSG.dat >>$LOGFILE
fi

if [ -f $CATALOGDIR/jesinfo.DAT ]; then
  echo rebuild -i $CATALOGDIR/jesinfo.dat >>$LOGFILE
  rebuild -i $CATALOGDIR/jesinfo.dat >>$LOGFILE
else
  echo 'File not found = ' $CATALOGDIR/jesinfo.dat >>$LOGFILE
fi

ls -al $CATALOGDIR/*.dat    >>$LOGFILE

export End_Date=$(date +%Y-%m-%d_%H-%M-%S)
echo "End Rebuild Date " $End_Date >>$LOGFILE

cat $LOGFILE

exit
