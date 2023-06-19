#!/bin/bash
# mfcobdb2.sh
#
# Modification History
# --------------------
# 04-Oct-2022   Rosario Cappello    Original version

.  setenv_global.sh

 set -x
if [ $MF_DEBUG_OPTION  = 'Y' ]; then
  set -x
fi

ENVTOP=/home/$MF_COB_USER/$ES_LOC_LEVEL/$ES_LEVEL
export ENVTOP

PROGNAME=$(basename $1 .cob)
export PROGNAME

if [[ -z $3 ]]; then
    logfile=$ENVTOP/logs/$PROGNAME.log
else
    logfile=$ENVTOP/logs/$3
fi
export logfile
rm -f $logfile
touch $logfile

if [[ -z $4 ]]; then
    MASCOMPILE=N
else
    MASCOMPILE=$4
fi
export MASCOMPILE

RELLEVEL=/$ENVTOP/prod
export RELLEVEL

# Current version of cobol source

SRCDIR=$ENVTOP/cobol
export SRCDIR


export XAUTHORITY=/home/oracle/.Xauthority
export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export ORACLE_SID=orcl1
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH:/usr/lib64:/usr/lib
export PATH=$ORACLE_HOME/bin:$PATH
export COBMODE=64
 

if [[ -z $2 ]]; then
    SAVEPATH=$PATH
else
    SAVEPATH=$2
fi

export SAVEPATH

PATH=.:$SAVEPATH:$COBDIR/bin
export PATH

echo "****"                                    >>$logfile
echo "COBMODE         = " $COBMODE             >>$logfile
echo "VERSION         = " $MFVERBLD            >>$logfile
echo "DATE            = " ${CURRENTDATE}       >>$logfile 
echo "USER            = " $MF_USER             >>$logfile   
echo "SRCDIR          = " $SRCDIR              >>$logfile
echo "ORACLE_BASE     = " $ORACLE_BASE         >>$logfile
echo "ORACLE_SID      = " $ORACLE_SID          >>$logfile
echo "ORACLE_HOME     = " $ORACLE_HOME         >>$logfile
echo "LD_LIBRARY_PATH = " $LD_LIBRARY_PATH     >>$logfile
echo "PATH            = " $PATH                >>$logfile
 
#***********************************************************
## As we move up the hierarchy remember to remove the lower level. ENVTOP always## remains.   eg When we move to q0 SYSTEMTST and SUBQATST will need to be
## removed.

COBCPY=$ENVTOP/copybook:$COBDIR/cpylib:/opt/microfocus/EnterpriseDeveloper/cpylib
export COBCPY
echo "COBCPY          = " $COBCPY >>$logfile

COBIDY=$ENVTOP/cobidy
export COBIDY
echo "COBIDY          = " $COBIDY >>$logfile

LOCDIR=$ENVTOP/dir
export LOCDIR
echo "LOCDIR          = " $LOCDIR >>$logfile

LOCBIN=$ENVTOP/bin
export LOCBIN
echo "LOCBIN          = " $LOCBIN >>$logfile

LOCLIST=$ENVTOP/listing
export LOCLIST
echo "LOCLIST         = " $LOCLIST >>$logfile

LOCSRCE=$ENVTOP/cobol
export LOCSRCE
echo "LOCSRCE         = " $LOCSRCE >>$logfile

LOCCS9=$ENVTOP/cs9
export LOCCS9
echo "LOCSCS9         = " $LOCCS9 >>$logfile

LOCSRPT=$ENVTOP/script
export LOCSRPT
echo "LOCSRPT         = " $LOCSRCE >>$logfile

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile

#*********************************************************************
# COMPILE ORACLE MAINLINE                                               *
#*********************************************************************

if [[ -f $LOCLIST/$PROGNAME.lst ]]; then
    echo "deleting $LOCLIST/$PROGNAME.lst" >>$logfile
    rm -f $LOCLIST/$PROGNAME.lst
fi

if [[ -f $LOCBIN/$PROGNAME.int ]]; then
    echo "deleting $LOCBIN/$PROGNAME.int" >>$logfile
    rm -f $LOCBIN/$PROGNAME.int
fi

if [[ -f $LOCBIN/$PROGNAME.gnt ]]; then
    echo "deleting $LOCBIN/$PROGNAME.gnt" >>$logfile
    rm -f $LOCBIN/$PROGNAME.gnt
fi

if [[ -f $LOCBIN/$PROGNAME.so ]]; then
    echo "deleting $LOCBIN/$PROGNAME.so" >>$logfile
    rm -f $LOCBIN/$PROGNAME.so
fi

if [[ -f $LOCBIN/$PROGNAME.o ]]; then
    echo "deleting $LOCBIN/$PROGNAME.o" >>$logfile
    rm -f $LOCBIN/$PROGNAME.o
fi

if [[ -f $LOCBIN/$PROGNAME.idy ]]; then
    echo "deleting $LOCBIN/$PROGNAME.idy" >>$logfile
    rm -f $LOCBIN/$PROGNAME.idy
fi

if [[ -f $LOCBIN//$PROGNAME.o ]]; then
    echo "deleting $LOCBIN/$PROGNAME.o" >>$logfile
    rm -f $LOCBIN/$PROGNAME.o
fi

if [[ -f $LOCCS9/$PROGNAME.cs9 ]]; then
    echo "deleting $LOCCS9/$PROGNAME.cs9" >>$logfile
    rm -f $LOCCS9/$PROGNAME.cs9
fi

if [[ -f $LOCLIST/$PROGNAME.lis ]]; then
    echo "deleting $LOCLIST/$PROGNAME.lis" >>$logfile
    rm -f $LOCLIST/$PROGNAME.lis
fi

if [[ -f $LOCBIN/$PROGNAME.sdb ]]; then
    echo "deleting $LOCBIN/$PROGNAME.sdb" >>$logfile
    rm -f $LOCBIN/$PROGNAME.sdb
fi

if [[ -f $LOCLIST/$PROGNAME.trc ]]; then
    echo "deleting $LOCLIST/$PROGNAME.trc" >>$logfile
    rm -f $LOCLIST/$PROGNAME.trc
fi

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile

if [[ -f $LOCDIR/$PROGNAME.cob.dir ]]; then
    echo "Dir file $LOCDIR/$PROGNAME.cob.dir "        >>$logfile

else
    echo "Create Dir file $LOCDIR/$PROGNAME.cob.dir " >>$logfile
    cp $LOCDIR/oracle.dir $LOCDIR/$PROGNAME.cob.dir
fi

cat $LOCDIR/$PROGNAME.cob.dir >>$logfile

echo " "    >>$logfile
echo "****" >>$logfile
echo " "    >>$logfile

cd /$LOCSRCE
# -ug compiles to gnt (u) and animate (g).
echo cob64 -V -z -g  $LOCSRCE/$PROGNAME.cob -C use=$LOCDIR/$PROGNAME.cob.dir -C INT=$LOCBIN/ -C LIST=$LOCLIST/$PROGNAME.lst  >>$logfile
     cob64 -V -z -g  $LOCSRCE/$PROGNAME.cob -C use=$LOCDIR/$PROGNAME.cob.dir -C INT=$LOCBIN/ -C LIST=$LOCLIST/$PROGNAME.lst  >>$logfile
rc=$?

cd /$LOCSRPT

if [ $rc -ne 0 ]; then
    echo "$PROGNAME.cbl failed with a return code of $rc " >>$logfile
    echo ":****"                >>$logfile
    cat $LOCLIST/$PROGNAME.lst  >>$logfile
    echo ":****"                >>$logfile
    cat $logfile
    if [ $MASCOMPILE = 'Y' ]; then
       return $rc
    else
       exit $rc
    fi
else
    echo " "                   >>$logfile
    echo "****"                >>$logfile
    echo " "                   >>$logfile

    if [[ -f $SRCDIR/$PROGNAME.gnt ]]; then
        echo "copy  $SRCDIR/$PROGNAME.gnt  $LOCBIN/$PROGNAME.gnt" >>$logfile
        cp $SRCDIR/$PROGNAME.gnt $LOCBIN/$PROGNAME.gnt
        rm -f $SRCDIR/$PROGNAME.gnt

    fi

    if [[ -f $SRCDIR/$PROGNAME.so ]]; then
        echo "copy  $SRCDIR/$PROGNAME.so  $LOCBIN/$PROGNAME.so" >>$logfile
        cp $SRCDIR/$PROGNAME.so $LOCBIN/$PROGNAME.so
        rm -f $SRCDIR/$PROGNAME.so

    fi

        if [[ -f $SRCDIR/$PROGNAME.o ]]; then
        echo "copy  $SRCDIR/$PROGNAME.o  $LOCBIN/$PROGNAME.o" >>$logfile
        cp $SRCDIR/$PROGNAME.o $LOCBIN/$PROGNAME.o
        rm -f $SRCDIR/$PROGNAME.o
    fi

    if [[ -f $SRCDIR/$PROGNAME.idy ]]; then
        echo "copy  $SRCDIR/$PROGNAME.idy  $LOCBIN/$PROGNAME.idy" >>$logfile
        cp $SRCDIR/$PROGNAME.idy $LOCBIN/$PROGNAME.idy
        rm -f $SRCDIR/$PROGNAME.idy
    fi
    
    if [[ -f $SRCDIR/$PROGNAME.lis ]]; then
        echo "copy  $SRCDIR/$PROGNAME.lis  $LOCLIST/$PROGNAME.lis" >>$logfile
        cp $SRCDIR/$PROGNAME.lis $LOCLIST/$PROGNAME.lis
        rm -f $SRCDIR/$PROGNAME.lis
    fi

    if [[ -f $SRCDIR/$PROGNAME.trc ]]; then
        echo "copy  $SRCDIR/$PROGNAME.trc  $LOCLIST/$PROGNAME.trc" >>$logfile
        cp $SRCDIR/$PROGNAME.trc $LOCLIST/$PROGNAME.trc
        rm -f $SRCDIR/$PROGNAME.trc
    fi
    
    if [[ -f $SRCDIR/$PROGNAME.cs9 ]]; then
        echo "copy  $SRCDIR/$PROGNAME.cs9  $LOCCS9/$PROGNAME.cs9" >>$logfile
        cp $SRCDIR/$PROGNAME.cs9 $LOCCS9/$PROGNAME.cs9
        rm -f $SRCDIR/$PROGNAME.cs9
    fi  

    if [[ -f $SRCDIR/$PROGNAME.sdb ]]; then
        echo "copy  $SRCDIR/$PROGNAME.sdb  $LOCBIN/$PROGNAME.sdb" >>$logfile
        cp $SRCDIR/$PROGNAME.sdb $LOCBIN/$PROGNAME.sdb
        rm -f $SRCDIR/$PROGNAME.sdb    fi  
    fi
    
    if [[ -f $LOCBIN/$PROGNAME.int ]]; then
       echo "deleting $LOCBIN/$PROGNAME.int" >>$logfile
       rm -f $LOCBIN/$PROGNAME.int
    fi

    echo " "    >>$logfile
    echo "****" >>$logfile
    echo " "    >>$logfile

    if [ $MASCOMPILE = 'Y' ]; then
       return $rc
    else
       exit $rc
    fi
fi