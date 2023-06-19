#!/bin/bash
set -x
# *********************************************
# MLC command file
# *********************************************
#
# V00  - Initial Version           Rc Nov '22'
#
# *********************************************

# Setup Globol variables 

set -x

COBMODE=64
export COBMODE

MF_ORACLE_USER=oracle
export MF_ORACLE_USER

MF_COB_USER=oracle
export MF_COB_USER

ES_LOC_LEVEL=Westpac
export ES_LOC_LEVEL

MFVERBLD=1.46
export MFVERBLD

MF_DEBUG_OPTION=Y
export MF_DEBUG_OPTION

ES_DEF_SERVER=Westpac
export ES_DEF_SERVER

ES_DEF_ARC_SERVER=Westpac
export ES_DEF_ARC_SERVER

ES_ORACLE_DB_NAME=orcl1
export ES_ORACLE_DB_NAME

ES_ORACLE_DB_PWD=welcome01
export ES_ORACLE_DB_PWD

ES_LEVEL=prod
export ES_LEVEL

UPDATE_ES_BIN=Y
export UPDATE_ES_BIN

START_ES_REMOTE=Y
export START_ES_REMOTE

MF_USER="$(id -u -n)"
export MF_USER

CURRENTDATE=`date +"%Y-%m-%d %T"`
CURRENTDATEONLY=`date +"%b %d, %Y"`
CURRENTEPOCTIME=`date +"%Y-%m-%d %T"`

.  /opt/microfocus/VisualCOBOL/bin/cobsetenv 

set +

return