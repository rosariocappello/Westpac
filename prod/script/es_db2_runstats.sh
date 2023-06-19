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

IXFLOC=$ENVTOP/ixffiles
export IXFLOC

logfile=$ENVTOP/logs/db2_runstats.log
export logfile

rm -f $logfile
             
echo "****"                                     >>$logfile
echo  "ES_SERVER     = " $ES_SERVER             >>$logfile
echo  "COBMODE       = " $COBMODE               >>$logfile
echo  "VERSION       = " $MFVERBLD              >>$logfile
echo  "DATE          = " ${CURRENTDATE}         >>$logfile 
echo  "USER          = " $MF_USER               >>$logfile   

db2 connect to $ES_DB2_DB_NAME user $MF_DB2_USER using $ES_DB2_DB_PWD   >>$logfile

echo db2 runstats on table AGENT.ADMINCNF  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADMINCNF  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.ADOSTAG2  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.ADOSTAG2  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.ADOSTAGE  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.ADOSTAGE  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.ADVADCNF  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADVADCNF  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.ADVAPADM  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADVAPADM  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.ADVIMPLG  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADVIMPLG  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_INDEX  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_INDEX  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_INSTANCE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_INSTANCE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_MQT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_MQT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_PARTITION  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_PARTITION  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_TABLE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_TABLE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.ADVISE_WORKLOAD  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.ADVISE_WORKLOAD  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.ADVSTAG2  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADVSTAG2  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.ADVSTAGE  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.ADVSTAGE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_ACTUALS  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_ACTUALS  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_ARGUMENT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_ARGUMENT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_ARGUMENT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_ARGUMENT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_DIAGNOSTIC  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_DIAGNOSTIC  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_DIAGNOSTIC  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_DIAGNOSTIC  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_DIAGNOSTIC_DATA  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_DIAGNOSTIC_DATA  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_DIAGNOSTIC_DATA  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_DIAGNOSTIC_DATA  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_INSTANCE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_INSTANCE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_INSTANCE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_INSTANCE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_OBJECT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_OBJECT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_OBJECT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_OBJECT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_OPERATOR  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_OPERATOR  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_OPERATOR  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_OPERATOR  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_PREDICATE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_PREDICATE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_PREDICATE  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_PREDICATE  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_STATEMENT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_STATEMENT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_STATEMENT  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_STATEMENT  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2TESTER.EXPLAIN_STREAM  on key columns and indexes all >>$logfile
     db2 runstats on table DB2TESTER.EXPLAIN_STREAM  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.EXPLAIN_STREAM  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.EXPLAIN_STREAM  on key columns and indexes all >>$logfile

echo db2 runstats on table SYSTOOLS.HMON_ATM_INFO  on key columns and indexes all >>$logfile
     db2 runstats on table SYSTOOLS.HMON_ATM_INFO  on key columns and indexes all >>$logfile

echo db2 runstats on table SYSTOOLS.HMON_COLLECTION  on key columns and indexes all >>$logfile
     db2 runstats on table SYSTOOLS.HMON_COLLECTION  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.INTSTAG2  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.INTSTAG2  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.INTSTAGE  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.INTSTAGE  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.MASK_ADDRESS_LOOKUP  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.MASK_ADDRESS_LOOKUP  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.NAS_ADVSER_DETAILS  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.NAS_ADVSER_DETAILS  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.NAS_DEALER_DETAILS  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.NAS_DEALER_DETAILS  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.NORTY  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.NORTY  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.OBJECT_METRICS  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.OBJECT_METRICS  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.OFCSTAG2  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.OFCSTAG2  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.OFCSTAGE  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.OFCSTAGE  on key columns and indexes all >>$logfile

echo db2 runstats on table SYSTOOLS.POLICY  on key columns and indexes all >>$logfile
     db2 runstats on table SYSTOOLS.POLICY  on key columns and indexes all >>$logfile

echo db2 runstats on table VOICEBIO.POLMFENR  on key columns and indexes all >>$logfile
     db2 runstats on table VOICEBIO.POLMFENR  on key columns and indexes all >>$logfile

echo db2 runstats on table NUDI.REQUEST_DETAIL  on key columns and indexes all >>$logfile
     db2 runstats on table NUDI.REQUEST_DETAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table NUDI.REQUEST_HEADER  on key columns and indexes all >>$logfile
     db2 runstats on table NUDI.REQUEST_HEADER  on key columns and indexes all >>$logfile

echo db2 runstats on table DB2INST1.REXTEST1  on key columns and indexes all >>$logfile
     db2 runstats on table DB2INST1.REXTEST1  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.REXX_PARMS  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.REXX_PARMS  on key columns and indexes all >>$logfile

echo db2 runstats on table VOICEBIO.STAFFDET  on key columns and indexes all >>$logfile
     db2 runstats on table VOICEBIO.STAFFDET  on key columns and indexes all >>$logfile

echo db2 runstats on table VOICEBIO.STAFFREL  on key columns and indexes all >>$logfile
     db2 runstats on table VOICEBIO.STAFFREL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAACTIVY  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAACTIVY  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAADVPOL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAADVPOL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAEMAIL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAEMAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGADLK  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGADLK  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGAGAU  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGAGAU  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGEFAC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGEFAC  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGLRUL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGLRUL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGMAIL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGMAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGMREG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGMREG  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGNT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGNT  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGNTOF  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGNTOF  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGNTOS  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGNTOS  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGRACT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGRACT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGRMNT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGRMNT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAAGRREL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAAGRREL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGRULE  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGRULE  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGRULK  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGRULK  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGTDED  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGTDED  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAGTDEH  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAGTDEH  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMCNL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMCNL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMCNT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMCNT  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMERR  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMERR  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMIFC  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMIFC  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMIFM  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMIFM  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMSTG  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMSTG  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMSTL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMSTL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMTRM  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMTRM  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAKMUPD  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAKMUPD  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAARATES  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAARATES  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAASISER  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAASISER  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAUTHPR  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAUTHPR  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAAVBI  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAAVBI  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TABENNAM  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TABENNAM  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TABENNOM  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TABENNOM  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TABLMAIL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TABLMAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TABSAMRL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TABSAMRL  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLAERR  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLAERR  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLAGCP  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLAGCP  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLAMSG  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLAMSG  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLAPTY  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLAPTY  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLAROL  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLAROL  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLASPC  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLASPC  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLASRL  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLASRL  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLASSF  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLASSF  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TACLASTP  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TACLASTP  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLIENT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLIENT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLNTAC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLNTAC  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLNTAG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLNTAG  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLNTPL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLNTPL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTACT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTACT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTCON  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTCON  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTDET  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTDET  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTOBJ  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTOBJ  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTREG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTREG  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTREL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTREL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TACLTRUL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TACLTRUL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTSPC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTSPC  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACLTTFN  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACLTTFN  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACMSLNK  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACMSLNK  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACONTDT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACONTDT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACONTHD  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACONTHD  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TACONVEN  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TACONVEN  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TACPCLRG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TACPCLRG  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TACUSTPR  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TACUSTPR  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TADAFEED  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TADAFEED  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TADEFFAC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TADEFFAC  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TADISCNT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TADISCNT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TADUMMY  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TADUMMY  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TADUMMY  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TADUMMY  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAEMAIL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAEMAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAEMLDAT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAEMLDAT  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TAERRMSG  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TAERRMSG  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TAERRORS  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TAERRORS  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TAERRTYP  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TAERRTYP  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAFAD  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAFAD  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TAFSY  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TAFSY  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAGNTCOM  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAGNTCOM  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAGPAYBL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAGPAYBL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAKAMACT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAKAMACT  on key columns and indexes all >>$logfile

echo db2 runstats on table SUPER.TAMESRUL  on key columns and indexes all >>$logfile
     db2 runstats on table SUPER.TAMESRUL  on key columns and indexes all >>$logfile

echo db2 runstats on table SUPER.TAMESTGP  on key columns and indexes all >>$logfile
     db2 runstats on table SUPER.TAMESTGP  on key columns and indexes all >>$logfile

echo db2 runstats on table SUPER.TAMESTXN  on key columns and indexes all >>$logfile
     db2 runstats on table SUPER.TAMESTXN  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TANAMAGR  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TANAMAGR  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TANAMCOY  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TANAMCOY  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TANAME  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TANAME  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TANAMREG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TANAMREG  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TANEXTNO  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TANEXTNO  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TANOTES  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TANOTES  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOACTRG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOACTRG  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJAGR  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJAGR  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJECT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJECT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJSTE  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJSTE  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJTAC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJTAC  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJTRG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJTRG  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAOBJTRL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAOBJTRL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAOFFICE  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAOFFICE  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAORLREG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAORLREG  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAPLACE  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAPLACE  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAPLCECP  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAPLCECP  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAPLCLAB  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAPLCLAB  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAPLCREL  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAPLCREL  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAPOLEXT  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAPOLEXT  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TAPROCTL  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TAPROCTL  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TAPROPTY  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TAPROPTY  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAREGIST  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAREGIST  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TARELDET  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TARELDET  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TAROLETP  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TAROLETP  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TARPTDLY  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TARPTDLY  on key columns and indexes all >>$logfile

echo db2 runstats on table UTILITY.TARSTART  on key columns and indexes all >>$logfile
     db2 runstats on table UTILITY.TARSTART  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASECURE  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASECURE  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TASPECIF  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TASPECIF  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TASPECRL  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TASPECRL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASQLTXT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASQLTXT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TASTEREG  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TASTEREG  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTD2  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTD2  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTDT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTDT  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTHD  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTHD  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTHS  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTHS  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTLG  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTLG  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TASTMTNA  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TASTMTNA  on key columns and indexes all >>$logfile

echo db2 runstats on table SUPER.TATRADE  on key columns and indexes all >>$logfile
     db2 runstats on table SUPER.TATRADE  on key columns and indexes all >>$logfile

echo db2 runstats on table RULES.TATYPE  on key columns and indexes all >>$logfile
     db2 runstats on table RULES.TATYPE  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAWELLET  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAWELLET  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAWLMAIL  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAWLMAIL  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAWLPTXT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAWLPTXT  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TAWLTPLT  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TAWLTPLT  on key columns and indexes all >>$logfile

echo db2 runstats on table CLIENT.TAYRSFAC  on key columns and indexes all >>$logfile
     db2 runstats on table CLIENT.TAYRSFAC  on key columns and indexes all >>$logfile

echo db2 runstats on table AGENT.TEMPPOLICY  on key columns and indexes all >>$logfile
     db2 runstats on table AGENT.TEMPPOLICY  on key columns and indexes all >>$logfile

cat $logfile
exit