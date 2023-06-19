      * cob -a *cbl -C "constant OSMCO\"UNIX\""
        identification division.

        author.    Micro Focus, Ltd.        Micro Focus, Inc.
                   Newbury, Berkshire       Palo Alto, California
                   United Kingdom           U.S.A.

                         ALL RIGHTS RESERVED.

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.0  2006/03/20 15:30:06  LB 
      ***  lb-001 - Source code cut from dfhinfo.cbl v1.4 
      ***           Created cut doewn to extract message queue id to 
      ***           be added to mfmemclean script.
      ***
      *** Build instructions (UNIX only):
      *** cob -i mfmemqlist.cbl -C "constant OSMCO\"UNIX\""
      ***
      ***

       environment division.
       configuration section.
        special-names.
      ***--------------------------------------------------------------*
      *** Revision History                                             *
      ***--------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.2  1997/02/18 11:42:36  NJF
      ***  njfmvs - temporary check in of sources for backup as part
      ***           of the Visual MVS port.
      ***  Modules: dfhcwver.cpy dfhcsnam.cpy dfh0cfg.cbl dfhpcbcu.cbl
      ***           makegen.cbl  txcase.cmd
      ***  New Modules: dfhcweru.cpy dfhcperu.cpy
      ***
      ***  
      ***     Rev 1.1   18 Feb 1997 11:42:36   NJF
      ***  njfmvs - temporary check in of sources for backup as part
      ***           of the Visual MVS port.
      ***  Modules: dfhcwver.cpy dfhcsnam.cpy dfh0cfg.cbl dfhpcbcu.cbl
      ***           makegen.cbl  txcase.cmd
      ***  New Modules: dfhcweru.cpy dfhcperu.cpy
      ***  
      ***     Rev 1.0   18 Jan 1996 09:38:08   SC
      ***  sc-142 Correct UNIX and AIX build problems
      ***                                                              *
      ***--------------------------------------------------------------*
      ***  Calling convention bit definitions                          *
      ***                                                              *
      ***   Bit 1 - Reverse Parameter Order                            *
      ***   Bit 2 - Callee clears stack                                *
      ***   Bit 3 - Implicit Call                                      *
      ***   Bit 4 - Litlinked Call                                     *
      ***   Bit 5 - OS/2 Optlink convention                            *
      ***   Bit 6 - OS/2 Thunked convention (32bit calling 16bit)      *
      ***   Bit 7 - '__stdcall' convention                             *
      ***   Bit 8 - callee puts returning item on floating point stack *
      ***                                                              *
      ***--------------------------------------------------------------*
           call-convention 4 is noret
           call-convention 1 is hllapi32
      $if OS2-32 defined
           call-convention 0 is os2api
           call-convention 0 is os2api32
           call-convention 34 is os2-32-16-thunk-api
           call-convention 9  is mssql
           call-convention 35 is pascal16
      $else
           call-convention 74 is NT-API
           call-convention 74 is NT-API-LITLINK
           call-convention 66 is NT-API-DYNLOAD
           call-convention 3 is os2api
           call-convention 9  is mssql
      $end
           *>-------------------------------<*
           *> -- Set CCI call convention -- <*
           *>-------------------------------<*
           *> -- call convention is now 0 on ALL platforms
           *> -- ALL parameters are now passed by reference
           call-convention 0 is cciApi
           call-convention 3 is PASCAL

           call-convention 11 is winapi
      $if OS2-16 defined
           call-convention 3 is DWapi
      $else
      $if DOS defined
           call-convention 3 is DWapi
      $else
           call-convention 0 is DWapi
      $end
      $end
           *>----------------------------------<*
           *> -- Call conventions for DB2/2 -- <*
           *>----------------------------------<*
      $if OS2-16 defined
           call-convention 1 is DB2cc
      $else
      $if DOS defined
           call-convention 1 is DB2cc
      $else
      $if OS2-32 defined
           call-convention 0 is DB2cc
      $else
      $if WIN-NT defined
           call-convention 74 is DB2cc
      $else
njfmvs$if GENESIS defined
njfmvs     call-convention 74 is DB2cc
njfmvs$else
      $if AIX defined
           call-convention 0 is DB2cc
      $end       AIX    defined
njfmvs$end (not) GENESIS defined
      $end (not) WIN-NT defined
      $end (not) OS2-32 defined
      $end (not) DOS    defined
      $end (not) OS2-16 defined
           call-convention 0 is api.

      ***--------------------------------------------------------------*
      ***  $Workfile:   dfhcsnam.cpy  $ end
      ***--------------------------------------------------------------*

       data division.
       working-storage section.

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.121.2.1  2005/12/23 11:58:12  njf
      ***  nx-289 - increment internal revision number.
      ***           Dev stream is now 5.1.?? and SSv5 is
      ***           5.0.??
      ***  Modules: dfhcwver.cpy
      ***
      ***  Revision 1.121  2005/11/01 17:30:26  njf
      ***  nx-276 - update copyright text
      ***  Modules: dfhcwver.cpy
      ***
      ***  Revision 1.120  2005/11/01 17:08:47  pmw
      ***  pw-395    Prevent 173 from dfheibmq in MPR.
      ***            Use correct match prefix for dynamic debugging.
      ***  Modules:  casbat.cbl   casmpr.cbl   dfheserv.cbl
      ***            dfhcpuex.cpy dfhcwver.cpy
      ***
      ***  Revision 1.119  2005/10/31 12:15:13  njf
      ***  nx-271 - Any processes that are still active when the
      ***           console daemon terminates on Unix are now
      ***           killed with SIGKILL rather than SIGTERM.
      ***  Modules: dfhmd.cbl    cascd.cbl
      ***           dfhcwver.cpy dfhcwkcp.cpy
      ***
      ***  Revision 1.118  2005/10/11 15:14:16  njf
      ***  nx-264 - temporary fix for problem with shutdown
      ***           processing from ESMAC. We should consolidate
      ***           the use of the 'non-facility' and 'eci' type
      ***           flags within the tctte.
      ***           Updated version number to 5.
      ***  Modules: dfhcwver.cpy
      ***           dfhzcqit.cbl dfhzplt.cbl
      ***
      ***  Revision 1.117  2005/07/14 19:37:54  njf
      ***  nx-241 - Add additional resource definitions for IMTK
      ***           CICS EAP support.
      ***           Provide override for upgrade utility.
      ***           Enable Event Manager in default product build.
      ***  Modules: dfhpcupg.cbl
      ***           dfhcwver.cpy dfhcptrf.cpy dfhcpdup.cpy dfhcwini.cpy
      ***           dfhcpcm2.cpy dfhcwcm2.cpy
      ***
      ***  Revision 1.116  2005/07/01 09:03:17  njf
      ***  nx-236 - Update copyright date and version numbers
      ***  Modules: dfhcwver.cpy
      ***
      ***  Revision 1.115  2004/12/01 22:10:12  pmw
      ***  pw-326    For MTS-ASEE and UNIX make 78-new-ipc the
      ***            default.
      ***  Modules:  dfhcwver.cpy
      ***
      ***  Revision 1.114  2004/05/28 13:05:20  njf
      ***  nx-195 - update product version
      ***  Modules: dfhcwver.cpy
      ***
      ***  Revision 1.113  2004/02/24 17:30:32  njf
      ***  nx-185 - xfh fixpack hasn't included reentrant codeset
      ***           so reinstated mutex protection in casgate.
      ***  Modules: dfhcwver.cpy dfhcbpca.cpy
      ***
      ***  Revision 1.112  2004/02/03 19:59:28  sc
      ***  sc-b04 Add local trace table for MFCS/casgate;
      ***         Change dump/trace esmac format to "wide";
      ***         Upgrade trace/dump formating to accomidate new CSA;
      ***         Thread protection for casgate directly invoked dump;
      ***    Mod: casrdo51.cbl dfhcbcs2.cpy dfhcwtrf.cpy casgate.cbl
      ***         dfhcbpca.cpy dfhcpkcw.cpy dfhcptrf.cpy casrdo6.cbl
      ***         dfhcwver.cpy dfhgdump.cbl
      ***
      ***  Revision 1.111  2003/11/06 20:38:13  njf
      ***  nx-167 - Add Linux MQSeries support and update
      ***           version.
      ***  Modules: casmqld.c dfhcwver.cpy
      ***
      ***  Revision 1.110  2003/10/23 09:46:37  njf
      ***  nx-166 - enable ES licensing on SX now that we
      ***           have the underlying licensing support in
      ***           place.
      ***  Modules: dfhgglbl.cbl
      ***           dfhcwver.cpy
      ***
      ***  Revision 1.109  2003/10/19 22:06:53  njf
      ***  532772 - Tru64 platform has 64bit C pointers but COBOL
      ***           pointers are only 32bit.
      ***           Filler to be added beyond pointers and procedure
      ***           pointers for the mfcs and RTS request handler
      ***           interfaces.
      ***  Modules: cashtsrv.cbl dfheserv.cbl mfrhcgi.cbl
      ***           cascbhyd.cpy cascbctl.cpy cascbenv.cpy cascprdt.cpy
      ***           cbltypes.cpy dfhcwver.cpy
      ***           txmake.ctl
      ***  New Module: cas0supp.cbl (replaces aseeload)
      ***
      ***  Revision 1.108  2003/07/03 14:38:31  peh
      ***  peh570 - Updated version numbers for MFE 3.0.
      ***  modules: dfhcwver.cpy
      ***
      ***  Revision 1.107  2003/03/03 14:43:52  NJF
      ***  nx-129 - Update for latest RTS interface, sysprog fn.
      ***           Change internal name from CAS to ES.
      ***           Add 'dump failed request processing'.
      ***           Update to latest mfdsa interface, shutdown status.
      ***           Add licensing support for NX/NX4 (incomplete).
      ***           Fix env var processing, .env file not flushed.
      ***           Prevent dfhgdied messages from appearing during
      ***           region termination.
      ***           Update HTTP xfer size field in CSA and add in
      ***           padding.
      ***  Modules: dfh0cfg.cbl  dfhgdied.cbl dfheserv.cbl dfhmd.cbl
      ***           dfhgglbl.cbl cascfg.cbl   cashtsrv.cbl
      ***           dfhcpgrq.cpy dfhcbcsa.cpy dfhcwver.cpy cascbcfg.cpy
      ***           cascwctl.cpy cascpctl.cpy cascbctl.cpy dfhcbtca.cpy
      ***           dfhcprdt.cpy
      ***           makegen.cbl
      ***
      ***
      ***     Rev 1.106   03 Mar 2003 14:43:52   NJF
      ***  nx-129 - Update for latest RTS interface, sysprog fn.
      ***           Change internal name from CAS to ES.
      ***           Add 'dump failed request processing'.
      ***           Update to latest mfdsa interface, shutdown status.
      ***           Add licensing support for NX/NX4 (incomplete).
      ***           Fix env var processing, .env file not flushed.
      ***           Prevent dfhgdied messages from appearing during
      ***           region termination.
      ***           Update HTTP xfer size field in CSA and add in
      ***           padding.
      ***  Modules: dfh0cfg.cbl  dfhgdied.cbl dfheserv.cbl dfhmd.cbl
      ***           dfhgglbl.cbl cascfg.cbl   cashtsrv.cbl
      ***           dfhcpgrq.cpy dfhcbcsa.cpy dfhcwver.cpy cascbcfg.cpy
      ***           cascwctl.cpy cascpctl.cpy cascbctl.cpy dfhcbtca.cpy
      ***           dfhcprdt.cpy
      ***           makegen.cbl
      ***
      ***     Rev 1.105   20 Jan 2003 17:24:30   NJF
      ***  nx-106 - additional trace entries for casgate and
      ***           updates for client disconection (tn3270).
      ***  Modules: casgate.cbl dfhcwver.cpy
      ***
      ***     Rev 1.104   07 Jan 2003 16:32:10   NJF
      ***  nx-098 - update dfhcwver for 2003 in copyright
      ***  Modules: dfhcwver.cpy
      ***
      ***     Rev 1.103   12 Nov 2002 16:37:44   SC
      ***  sc-959 UNIX Shape change Mods: txmake.ctl mau-make.mk
      ***         dfhcwver.cpy dfhmd.cbl
      ***
      ***     Rev 1.102   17 Oct 2002 14:42:10   NJF
      ***  nx-066 - Provide ability to dynamically generate IDTs for system
      ***           administration requests.
      ***           Updates to RTS interface based on latest spec.
      ***           Change TXRFDIR to be <work-dir>\<regname>.
      ***           Add support for environment variable specification within
      ***           Medusa, $TXRFDIR\<regname>.env contains env vars.
      ***           Update for latest Medusa/mfdsa interface.
      ***  Modules: dfhginit.cbl dfheini1.cbl dfheserv.cbl dfh0cfgp.cbl
      ***           casasrvc.cbl dfh0cfg.cbl  dfhmd.cbl
      ***           dfhcprdt.cpy dfhcwver.cpy cascwrdt.cpy dfhc8srv.cpy
      ***           cascbctl.cpy dfhcpism.cpy dfhcbcfa.cpy  dfhcbmgr.cpy
      ***           dfhcplck.cpy cascbcfg.cpy
      ***           txmake.ctl   messages
      ***  New modules: casadmin.cbl cascbadm.cpy
      ***
      ***     Rev 1.101   09 Oct 2002 15:04:06   NJF
      ***  nx-062 - Add casdump,casdup and casxalib as aliases for
      ***           dfhgtrtd,dfhgdup and dfhxareg. Minor updates to
      ***           tracing and messaging.
      ***  Modules: dfheserv.cbl dfhexa.cbl   mvstrig.cbl dfhxareg.cbl
      ***           dfhcwver.cpy dfhcbxat.cpy cascprdt.cpy
      ***           messages     mwo-make.mk  txmake.ctl
      ***  New modules: casdump.cfg casdup.cfg
      ***
      ***     Rev 1.100   20 Sep 2002 16:11:46   NJF
      ***  nx-055 - update for latest RTS interface changes
      ***  Modules: casasrvc.cbl dfheserv.cbl dfhmd.cbl
      ***           dfhc8srv.cpy cascwrdt.cpy dfhcptmp.cpy cascprdt.cpy
      ***           dfhcwver.cpy cascbctl.cpy cascpctl.cpy
      ***           messages
      ***
      ***     Rev 1.99   17 Sep 2002 17:16:16   SC
      ***  sc-928 Thread support for Hydra interface
      ***   Mod: dfhgpca.cbl  dfhcppcm.cpy dfhcwpcm.cpy dfhcbpcm.cpy
      ***        dfhgreq.cbl  dfhcpgrm.cpy dfhcwgrm.cpy dfhcbgrm.cpy
      ***        dfhcbpca.cpy dfhcpkcp.cpy dfhtcci.cbl  dfhcpcla.cpy
      ***        casgate.cbl  cashydra.cpy mtsgate.cbl  dfhcbmgr.cpy
      ***        dfhc8cci.cpy dfhcwcci.cpy dfhe3270.cbl dfhe32db.cbl
      ***        dfhcwver.cpy dfhc8ase.cpy dfhecics.cbl dfhefctl.cbl
      ***        dfheserv.cbl dfhgglbl.cbl dfheini1.cbl dfhetrm1.cbl
      ***        dfheuser.cbl dfhgterm.cbl dfhmd.cbl    dfhtmqgw.cbl
      ***        dfhgreqc.cbl
      ***
      ***     Rev 1.98   15 Aug 2002 14:01:40   NJF
      ***  nx-034 - Initial part of new ASRA abend processing. Source merge
      ***           to use new dfheserv/protocol module split.
      ***  Modules: dfheserv.cbl dfhgglbl.cbl casbnsrv.cbl
      ***           dfhcbdca.cpy dfhcbice.cpy dfhcwver.cpy cascpctl.cpy
      ***
      ***     Rev 1.97   20 Sep 2001 15:38:12   PEH
      ***  peh518 - Add version info to DLLs and EXEs during build.
      ***           For any program flagged as generating a DLL or
      ***           EXE, run the utility GENRC to scan the source
      ***           file and extract the VCS revision level. This,
      ***           along with info from dfhcwver, is used to create
      ***           a .RC file. The .RC file is processed by the MS
      ***           resource compiler to create a .RES file which is
      ***           input to the cbllink process.
      ***  modules: dfhcwver.cpy makegen.cbl mvstrig.cbl txmake.ctl
      ***  new:     genrc.cbl
      ***
      ***     Rev 1.96   Jul 24 2000 19:03:02   AJD
      ***  Resetting version to 2.5.00.0 now that R3 branch has been created.
      ***
      ***     Rev 1.95   Jun 30 2000 21:14:28   AJD
      ***  Buidl 2.5.05
      ***
      ***     Rev 1.94   Jun 28 2000 16:13:28   AJD
      ***  Build 2.5.04
      ***
      ***     Rev 1.93   May 30 2000 11:18:34   AJD
      ***  Build 2.5.03
      ***
      ***     Rev 1.92   May 08 2000 09:09:40   AJD
      ***  Build 2.5.02
      ***
      ***     Rev 1.91   May 04 2000 10:47:00   AJD
      ***  Build 2.5.01
      ***
      ***     Rev 1.90   Apr 19 2000 15:52:06   AJD
      ***  Build 2.0.29
      ***
      ***     Rev 1.89   Apr 03 2000 11:47:58   AJD
      ***  Build 2.0.28
      ***
      ***     Rev 1.88   Mar 27 2000 11:18:10   AJD
      ***  Build 2.0.27
      ***
      ***     Rev 1.87   Mar 02 2000 19:08:24   AJD
      ***  Build 2.0.26
      ***
      ***     Rev 1.86   Feb 16 2000 14:18:22   AJD
      ***  Build 2.0.25
      ***
      ***     Rev 1.85   Feb 03 2000 19:25:38   AJD
      ***  Build 2.0.24
      ***
      ***     Rev 1.84   Jan 27 2000 12:32:14   AJD
      ***  Build 2.0.23
      ***
      ***     Rev 1.83   21 Jan 2000 15:00:58   NJF
      ***  nf-202 - Updates to ASSIGN/SET/INQUIRE processing in 3270
      ***           bridge environment.
      ***           Removed conditional compilation for 3270 Bridge support.
      ***  Modules: dfhebms.cbl  dfheexin.cbl dfheuser.cbl  dfhesysp.cbl
      ***           dfhesche.cbl dfhgreq.cbl  dfheserv.cbl  dfhe3270.cbl
      ***           dfhe32db.cbl
      ***           dfhcbice.cpy dfhcwini.cpy dfhcbpct.cpy dfhcbapi.cpy
      ***           dfhcpgrq.cpy dfhcptmp.cpy dfhcwver.cpy dfhcbtcs.cpy
      ***
      ***     Rev 1.82   Jan 17 2000 18:27:02   AJD
      ***  Build 2.0.22
      ***
      ***     Rev 1.81   Jan 05 2000 14:42:16   AJD
      ***  Build 2.0.21
      ***  Happy New Year !! 1999 changed to 2000
      ***  Modules: dfhcwver.cpy
      ***
      ***     Rev 1.0   10 Feb 1995 11:44:30   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
       01  COPYRIGHT                   PIC X(45) VALUE
nx-195*nx-098     "Copyright (C) 1985-2003  Micro Focus Int'l  ".
nx-276*nx-195     "Copyright (C) 1985-2005  Micro Focus Int'l  ".
nx-098*nx-062     "Copyright (C) 1985-2002  Micro Focus Int'l  ".
nx-276       "Copyright (C) 1985-2006 Micro Focus (IP) Ltd.".
 
nx-034*njfmvs$IF GENESIS defined
nx-034*njfmvs  78 WIN-NT value '1'.
nx-034*pw-047  78 MVS-IDE value '1'.
nf-202*nf-184  78 3270-bridge value '1'.
nx-034*njfmvs$END

P15412$IF SUN  defined
P15412  78 OSMCO value 'UNIX'.
AJD     78 BRIXTON value '1'.
        78 UNIX  value '1'.
sc-239  78 build-type value 'UNIX'.    *> -- For Fileshare
P15412$END

      $IF SCO  defined
        78 OSMCO value 'UNIX'.
        78 UNIX  value '1'.
sc-239  78 build-type value 'UNIX'.    *> -- For Fileshare
      $END

      $IF AIX defined
sc-959  78 GENESIS value '1'.
        78 OSMCO value 'UNIX'.
        78 UNIX  value '1'.
sc-239  78 build-type value 'UNIX'.    *> -- For Fileshare
      $END

nx-034$IF GENESIS defined
nx-034$IF UNIX not defined
nx-034  78 WIN-NT value '1'.
nx-034  78 MVS-IDE value '1'.
nx-034$END (UNIX not defined)
nx-034$END
      $IF OS2-16 defined
        78 OSMCO value 'OS2'.
        78 16BIT-OS value '1'.
stb01   78 HLLAPI-OS2-16 value '1'.
ajd001  78 78-REL-32 value '1'.
sc-239  78 build-type value '16BIT'.   *> -- For Fileshare
      $END

      $IF OS2-32 defined
        78 OSMCO value 'OS2'.
mjf161  78 32BIT-OS value '1'.
sc-113  78 OS2-32-WIN-NT value '1'.
stb01   78 HLLAPI-OS2-32 value '1'.
sc-239  78 build-type value '32BIT'.   *> -- For Fileshare
      $END

      $IF WIN-NT defined
        78 OSMCO value 'OS2'.
mjf162  78 32BIT-OS value '1'.
sc-113  78 OS2-32-WIN-NT value '1'.
stb01   78 HLLAPI-NT     value '1'.
mvs018$IF GENESIS defined
mvs018  78 build-type value 'GENESIS'. *> -- For Fileshare
mvs018$ELSE
sc-239  78 build-type value '32BIT'.   *> -- For Fileshare
mvs018$END
      $END

      $IF DOS defined
        78 OSMCO value 'DOS'.
        78 16BIT-OS value '1'.
ajd001  78 78-REL-32 value '1'.
sc-239  78 build-type value '16BIT'.   *> -- For Fileshare
      $END

      $IF WIN defined
        78 OSMCO value 'DOS'.
        78 16BIT-OS value '1'.
ajd001  78 78-REL-32 value '1'.
sc-239  78 build-type value '16BIT'.   *> -- For Fileshare
      $END

tjc211$IF MCO2 defined
tjc211  78 OSMCO2 value 'MCO2'.
tjc211  78 MCO2 value '1'.
tjc211$END

P17497$if 78-single-process-system-scp defined
P17497$if 16BIT-OS defined
P17497  78 16BIT-OS-single-process-scp value '1'.
P17497$end
P17497$end

      ***  ----------------------------------------------------------
      ***  --                 !!! WARNING !!!
      ***  --
      ***  -- if the start position of the version is changed in this
      ***  -- string, then DFHXINIT must be changed to use the new
      ***  -- start position.
      ***  --
      ***  ----------------------------------------------------------
peh518$IF GENESIS defined
nx-055$if MTS-ASEE defined
nx-129 78  78-tx-product-name value 'Enterprise Server'.
nx-055$else
peh518 78  78-tx-product-name value 'CICS Option'.
nx-055$end
peh518$ELSE
ajd001 78  78-tx-product-name value 'Micro Focus Transaction System'.
peh518$END
ajd001$IF 78-REL-30 defined
ajd001 78  78-tx-version-major        value 3.
ajd001 78  78-tx-version-minor        value 0.
ajd001 78  78-tx-version-rev          value 00.
n43194 78  78-tx-version              value '3.0.00'.
ajd001$ELSE
ajd001$IF 78-REL-32 defined
ajd001 78  78-tx-version-major        value 3.
ajd001 78  78-tx-version-minor        value 2.
ajd001 78  78-tx-version-rev          value 00.
n43194 78  78-tx-version              value '3.2.00'.
ajd001$ELSE
njfmvs$IF GENESIS defined
nx-055$if MTS-ASEE defined
nx-236*nx-055 78  78-tx-version-major        value 3.
nx-236*nx-055 78  78-tx-version-minor        value 0.
nx-236*nx-195 78  78-tx-version-rev          value 12.
nx-236*nx-195 78  78-tx-version              value '3.0.12'.
nx-264 78  78-tx-version-major        value 5.
nx-236 78  78-tx-version-minor        value 0.
nx-289*nx-271 78  78-tx-version-rev          value 2.
nx-289*nx-271 78  78-tx-version              value '5.0.02'.
nx-289 78  78-tx-version-rev          value 3.
nx-289 78  78-tx-version              value '5.0.03'.
nx-055$else
peh570 78  78-tx-version-major        value 3.
peh570 78  78-tx-version-minor        value 0.
peh570 78  78-tx-version-rev          value 00.
peh570 78  78-tx-version              value '3.0.00'.
nx-055$end
njfmvs$ELSE
ajd001 78  78-tx-version-major        value 4.
ajd001 78  78-tx-version-minor        value 0.
ajd001 78  78-tx-version-rev          value 00.
n43194 78  78-tx-version              value '4.0.00'.
njfmvs$END
ajd001$END
ajd001$END

sc-928***---------------------------------***
sc-928***  Simple logic for conditionals: ***
sc-928***                                 ***
sc-928***        ASEE-OR-GENESIS          ***
sc-928***        ASEE-OR-UNIX             ***
sc-928***                                 ***
sc-928***        ASEE-AND-UNIX            ***
sc-928***        ASEE-AND-GENESIS         ***
sc-928***                                 ***
sc-928***---------------------------------***
sc-928$if MTS-ASEE defined
sc-928 78 ASEE-OR-GENESIS                  value 1.
sc-928$if UNIX defined
sc-928 78 ASEE-OR-UNIX                     value 1.
sc-928 78 ASEE-AND-UNIX                    value 1.
sc-928$end (UNIX defined)
sc-928$if GENESIS defined
sc-928 78 ASEE-AND-GENESIS                 value 1.
sc-928$end (GENESIS defined)
sc-928***---------------------------------***
sc-928$else (MTS-ASEE defined)
sc-928***---------------------------------***
sc-928$if GENESIS defined
sc-928 78 ASEE-OR-GENESIS                  value 1.
sc-928$end (GENESIS defined)
sc-928$if UNIX defined
sc-928 78 ASEE-OR-UNIX                     value 1.
sc-928$end (UNIX defined)
sc-928$end not (MTS-ASEE defined)
sc-928***---------------------------------***

nx-055$if MTS-ASEE defined
nx-055 *> -- offset/length to "CAS x.y.zz"
nx-055 78 78-whatstring-start-offset       value 6.
nx-055 78 78-whatstring-offset-len         value 14.
nx-055 01  whatstring                  pic x(23) value
nx-055     '@(#) Ver CAS ' & 78-tx-version & ' nrv'.
nx-055$else
n43194 01  whatstring                  pic x(22) value
n43194     '@(#) Ver TX ' & 78-tx-version & ' nrv'.
nx-055$end

nx-236$if MTS-ASEE defined
nx-236 01  whatstring-tag              pic x(80) value
nx-236     z'@(#) ES - $Name:  $'.
nx-236$end

nx-185$if MTS-ASEE defined
nx-185$if WIN-NT defined
nx-185 78 78-mutex-protect-codeset         value 1.
nx-185$end
pw-326$if UNIX defined
pw-326 78  78-new-ipc                  value 1.
pw-326$end
nx-241 78 78-EMP-support                        value 1.
nx-185$end
pw-395$if 78-module-trace-identifier defined
pw-395$if 78-module-trace-identifier = x'3c'
pw-395 78  78-casbat-casmpr            value 1.
pw-395$end
pw-395$if 78-module-trace-identifier = x'3f'
pw-395 78  78-casbat-casmpr            value 1.
pw-395$end
pw-395$end (78-module-trace-identifier defined)
      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcwver.cpy  $ end
      ***-------------------------------------------------------------*

        78 78-module-trace-identifier   value x'08'.
        78 78-config-module-name        value 'dfhginfo'.
      ***-- config request block
      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***--------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.34  2005/10/17 11:31:37  sc
      ***  sc-i67 Partial check in - Recovery from password change;
      ***
      ***  Revision 1.33  2005/10/16 20:57:09  njf
      ***  nx-267 - Increase config buffer sizes to support longer
      ***           concatenated directories. Fix problem with debug
      ***           JES initiators not being deregistered at termination.
      ***           Add terminal definitions for 3270 bridge support in ES.
      ***           Various minor fixes/enhancements.
      ***  Modules: dfhecics.cbl dfheini1.cbl dfhgglbl.cbl dfh0cfg.cbl
      ***           dfhtex32.cbl
      ***           dfhc8rts.cpy dfhcbcfa.cpy dfhcpdup.cpy dfhcwenv.cpy
      ***           dfhcwlds.cpy dfhcwini.cpy
      ***
      ***  Revision 1.32  2005/10/09 21:57:20  sc
      ***  sc-i66 First stage check-in of TM Message Queues implementation;
      ***         Enhance error recovery and failure mode when TM control
      ***         has failed or is not yet initialized; Change MFS to access
      ***         control blocks from the path setting of IMSMFSP; Create/
      ***         access message queues from the setting of IMSMESGQ where
      ***         IMSMESGQ=<queue-file-name>;<queue-file-blocks>;<queue-
      ***         file-buffers>;The default queue location is TXRFDIR;
      ***         Default blocks is 1024 and default buffers is 4; Maximum
      ***         block count is 63488; Maximum buffer count is 64; The
      ***         queue file is physically MF format var-length sequential
      ***         with a maximum record length of 63488; The maximum queue
      ***         file size is 3,999,777,940; This limit is imposed by the
      ***         limits of the 32 bit COBOL RTS file handling primitives
      ***         and of MF var-length sequential file formats;
      ***    Mod: casdbc.cbl   casgate.cbl  casmpr.cbl   casrdo5.cbl
      ***         castmc.cbl   casxmast.htm caszyims.cbl dfhc8rts.cpy
      ***         dfhcbcsa.cpy dfhcbmgr.cpy dfhcpgrq.cpy dfhcptrf.cpy
      ***         messages     testseq.cbl
      ***
      ***  Revision 1.31  2005/09/16 22:29:15  sc
      ***  sc-j59 Add transport for remote access to output datasets;
      ***         Put BINP parameter length definitions in dfhc8rts;
      ***         Accommodate BINP failure for parameters > 64k - 128;
      ***    Mod: casadmin.cbl casafile.cbl cascperr.cpy cascwmcc.cpy
      ***         casgreqt.cbl casout.cbl   casouta.cbl  cassub.cbl
      ***         cassuba.cbl  casutla.cbl  dfhc8rts.cpy dfhcptrf.cpy
      ***         dfhgerr.cbl  messages
      ***
      ***  Revision 1.30  2005/09/01 17:52:22  njf
      ***  nx-258 - minor change to allow password to be passed
      ***           in sign-on exit and enabled ES_SERVER env var.
      ***  Modules: dfherdio.cbl dfh0cfg.cbl
      ***           dfhc8rts.cpy
      ***
      ***  Revision 1.29  2003/02/12 14:01:02  PEH
      ***  peh554 - Change 78-cbn-classify-byte to x'91' to work
      ***           around link problems.
      ***  modules: dfhc8rts.cpy
      ***
      ***
      ***     Rev 1.28   Feb 12 2003 14:01:02   PEH
      ***  peh554 - Change 78-cbn-classify-byte to x'91' to work
      ***           around link problems.
      ***  modules: dfhc8rts.cpy
      ***
      ***     Rev 1.27   21 Jan 2003 11:40:24   NJF
      ***  nx-107 - change default CAS name from ASEECAS to ESDEMO
      ***  Modules: dfhc8rts.cpy
      ***
      ***     Rev 1.26   20 Jan 2003 17:39:18   NJF
      ***  nx-107 - change default CAS name from ASEECAS to ESDEMO
      ***  Modules: dfhc8rts.cpy
      ***
      ***     Rev 1.25   Nov 30 2002 20:59:56   PMW
      ***  pw-212    Primarily changes to default CAS startup. Defaults
      ***            the main internal paths TXRDTP, TXTRANP, TXFILEP
      ***            and TXMAPP so that region comes up with no config.
      ***            One or two changes concerned with startup/shutdown
      ***            issues hit during tests.
      ***  Modules:  casstart.cbl, dfh0cfg.cbl,  dfh0crtp.cbl, dfhdev.cbl,
      ***            dfhgreqc.cbl, dfhmc2fc.cbl, dfhmc2ru.cbl, dfhmd.cbl,
      ***            dfhpbms.cbl,  dfhpcbcu.cbl, dfhpcrem.cbl, dfhpcupg.cbl,
      ***            dfhrdtup.cbl, dfhtxp.cbl,   dfhtxpq.cbl,  dfhxichk.cbl,
      ***            dfhc8rts.cpy, dfhcbmgr.cpy, dfhcpcmd.cpy, dfhcpism.cpy,
      ***            dfhcpkcp.cpy, dfhcplck.cpy, dfhcpmrg.cpy, dfhcpsec.cpy,
      ***            killterm.cbl, MODSIT.CBL
      ***
      ***     Rev 1.24   12 Nov 2002 12:45:18   NJF
      ***  nx-081 - add debug server start-up request to
      ***           casgate admin interface
      ***           Fix regression introduced by ASEECAS default
      ***           APPLID changes on non-UNIX platforms.
      ***           Fix get cassi list admin function.
      ***  Modules: casgate.cbl  dfhecics.cbl
      ***           cascbhyd.cpy dfhc8rts.cpy dfhcpgrm.cpy
      ***
      ***     Rev 1.23   Nov 08 2002 14:06:02   PMW
      ***  pw-189    Various changes to get build system working with
      ***            shape.
      ***  Modules:  dfh0cfg.cbl,  dfhpcrd.cbl,  dfhcpsec.cpy, dfhc8rts.cpy,
      ***            crcascfg.cbl, txmake.ctl
      ***
      ***     Rev 1.22   Nov 04 2002 17:12:44   PMW
      ***  aix017    Two changes targetting Unix.
      ***            Changes to config processing to remove reliance on
      ***            dfhtx.cfg and to default to /var/mfcobol/cas as
      ***            regionbase and target for lock files, gin files etc.
      ***            Secondly address the issue of authority through the
      ***            use of unix group ownership of modules. This is mainly
      ***            in the new dfhc?sec.cpy modules and invoked from dfh0cfg
      ***            at initialisation.
      ***
      ***  Modules: dfhcwmsg.cpy, dfh0cfg.cbl,  cicsecm.cbl,  dfhmd.cbl,
      ***           casstart.cbl, txmake.ctl,   dfhcwfnf.cpy, dfhcpcds.cpy,
      ***           dfhcpcfi.cpy, dfhcbcfr.cpy, dfhc8rts.cpy, messages
      ***  New Modules:
      ***           dfhcwsec.cpy, dfhcbsec.cpy, dfhcpsec.cpy
      ***
      ***     Rev 1.21   23 Oct 2002 21:16:08   NJF
      ***  nx-070 - hide system level service definitions
      ***           additional trace for MFDS calls
      ***  Modules: dfhetstd.cbl dfhgterm.cbl dfhginit.cbl dfheini1.cbl
      ***           dfheserv.cbl
      ***           dfhcpism.cpy cascpcfg.cpy dfhc8rts.cpy cascwrdt.cpy
      ***           dfhcprdt.cpy
      ***           casrdo1.cbl  casasys.cbl  casasrvc.cbl
      ***           traceid.doc
      ***
      ***     Rev 1.20   27 May 2002 22:48:26   SC
      ***  sc-908 AIX port and MQ work
      ***
      ***     Rev 1.19   16 May 2002 11:10:38   SC
      ***  sc-905 Port to AIX, ASEE Table manager, Dump/Trace
      ***
      ***     Rev 1.18   27 Mar 2002 11:09:46   NJF
      ***  asee01 - Initial port of MFE/CICS to NX as part of
      ***           SolCorp work. Subset of CICS functionality to
      ***           be delivered as a NX AddPack.
      ***           Includes work to support long/spacey filenames
      ***           on NX/MFE and in future SX. (not complete)
      ***           This work also forms part of Web Services engine
      ***           and has attempted to keep a common code base
      ***           across all products.
      ***  Modules: cicsecm.cbl  dfh0cfg.cbl  dfh0cfgp.cbl dfh0conf.cbl
      ***           dfhebms.cbl  dfhecics.cbl dfhefctl.cbl dfheini1.cbl
      ***           dfherdio.cbl dfhetrm1.cbl dfhginit.cbl dfhmd.cbl
      ***           dfhrem.cbl   dfhtxs.cbl   mvstrig.cbl
      ***           dfhc8rts.cpy dfhcpcds.cpy dfhcpcmd.cpy dfhcpdev.cpy
      ***           dfhcpdir.cpy dfhcpism.cpy dfhcpitb.cpy dfhcplds.cpy
      ***           dfhcpmrg.cpy dfhcprdt.cpy dfhcprel.cpy dfhcpscn.cpy
      ***           dfhctxcm.cpy dfhcwcmd.cpy dfhcwdir.cpy dfhcwfnf.cpy
      ***           dfhcwism.cpy dfhcwlds.cpy dfhcwmrg.cpy dfhcwscn.cpy
      ***           dfhc8srv.cpy
      ***           makegen.cbl + more!
      ***
      ***     Rev 1.17   16 Nov 1998 15:58:18   NJF
      ***  mvs089 - location of PL/I product has moved again.
      ***           Now determine location from MFPLI component
      ***           rather than registry.
      ***           Also added start of LE support in MFE.
      ***           Made makegen self-resident on new painter.
      ***  Modules: dfh0cfg.cbl  dfh0cfgp.cbl dfheini1.cbl dfheibmq.cbl
      ***           dfhcwitb.cpy dfhcpitb.cpy dfhcbitb.cpy dfhc8rts.cpy
      ***           dfhcbcfa.cpy
      ***           makegen.cbl
      ***
      ***
      ***     Rev 1.16   26 Feb 1998 16:57:36   NJF
      ***  504674 - raise RTS170 error if CICS program executed
      ***           without CICS sub-system being active.
      ***  Modules: dfheuser.cbl dfhc8rts.cpy
      ***
      ***     Rev 1.15   29 Jul 1997 19:31:16   MJW
      ***  mjwECM Added 78-level for CBL_FLUSH_FILE used in ECM dumps.
      ***    Modules: dfhc8rts.cpy
      ***  ----------
      ***
      ***
      ***     Rev 1.14   25 Feb 1997 10:30:28   PMW
      ***  pwCORE    MFIO enablement for BMS generation and COBOL
      ***            compilations.
      ***
      ***  Modules:  dfhpbms.cbl,  dfhpcbcu.cbl, dfhpgini.cbl, dfhpmgen.cbl,
      ***            dfhc8rts.cpy, dfhcpfnf.cpy, dfhcpscn.cpy, dfhcwfnf.cpy,
      ***            bmsgen.cbl,   fsisload.cbl, mf-intf.cbl,  scrload.cbl
      ***
      ***     Rev 1.13   18 Oct 1996 14:19:34   PEH
      ***  n44647 - Remove minimum record length check.
      ***           Don't pass path to FS if set to ".".
      ***  modules: dfhcpfuf.cpy dfhc8rts.cpy dfhefctl.cbl
      ***
      ***     Rev 1.12   13 Sep 1996 12:44:22   MJW
      ***  ----------
      ***  N42822 Add support for new RTS feature to be able to force EXIT
      ***         PROGRAM at return from a called module in a non-CICS program.
      ***         This removes the restriction on non-CICS programs called in
      ***         a CICS transaction that they had to check the return-code and
      ***         exit immediately when it is 16 to make certain CICS transitions
      ***         work correctly.  These transitions will now work correctly if
      ***         the non-CICS program is checked with the new CALLRECOVERY
      ***         directive.
      ***    Modules: dfheini1.cbl  dfhepctc.cbl  dfheserv.cbl  dfheuser.cbl
      ***             dfhxc2pp.cbl  dfhc8rts.cpy  dfhcbapi.cpy  dfhcbatp.cpy
      ***             messages
      ***  ----------
      ***
      ***     Rev 1.11   09 Aug 1996 16:34:06   SC
      ***  P24730 ER:CICS OS/2 supports a default system remote id for trans ids
      ***    if transactions are not found it will go check on remote system
      ***    Customer would like the same functionality in the MCO product.
      ***   Module: dfhcbcsa.cpy dfhcbrdr.cpy dfhcwtmp.cpy dfhcptmp.cpy
      ***           dfhcbpct.cpy dfhcprdt.cpy dfhrval.cbl  dfhc8rts.cpy dfhrapi.cbl
      ***
      ***     Rev 1.10   04 Jun 1996 14:04:34   NJF
      ***  p30318 - modifications to maximum filename sizes.
      ***           Made file path, file basename and file
      ***           extensions 78's in dfhc8rts to allow for
      ***           easy modifications. Increased the size of
      ***           the basename from 8 to 44 characters for
      ***           reported pdr. Note: this will increase the
      ***           working storage size.
      ***  Modules: dfh0cmsd.cbl dfh0cmst.cbl dfhe3270.cbl dfhe32db.cbl
      ***           dfhefctl.cbl dfherdcv.cbl dfherdio.cbl dfhgatch.cbl
      ***           dfhgfshr.cbl dfhgjcp.cbl  dfhmoclr.cbl dfhmon.cbl
      ***           dfht3prt.cbl dfhtasci.cbl
      ***           dfhc8rts.cpy dfhcbfpe.cpy dfhcpfnf.cpy dfhcwfnf.cpy
      ***           dfhcwscn.cpy
      ***           dfhzcqit.cbl dfhzplt.cbl
      ***
      ***     Rev 1.9   23 Feb 1996 03:34:40   JTF
      ***  p27907 - Enable dsect Align to be configurable in Painter
      ***         - Fully reworked config file save processing
      ***         Test(s): pending
      ***         Modules: bmsgen.cbl  mf-intf.cbl  bmsgen01.cpy
      ***                  bmsgen03.cpy bmsgen06.cpy bmsgen10.cpy
      ***                  bmsimp01.cpy mf-bmscf.cpy mf-mnu01.cpy
      ***                  mf-mnu07.cpy mf-mnu08.cpy scrconst.cpy
      ***                  tag-prc.cpy  tag-var.cpy  screens.cfg
      ***                  s-init.cpy   fem-cr07.cpy mfinit.cpy
      ***                  dfhc8rts.cpy
      ***
      ***     Rev 1.8   07 Feb 1996 10:05:18   JTF
      ***  p15727 - Detect field macro overlap
      ***         - Detect field macros out of sequence
      ***         Test(s): p015727a created
      ***         Modules: dfhc8rts.cpy scrload.cbl  bmsimp01.cpy
      ***                  bmsimp02.cpy bmsimp03.cpy scrload6.cpy
      ***
      ***     Rev 1.7   14 Dec 1995 04:13:54   MJW
      ***  N31059 Redesign/Reimplement CALL Handling in CICS Programs
      ***         Changes to support calls from non-CICS programs and to
      ***         support non-main Entry points in CICS programs.
      ***         ----------
      ***         Prologue processing and 'Exit' processing revised to
      ***         support non-CICS callers and non-main Entry points.
      ***         ----------
      ***    Modules: dfheini1.cbl  dfhepctc.cbl  dfheserv.cbl  dfheuser.cbl
      ***             dfhgcsaa.cbl  dfhxc2pc.cbl  dfhxc2pp.cbl  dfhxppin.cbl
      ***             dfhzai.cbl    dfhzcins.cbl  dfhzcmap.cbl  stutest1.cbl
      ***             messages      dfhc8prp.cpy  dfhc8rts.cpy  dfhc8srv.cpy
      ***             dfhcbapi.cpy  dfhcbatp.cpy  dfhcbppt.cpy  dfhcbprp.cpy
      ***             dfhclapi.cpy  dfhclusr.cpy  dfhcpapi.cpy  dfhcpcvt.cpy
      ***             dfhcprdt.cpy  dfhctepi.cpy  dfhctexe.cpy  dfhctpro.cpy
      ***             dfhctws.cpy   dfhcwapi.cpy
      ***  ----------
      ***
      ***     Rev 1.6   06 Nov 1995 03:11:22   jtf
      ***  p26158 - Add support for unsized maps, using relative field
      ***           positioning
      ***         Test(s): Delivering p026158a
      ***         Modules: bmsgen.cbl   dfhpmgen.cbl scrload.cbl
      ***                  readmod.cbl  dfhc8rts.cpy dfhcwmfl.cpy
      ***                  mpmappws.cpy bmsgen02.cpy bmsgen03.cpy
      ***                  bmsgen06.cpy bmsgen10.cpy bmsimp02.cpy
      ***                  bmsimp03.cpy fem-cr04.cpy fem-cr11.cpy
      ***                  mf-bmsmd.cpy mf-mnu19.cpy scrload6.cpy
      ***                  dbmapm.doc
      ***
      ***     Rev 1.5   11 Oct 1995 11:29:06   NJF
      ***  nf-056 - Increased the config item path and environment
      ***           variable lengths from 256 to 1024. Added checks
      ***           within config processing to detect a config item
      ***           overflow (only COBCPY at this time).
      ***  Modules: dfhecics.cbl dfhepctc.cbl dfhebms.cbl dfh0cfg.cbl
      ***           dfhcbcfr.cpy dfhcpcfe.cpy dfhcwenv.cpy dfhcpenv.cpy
      ***           dfhc8rts.cbl messages
      ***
      ***     Rev 1.4   21 Sep 1995 14:00:52   CHJB
      ***  cjbcob add COBPATH
      ***
      ***     Rev 1.3   23 May 1995 19:33:32   TJC
      ***  n38229: Added '/b' switch to backup rdo file.
      ***
      ***          modules: dfhpcupg.cbl dfhcwcmd.cpy dfhc8rts.cpy
      ***
      ***     Rev 1.2   12 May 1995 08:27:58   jtf
      ***  N37922 - Enable Ctrl-Break during command-line processing.
      ***           Also storing setting on entry and restoring on exit.
      ***         - Tests:    None yet (having trouble automating)
      ***         - Modules:  advscrns.cbl s-init.cpy   dfhc8rts.cpy
      ***
      ***     Rev 1.1   03 Mar 1995 17:31:42   DAJC
      ***  n10087 - Keyboard remap. Key selections are made in
      ***           dfhe3270.cfg. On client start up the file is parsed
      ***           by dfh0conf and used to update the values held in
      ***           Working Storage.
      ***  Modules: dfh0conf.cbl dfh0keys.cbl dfhe3270.cbl dfht3270.cbl
      ***           dfhtinit.cbl adiskey.cpy  colors.cpy   dfhc8rts.cpy
      ***           dfhcbcol.cpy dfhcbkey.cpy dfhcpb32.cpy dfhcpkey.cpy
      ***           dfhcpt3p.cpy dfhcpt3t.cpy dfhcwkey.cpy dfhcwt32.cpy
      ***           dispkeys.cpy parsecfg.cpy dfh3270.cfg
      ***
      ***     Rev 1.0   10 Feb 1995 11:27:46   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***--------------------------------------------------------------*
      ***                                                             *
      ***    COBOL RTS CALL-BY-NUMBER ROUTINES/PARAMETERS             *
      ***                                                             *
      ***--------------------------------------------------------------*

       78  78-cbn-interprogram-functs  value x'91'.
N31059 78  78-cbn-caller-id-funct      value 37.
N31059
p26158 78  78-cbn-control-screen       value x'A7'.
       78  78-cbn-beep                 value x'E5'.
N37922 78  78-cbn-handle-fn-keys       value x'B0'.
       78  78-cbn-pack-byte            value x'F4'.
       78  78-cbn-unpack-byte          value x'F5'.
peh554*sc-905$if   MTS-ASEE defined
peh554 *> -- Recode with CBL_CLASSIFY_DBCS_CHAR if DBCS support reqd.
sc-905 78  78-cbn-classify-byte        value x'91'. *>-To bypass errors
peh554*sc-905$else MTS-ASEE defined
peh554*78  78-cbn-classify-byte        value x'BB'.
peh554*sc-905$end not MTS-ASEE defined
       78  78-cbn-classify-string      value x'C7'.
N31059
N31059 78  78-cbn-get-name-for-id      value x'F3'.
504674 78  78-cbn-force-rts-error      value x'8F'.

      ***--------------------------------------------------------------*
      ***                                                             *
      ***    COBOL RTS CALL-BY-NAME ROUTINES/PARAMETERS               *
      ***                                                             *
      ***--------------------------------------------------------------*

       78  78-cbl-file-handler         value 'FHREDIR'.
       78  78-cbl-fileshare-status     value 'fs_status'.

       78  78-pgm-dialog-system        value 'sysrun'.
       78  78-pgm-dialog-system-trap   value 'DS'.
       78  78-pgm-hyhelp               value 'hyhelp'.
       78  78-pgm-online               value 'on-line'.
       78  78-pgm-CMENU                value 'cmenu'.

       78  78-cbl-join-filename        value 'CBL_JOIN_FILENAME'.
       78  78-cbl-split-filename       value 'CBL_SPLIT_FILENAME'.
       78  78-cbl-locate-file          value 'CBL_LOCATE_FILE'.

       78  78-cbl-delete-file          value 'CBL_DELETE_FILE'.
       78  78-cbl-rename-file          value 'CBL_RENAME_FILE'.

       78  78-cbl-create-file          value 'CBL_CREATE_FILE'.
       78  78-cbl-open-file            value 'CBL_OPEN_FILE'.
       78  78-cbl-read-file            value 'CBL_READ_FILE'.
       78  78-cbl-write-file           value 'CBL_WRITE_FILE'.
       78  78-cbl-close-file           value 'CBL_CLOSE_FILE'.
mjwECM 78  78-cbl-flush-file           value 'CBL_FLUSH_FILE'.

       78  78-cbl-open-vfile           value 'CBL_OPEN_VFILE'.
       78  78-cbl-read-vfile           value 'CBL_READ_VFILE'.
       78  78-cbl-write-vfile          value 'CBL_WRITE_VFILE'.
       78  78-cbl-close-vfile          value 'CBL_CLOSE_VFILE'.

pwCORE 78  78-mfiofh                   value 'MFIO'.

pwCORE 78  78-mfio-join-filename       value 'MFIO_JOIN_FILENAME'.
pwCORE 78  78-mfio-split-filename      value 'MFIO_SPLIT_FILENAME'.
pwCORE 78  78-mfio-locate-file         value 'MFIO_LOCATE_FILE'.

pwCORE 78  78-mfio-delete-file         value 'MFIO_DELETE_FILE'.
pwCORE 78  78-mfio-rename-file         value 'MFIO_RENAME_FILE'.

pwCORE 78  78-mfio-create-file         value 'MFIO_CREATE_FILE'.
pwCORE 78  78-mfio-open-file           value 'MFIO_OPEN_FILE'.
pwCORE 78  78-mfio-read-file           value 'MFIO_READ_FILE'.
pwCORE 78  78-mfio-write-file          value 'MFIO_WRITE_FILE'.
pwCORE 78  78-mfio-close-file          value 'MFIO_CLOSE_FILE'.

pwCORE 78  78-mfio-open-vfile          value 'MFIO_OPEN_VFILE'.
pwCORE 78  78-mfio-read-vfile          value 'MFIO_READ_VFILE'.
pwCORE 78  78-mfio-write-vfile         value 'MFIO_WRITE_VFILE'.
pwCORE 78  78-mfio-close-vfile         value 'MFIO_CLOSE_VFILE'.


       78  78-cbl-to-uppercase         value 'CBL_TOUPPER'.
       78  78-cbl-to-lowercase         value 'CBL_TOLOWER'.

       78  78-cbl-exit-proc            value 'CBL_EXIT_PROC'.
N42822
N42822 78  78-cbl-thread-set-flag      value 'CBL_THREAD_SETC'.
N42822 78  78-cbl-thread-clear-flag    value 'CBL_THREAD_CLEARC'.
N42822 78  78-cbl-thread-test-flag     value 'CBL_THREAD_TESTC'.

       78  78-cbl-AND                  value 'CBL_AND'.
       78  78-cbl-OR                   value 'CBL_OR'.

       78  78-cbl-change-directory     value 'CBL_CHANGE_DIR'.
       78  78-cbl-read-directory       value 'CBL_READ_DIR'.
asee01 78  78-cbl-get-current-dir      value 'CBL_GET_CURRENT_DIR'.

       78  78-cvrt-ptr-to-BLL          value '_PTRFN2'.
       78  78-cvrt-BLL-to-ptr          value '_PTRFN1'.

       78  78-cvrt-codeset             value '_CODESET'.
       78  78-cvrt-ascii-to-ebcdic     value x'01'.
       78  78-cvrt-ebcdic-to-ascii     value x'00'.
       78  78-cvrt-DBCS-sJIS-to-ebcdic value x'05'.
       78  78-cvrt-DBCS-ebcdic-to-sJIS value x'04'.

p15727 78  78-cbl-alloc-mem            value 'CBL_ALLOC_MEM'.
p27907 78  78-cbl-free-mem             value 'CBL_FREE_MEM'.
       78  78-cbl-get-operating-system value 'CBL_GET_OS_INFO'.
       78  78-cbl-subsystem            value 'CBL_SUBSYSTEM'.

       78  78-cbl-get-keyboard-status  value 'CBL_GET_KBD_STATUS'.
       78  78-cbl-read-keyboard-char   value 'CBL_READ_KBD_CHAR'.

       78  78-cbl-get-screen-size      value 'CBL_GET_SCR_SIZE'.
       78  78-cbl-set-cursor-position  value 'CBL_SET_CSR_POS'.

       78  78-cbl-clear-screen         value 'CBL_CLEAR_SCR'.
       78  78-cbl-read-screen          value 'CBL_READ_SCR_CHATTRS'.
       78  78-cbl-write-screen         value 'CBL_WRITE_SCR_CHATTRS'.
       78  78-cbl-get-screen-graphics  value 'CBL_GET_SCR_GRAPHICS'.
       78  78-cbl-get-draw-characters  value 'CBL_GET_SCR_LINE_DRAW'.
n38229 78  78-cbl-copy-file            value 'CBL_COPY_FILE'.

       78  78-cbl-set-pc-attributes    value
                                       'CBL_SCR_SET_PC_ATTRIBUTES'.
       78  78-cbl-save-attributes      value 'CBL_SCR_SAVE_ATTRIBUTES'.
       78  78-cbl-restore-attributes   value
                                       'CBL_SCR_RESTORE_ATTRIBUTES'.

       78  78-fs-check-file-exist      value 'FS_CHECK_FILE_EXIST'.
       78  78-fs-close-file            value 'FS_CLOSE_FILE'.
       78  78-fs-create-file           value 'FS_CREATE_FILE'.
       78  78-fs-copy-file             value 'FS_COPY_FILE'.
       78  78-fs-delete-file           value 'FS_DELETE_FILE'.
       78  78-fs-locate-file           value 'FS_LOCATE_FILE'.
       78  78-fs-open-file             value 'FS_OPEN_FILE'.
       78  78-fs-read-file             value 'FS_READ_FILE'.
       78  78-fs-rename-file           value 'FS_RENAME_FILE'.
       78  78-fs-write-file            value 'FS_WRITE_FILE'.
       78  78-fs-SIGNON                value 'fhrdrpwd'.

      ***--------------------------------------------------------------*
      ***                                                             *
      ***    MCO / MCOU CODESET and OS Independent Values             *
      ***                                                             *
      ***--------------------------------------------------------------*

       78  78-sys-ascii-spaces         value x'20'.
       78  78-sys-ebcdic-spaces        value x'40'.

       78  78-sys-unix-separator       value '/'.
       78  78-sys-os2-separator        value '\'.

       78  78-sys-unix-env-delimiter   value ':'.
       78  78-sys-os2-env-delimiter    value ';'.

      $IF OSMCO = "UNIX"
       78  78-sys-separator            value 78-sys-unix-separator.
       78  78-sys-envvar-delimiter     value 78-sys-unix-env-delimiter.
      $ELSE
       78  78-sys-separator            value 78-sys-os2-separator.
       78  78-sys-envvar-delimiter     value 78-sys-os2-env-delimiter.
       78  78-drive-delimiter          value ':'.
      $END

       78  78-sys-line-nw              value 68.
       78  78-sys-left-arrowhead       value x'11'.
       78  78-sys-horizontal-single-line value 5.
n44647 78  78-sys-curr-dir             value '.'.

      ***-- Fileshare server IDs are prefixed with $$
       78  78-fileshare-server-prefix  value x'2424'.
       78  78-FHREDIR-env-name         value x'4648524544495220'.

      ***--------------------------------------------------------------*
      ***                                                             *
      ***    MCO / MCOU FILE PATH, NAME, EXT LITERALS                 *
      ***                                                             *
      ***  These 78s are used to provide ASCII literals for filenames *
      ***  and environment variables regardless of compiled codeset.  *
      ***  Note that they all have a trailing ASCII space appended.   *
      ***                                                             *
      ***--------------------------------------------------------------*

      ***  -- RDT File Names

       78  78-MCODCT00-file-name       VALUE x'4D434F444354303020'.
       78  78-MCOFCT00-file-name       VALUE x'4D434F464354303020'.
       78  78-MCOJCT00-file-name       VALUE x'4D434F4A4354303020'.
       78  78-MCOPCT00-file-name       VALUE x'4D434F504354303020'.
       78  78-MCOTCT00-file-name       VALUE x'4D434F544354303020'.

       78  78-MCOSDF00-file-name       VALUE x'4D434F534446303020'.
       78  78-MCOSCR00-file-name       VALUE x'4D434F534352303020'.

       78  78-DAT-file-ext             VALUE x'44415420'.

       78  78-MCOCICS-file-name        VALUE x'4D434F4349435320'.
       78  78-CFG-file-ext             VALUE x'43464720'.

       78  78-CLI-file-name            VALUE x'434C4920'.
       78  78-COBCLI-file-name         VALUE x'434F42434C4920'.

       78  78-PCIMS-file-name          VALUE x'5043494D5320'.
       78  78-XDBLIB-file-name         VALUE x'5844424C494220'.
       78  78-GTICICS-file-name        VALUE x'4754494349435320'.
       78  78-HCO-file-name            VALUE x'4D4648434F4C494220'.
      $IF AIX defined
       78  78-LBR-file-ext             VALUE x'6C627220'.
      $ELSE
       78  78-LBR-file-ext             VALUE x'4C425220'.
      $END

      ***  -- Enviroment Variables  (including leading $ symbol)

       78  78-CICS-env-path            VALUE x'244349435320'.
       78  78-CICSCTL-env-path         VALUE x'244349435343544C20'.
       78  78-CICSTEST-env-path        VALUE x'24434943535445535420'.
       78  78-CICSDATA-env-path        VALUE x'24434943534441544120'.
       78  78-CICSMAPS-env-path        VALUE x'24434943534D41505320'.
       78  78-CICSTS-env-path          VALUE x'2443494353545320'.

       78  78-CICSSRC-env-path         VALUE x'244349435353524320'.
       78  78-CICSCPY-env-path         VALUE x'244349435343505920'.
       78  78-CICSBMS-env-path         VALUE x'2443494353424D5320'.
       78  78-CICSFORM-env-path        VALUE x'2443494353464F524D20'.
       78  78-CICSMFS-env-path         VALUE x'24434943534D465320'.
       78  78-CICSEXTR-env-path        VALUE x'24434943534558545220'.

       78  78-COBCPY-env-name          VALUE 'COBCPY'.
       78  78-COBCPY-env-path          VALUE '$'     &
                                             78-COBCPY-env-name.
cjbcob 78  78-COBPATH-env-name         VALUE 'COBPATH'.
cjbcob 78  78-COBPATH-env-path         VALUE '$'     &
cjbcob                                       78-COBPATH-env-name.

       78  78-COBDIR-env-path          VALUE x'24434F4244495220'.
       78  78-COBDIR-env-name          VALUE x'434F4244495220'.

       78  78-IMSDIR-env-path          VALUE x'24494D5344495220'.
       78  78-XDBDIR-env-path          VALUE x'2458444244495220'.
       78  78-GTICICS-env-path         VALUE x'244754494349435320'.
       78  78-HCO-env-path             VALUE x'2448434F44495220'.
       78  78-RCMDIR-env-path          VALUE x'2452434D44495220'.

       78  78-CICSLOC-env-var          VALUE x'434943534C4F4320'.
       78  78-CICSSYS-env-var          VALUE x'4349435353595320'.

      *78  78-xxxxxxxx-literal         VALUE x'1...5...10...15...20'.

      ***-- CCITCP2 environment values, holds machine name for CCITCP
      ***-- registration eg. dfhtcci
       78  78-CCITCP2-env-name        VALUE x'4343495443503220'.
       78  78-CCITCP2-env-path        VALUE x'24'   &
                                            78-CCITCP2-env-name.

      ***-- environment variables for TXDIR + TXRDIR + TXREGN
      ***-- NOTE: NO trailing space appended
aix017$if UNIX defined
aix017$if AIX defined
aix017 78  78-LIBPATH-env-name         value 'LIBPATH'.
aix017$end (AIX defined)
aix017$end (UNIX defined)
       78  78-TXDIR-env-name          VALUE 'TXDIR'.
       78  78-TXRDIR-env-name         VALUE 'TXRDIR'.
nx-258$if MTS-ASEE defined
nx-258 78  78-TXREGN-env-name         VALUE 'ES_SERVER'.
nx-258$else
       78  78-TXREGN-env-name         VALUE 'TXREGN'.
nx-258$end (MTS-ASEE defined)

       78  78-TXDIR-env-path          VALUE x'24'  &
                                            78-TXDIR-env-name.
       78  78-TXRDIR-env-path         VALUE x'24'  &
                                            78-TXRDIR-env-name.
       78  78-TXREGN-env-path         VALUE x'24'    &
                                            78-TXREGN-env-name.

      ***-- environment variable name without leading '$'
       78  78-TXMAPP-env-name         VALUE 'TXMAPP'.
       78  78-TXTRANP-env-name        VALUE 'TXTRANP'.
       78  78-TXFILEP-env-name        VALUE 'TXFILEP'.
       78  78-TXRDTP-env-name         VALUE 'TXRDTP'.
       78  78-TXRFDIR-env-name        VALUE 'TXRFDIR'.
       78  78-TXSYSFP-env-name        VALUE 'TXSYSFP'.
       78  78-TXBMS-env-name          VALUE 'TXBMS'.
       78  78-COBHNF-env-name         VALUE 'COBHNF'.
       78  78-TXCBLSRC-env-name       VALUE 'TXCBLSRC'.
       78  78-TXBMSSRC-env-name       VALUE 'TXBMSSRC'.
       78  78-TXCPYSRC-env-name       VALUE 'TXCPYSRC'.
       78  78-TXMFSSRC-env-name       VALUE 'TXMFSSRC'.
       78  78-TXBMSMST-env-name       VALUE 'TXBMSMST'.
       78  78-TXBMSCPY-env-name       VALUE 'TXBMSCPY'.
       78  78-TXCBLGNT-env-name       VALUE 'TXCBLGNT'.
       78  78-TXCURDIR-env-name       VALUE 'TXCURDIR'.
       78  78-HOME-env-name           VALUE 'HOME'.
n10087 78  78-TX3270-env-name         VALUE 'TX3270'.

      ***-- environment variables set up internally by TX
       78  78-TXMAPP-env-path         VALUE x'24'    &
                                            78-TXMAPP-env-name.
       78  78-TXTRANP-env-path        VALUE x'24'    &
                                            78-TXTRANP-env-name.
       78  78-TXFILEP-env-path        VALUE x'24'    &
                                            78-TXFILEP-env-name.
       78  78-TXRDTP-env-path         VALUE x'24'    &
                                            78-TXRDTP-env-name.
       78  78-TXRFDIR-env-path        VALUE x'24'    &
                                            78-TXRFDIR-env-name.
       78  78-TXSYSFP-env-path        VALUE x'24'    &
                                            78-TXSYSFP-env-name.
       78  78-TXBMS-env-path          VALUE x'24'    &
                                            78-TXBMS-env-name.
       78  78-COBHNF-env-path         VALUE x'24'    &
                                            78-COBHNF-env-name.
       78  78-TXCBLSRC-env-path       VALUE x'24'    &
                                            78-TXCBLSRC-env-name.
       78  78-TXBMSSRC-env-path       VALUE x'24'    &
                                            78-TXBMSSRC-env-name.
       78  78-TXCPYSRC-env-path       VALUE x'24'    &
                                            78-TXCPYSRC-env-name.
       78  78-TXMFSSRC-env-path       VALUE x'24'    &
                                            78-TXMFSSRC-env-name.
       78  78-TXBMSMST-env-path       VALUE x'24'    &
                                            78-TXBMSMST-env-name.
       78  78-TXBMSCPY-env-path       VALUE x'24'    &
                                            78-TXBMSCPY-env-name.
       78  78-TXCBLGNT-env-path       VALUE x'24'    &
                                            78-TXCBLGNT-env-name.
       78  78-TXCURDIR-env-path       VALUE x'24'    &
                                            78-TXCURDIR-env-name.
       78  78-HOME-env-path           VALUE x'24'    &
                                            78-HOME-env-name.
n10087 78  78-TX3270-env-path         VALUE x'24'    &
n10087                                      78-TX3270-env-name.

sc-908$if   MTS-ASEE defined
pw-189*sc-908 78  78-TX-default-APPLID       VALUE 'ASEECAS'.
nx-107*pw-189 78  78-TX-default-CAS-Name     VALUE 'ASEECAS'.
nx-107 78  78-TX-default-CAS-Name     VALUE 'ESDEMO'.
nx-081$if UNIX defined
pw-189 78  78-TX-default-APPLID       VALUE '#'.
nx-081$else
nx-081 *> --
nx-081 *> -- Temporary switch back to ASEECAS for non-UNIX platforms to resolve
nx-081 *> -- regression caused by pw-189 changes. Should probably change dfh0cfg
nx-081 *> -- logic rather than forcing down the non-default case base on APPLID value.
nx-081 *> --
nx-107*nx-081 78  78-TX-default-APPLID       VALUE 'ASEECAS'.
nx-107 78  78-TX-default-APPLID       VALUE 'ESDEMO'.
nx-081$end
nx-070 78  78-TX-default-SYSID        VALUE 'MCAS'.
sc-908$else MTS-ASEE defined
      ***-- Default MTS APPLID/REGION name = TXCICS
       78  78-TX-default-APPLID       VALUE 'TXCICS'.
sc-908$end not MTS-ASEE defined

pw-212 78  78-default-sit                  value 'DFH$IVP'.

      ***-- Default PATH length parameter
nf-056*78  78-max-line-length              VALUE 256.
nf-056 78  78-max-line-length              VALUE 1024.

nx-267***-- Default length for multi-path variables
nx-267 78  78-max-mpath-length             value
nx-267             78-max-line-length * 4.

mvs089*p30318 78  78-max-filepath-length          VALUE 256.
mvs089 78  78-max-filepath-length          VALUE 260.
p30318 78  78-max-basename-length          VALUE 44.
p30318 78  78-max-file-ext-length          VALUE 4.
p30318 78  78-max-file-fullname-length     VALUE 78-max-filepath-length
p30318                                         + 78-max-basename-length
p30318                                         + 78-max-file-ext-length.

P24730 78  78-default-pct-entry-ID         VALUE x'ffffffdd'.
P24730 78  78-default-pct-entry-ID-string  VALUE 'x''ffffffdd'''.
P24730 78  78-default-pct-entry-ID-len     VALUE 11.
P24730 78  78-default-pct-entry-ID-ext     VALUE 'default'.
P24730 78  78-default-pct-entry-ID-ext-ln  VALUE 7.

sc-j59 78  78-JES-casout-eof-message       value '$&EoF&$'.
sc-j59 78  78-JES-BINP-parm-length         value 65536 - 128.
sc-j59 78  78-JES-message-max-length value 78-JES-BINP-parm-length - 8.
sc-i66 78  78-hash-entry-count             value 67.

sc-i67 78  78-cbl-monitor-interleave       value 0.
sc-i67 78  78-cbl-monitor-read-priority    value 1.
sc-i67 78  78-cbl-monitor-browse           value
sc-i67                                    'CBL_MONITOR_BROWSE'.
sc-i67 78  78-cbl-monitor-browse-to-read   value
sc-i67                                    'CBL_MONITOR_BROWSE_TO_READ'.
sc-i67 78  78-cbl-monitor-browse-to-write  value
sc-i67                                    'CBL_MONITOR_BROWSE_TO_WRITE'.
sc-i67 78  78-cbl-monitor-open-intra       value
sc-i67                                    'CBL_MONITOR_OPEN_INTRA'.
sc-i67 78  78-cbl-monitor-read             value
sc-i67                                    'CBL_MONITOR_READ'.
sc-i67 78  78-cbl-monitor-release          value
sc-i67                                    'CBL_MONITOR_RELEASE'.
sc-i67 78  78-cbl-monitor-unbrowse         value
sc-i67                                    'CBL_MONITOR_UNBROWSE'.
sc-i67 78  78-cbl-monitor-unread           value
sc-i67                                    'CBL_MONITOR_UNREAD'.
sc-i67 78  78-cbl-monitor-unwrite          value
sc-i67                                    'CBL_MONITOR_UNWRITE'.
sc-i67 78  78-cbl-monitor-write            value
sc-i67                                    'CBL_MONITOR_WRITE'.
sc-i67 78  78-cbl-monitor-write-to-browse  value
sc-i67                                    'CBL_MONITOR_WRITE_TO_BROWSE'.

      ***--------------------------------------------------------------*
      ***  $Workfile:   dfhc8rts.cpy  $ end
      ***--------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.18  2002/11/04 17:12:42  PMW
      ***  aix017    Two changes targetting Unix.
      ***            Changes to config processing to remove reliance on
      ***            dfhtx.cfg and to default to /var/mfcobol/cas as
      ***            regionbase and target for lock files, gin files etc.
      ***            Secondly address the issue of authority through the
      ***            use of unix group ownership of modules. This is mainly
      ***            in the new dfhc?sec.cpy modules and invoked from dfh0cfg
      ***            at initialisation.
      ***
      ***  Modules: dfhcwmsg.cpy, dfh0cfg.cbl,  cicsecm.cbl,  dfhmd.cbl,
      ***           casstart.cbl, txmake.ctl,   dfhcwfnf.cpy, dfhcpcds.cpy,
      ***           dfhcpcfi.cpy, dfhcbcfr.cpy, dfhc8rts.cpy, messages
      ***  New Modules:
      ***           dfhcwsec.cpy, dfhcbsec.cpy, dfhcpsec.cpy
      ***
      ***  
      ***     Rev 1.17   Nov 04 2002 17:12:42   PMW
      ***  aix017    Two changes targetting Unix.
      ***            Changes to config processing to remove reliance on
      ***            dfhtx.cfg and to default to /var/mfcobol/cas as
      ***            regionbase and target for lock files, gin files etc.
      ***            Secondly address the issue of authority through the
      ***            use of unix group ownership of modules. This is mainly
      ***            in the new dfhc?sec.cpy modules and invoked from dfh0cfg
      ***            at initialisation.
      ***  
      ***  Modules: dfhcwmsg.cpy, dfh0cfg.cbl,  cicsecm.cbl,  dfhmd.cbl,
      ***           casstart.cbl, txmake.ctl,   dfhcwfnf.cpy, dfhcpcds.cpy,
      ***           dfhcpcfi.cpy, dfhcbcfr.cpy, dfhc8rts.cpy, messages
      ***  New Modules:
      ***           dfhcwsec.cpy, dfhcbsec.cpy, dfhcpsec.cpy
      ***  
      ***     Rev 1.16   04 Sep 2002 09:42:26   NJF
      ***  nx-044 - Allow multiple CASs to run on a single machine
      ***           using 'system directory' from CASDS.
      ***  Modules: dfhmd.cbl    dfh0cfg.cbl  dfheserv.cbl makegen.cbl
      ***           dfhcbcfr.cpy dfhcpcfe.cpy dfhcpgrq.cpy dfhcpcfi.cpy
      ***           messages
      ***  
      ***     Rev 1.15   16 Aug 2002 15:13:22   NJF
      ***  nx-036 - split out of CASDS config processing into a new module,
      ***           cascfg.
      ***           Allow for spacey filenames in IDT/location.
      ***  Modules: dfh0cfg.cbl  dfheini1.cbl dfhginit.cbl dfheserv.cbl
      ***           dfhcbcfr.cpy dfhcbast.cpy dfhcprdt.cpy dfhcpfnf.cpy 
      ***           dfhcpism.cpy 
      ***           txmake.ctl
      ***  New modules: cascfg.cbl cascbcfg.cpy cascpcfg.cpy
      ***  Dead modules: dfhcwds.cpy dfhcbds.cpy dfhcpds.cpy
      ***  
      ***     Rev 1.14   27 May 2002 22:46:36   SC
      ***  sc-908 AIX port and MQ work
      ***
      ***     Rev 1.13   17 Jul 2001 15:30:02   NJF
      ***  1022358 - Allow propagation of FHREDIR environment
      ***            variable to all CICS servers as there is
      ***            no IDE configuration setting.
      ***  Modules: dfh0cfg.cbl dfhcbcfr.cpy
      ***
      ***     Rev 1.12   05 Oct 1999 16:15:10   NJF
      ***  703539 - In multi-tasking the configuration is stored in
      ***           the registry. The paths were written to the registry
      ***           with a 1024 max length but were read into a 256 byte
      ***           area causing problems with long paths.
      ***  Modules: dfh0ntrg.cbl dfhcwntr.cpy dfhcpcfe.cpy dfh0cfg.cbl
      ***           dfhcbcfr.cpy
      ***
      ***     Rev 1.11   07 Apr 1998 15:14:22   NJF
      ***  mvs078 - Added example terminal/typeterm definitions
      ***           to shipped RDF.
      ***           Also added support for BMS LOADLIB setting from
      ***           IDE.
      ***  Modules: dfhcbcfr.cpy dfhcbitb.cpy dfhcpcfe.cpy dfhcpitb.cpy
      ***           dfhcwini.cpy dfhcwitb.cpy
      ***           dfh0cfg.cbl  dfhmon.cbl
      ***           dfhzcenv.cbl
      ***
      ***     Rev 1.10   26 Nov 1997 09:47:26   NJF
      ***  mvs054 - added config support for EXPOPUP state and AMODE31
      ***           bias.
      ***  Modules: dfhcbcfr.cpy dfhcbitb.cpy dfhcpcfe.cpy dfhcpism.cpy
      ***           dfhcpitb.cpy dfhcwitb.cpy dfh0cfg.cbl
      ***
      ***     Rev 1.9   24 Nov 1997 09:45:28   NJF
      ***  mvs053 - IDE allows config paths to be disabled so error
      ***           messages had to detail which config token was
      ***           missing.
      ***           Also added conditional compilation to allow ECI
      ***           to be built as a statically linked .dll on 32bit OS's.
      ***  Modules: dfheini1.cbl dfhtex32.cbl dfhgreq.cbl  dfh0cfg.cbl
      ***           dfhrem.cbl   dfhmd.cbl    dfhgreqc.cbl
      ***           dfhcbcfr.cpy dfhcbeci.cpy dfhcpcfe.cpy messages
      ***  New modules: m32-eci.mk
      ***
      ***     Rev 1.8   03 Nov 1997 17:20:14   PMW
      ***  pw-054    Initial MF protection work. Currently requires
      ***            directive CONSTANT MFPROT"1".
      ***
      ***  Modules:  cicsecm.cbl,  dfh0cfg.cbl,  mvstrig.cbl, dfhcbcfr.cpy
      ***            dfhcpcfi.cpy, dfhcppmi.cpy, pmi-ex.cpy,  pmi-ws.cpy,
      ***            messages.
      ***
      ***     Rev 1.7   02 Oct 1997 15:50:34   NJF
      ***  mvs036 - various changes to enable VDBASE project
      ***           configuration support. Still incomplete due
      ***           to IDELINK API problems/limitations.
      ***  Modules: dfheini1.cbl dfhginit.cbl dfheserv.cbl dfh0msg.cbl
      ***           dfh0cfg.cbl  dfhgdup.cbl  dfhmd.cbl    dfhrapi.cbl
      ***           dfh0crtp.cbl dfhecics.cbl dfhrem.cbl
      ***           dfhcbmgr.cpy dfhcpitb.cpy dfhcwitb.cpy dfhcbcfr.cpy
      ***           dfhcbcsa.cpy dfhcpism.cpy dfhc8ntr.cpy dfhcpmsg.cpy
      ***           dfhcwrdt.cpy dfhcprdt.cpy
      ***           messages
      ***  New Modules: dfhc8itb.cpy dfhcbitb.cpy
      ***
      ***     Rev 1.6   29 Sep 1997 14:25:10   NJF
      ***  mvs036 - various changes to enable VDBASE project
      ***           configuration support. Still incomplete due
      ***           to IDELINK API problems/limitations.
      ***  Modules: dfheini1.cbl dfhginit.cbl dfheserv.cbl dfh0msg.cbl
      ***           dfh0cfg.cbl  dfhgdup.cbl  dfhmd.cbl    dfhrapi.cbl
      ***           dfhcbmgr.cpy dfhcpitb.cpy dfhcwitb.cpy dfhcbcfr.cpy
      ***           dfhcbcsa.cpy dfhcpism.cpy
      ***           messages
      ***  New Modules: dfhc8itb.cpy dfhcbitb.cpy
      ***
      ***     Rev 1.5   15 Sep 1997 12:47:56   NJF
      ***  mvs034 -Various changes to initialisation. IMS failure at
      ***          startup now does not prevent region from starting.
      ***  Modules: dfheini1.cbl dfhpcbcu.cbl dfhpgini.cbl dfhrem.cbl
      ***           dfh0cfg.cbl  dfh0cfgp.cbl
      ***           dfhcbcfr.cpy dfhcpdev.cpy dfhcpdir.cpy dfhcpppc.cpy
      ***           dfhcpt3t.cpy dfhcwdir.cpy dfhcwmul.cpy
      ***
      ***     Rev 1.4   08 Sep 1997 17:07:28   NJF
      ***  mvs030 - Major changes to configuration support within
      ***           MVS Express (incomplete).
      ***           - dfhtx/dfhtxdev config files no longer used.
      ***           - gcf/rcf.bin files now use registry.
      ***           - region directory structure no longer required.
      ***           No access to project to read config file replacements
      ***           at this time, current directory used as work area as well
      ***           as system default search directories.
      ***
      ***  Modules: dfheini1.cbl dfhecics.cbl dfh0ntrg.cbl dfhrem.cbl
      ***           dfhmd.cbl    dfh0cfg.cbl  dfhpcpct.cbl
      ***           dfhc8ntr.cpy dfhcbcfr.cpy dfhcplck.cpy dfhcwntr.cpy
      ***
      ***  New Modules: dfhcpmrg.cpy dfhcwmrg.cpy dfhcpntr.cpy
      ***
      ***     Rev 1.3   17 Oct 1995 13:26:52   CHJB
      ***  cjbres - Advanced Organiser changes Add dfhpgres to resolve
      ***           date and time for the details view.
      ***           rename DFHPGBCU to dfhpgini
      ***           modules txmake.ctl txcase.cmd dfh0cfg.cbl dfhcbcfr.cpy
      ***                   mcopm40.adf mcont40.adf mcowg40.adf
      ***              new  dfhpgres.cbl resolver.cpy
      ***
      ***     Rev 1.2   11 Oct 1995 11:28:54   NJF
      ***  nf-056 - Increased the config item path and environment
      ***           variable lengths from 256 to 1024. Added checks
      ***           within config processing to detect a config item
      ***           overflow (only COBCPY at this time).
      ***  Modules: dfhecics.cbl dfhepctc.cbl dfhebms.cbl dfh0cfg.cbl
      ***           dfhcbcfr.cpy dfhcpcfe.cpy dfhcwenv.cpy dfhcpenv.cpy
      ***           dfhc8rts.cbl messages
      ***
      ***     Rev 1.1   15 Sep 1995 10:06:10   NJF
      ***  nf-040 - Changed initilisation code for all modules such
      ***           that 'set-initial-environment' , 'set-environment'
      ***           and 'set-txrdtp' have been removed from the system.
      ***           The functionality has been added to dfh0cfg.cbl.
      ***           A common copybook, dfhcpcfi, can be copied into the
      ***           initialisation section which will call dfh0cfg and
      ***           handle any initial configuration errors. Another
      ***           common copybook, dfhcpcfe, can be used to display any
      ***           further configuration errors - this requires that the
      ***           module including the copybook contains a 78 with the
      ***           module name.
      ***  Modules: dfh0cfg.cbl  dfhtxs.cbl   dfh25t30.cbl cicsprep.cbl
      ***           messages     dfhcpcfe.cpy dfhcwenv.cpy dfhcpmsg.cpy
      ***           dfhcpdev.cpy dfhcpenv.cpy dfhcbcfr.cpy dfhcpcfi.cpy
      ***           dfh25xms.cbl dfhcrtrg.cbl dfhdev.cbl   dfhff.cbl
      ***           dfhgdup.cbl  dfhgfshi.cbl dfhginfo.cbl dfhgjcpi.cbl
      ***           dfhgpca.cbl  dfhgrtrm.cbl dfhgtrtd.cbl dfhmcnfg.cbl
      ***           dfhmcoc.cbl  dfhmesds.cbl dfhmhelp.cbl dfhmigr.cbl
      ***           mfcics.cbl   dfheini1.cbl dfhmd.cbl    dfhginit.cbl
      ***           dfht3prt.cbl dfhpbms.cbl  dfhpcbcu.cbl dfhpcbon.cbl
      ***           dfhpccmp.cbl dfhpcmap.cbl dfhpcrd.cbl  dfhpcrem.cbl
      ***           dfhpcupg.cbl dfhpgbcu.cbl dfhpgbop.cbl dfhrdef.cbl
      ***           dfhregns.cbl dfhrem.cbl   dfhtcci.cbl  dfhv3xms.cbl
      ***           dfhxichk.cbl dfhxinit.cbl mcdfhcnv.cbl dfhecics.cbl
      ***           dfhgglbl.cbl advscrns.cbl txcase.cmd   txcase.sh
      ***           dfh30tnr.cbl dfhmon.cbl   dfhtxp.cbl   dfhpcin2.cbl
      ***
      ***     Rev 1.0   10 Feb 1995 11:28:44   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
         01 CfgRB.
            02 CfgRB-CfgArea-ptr pointer.
            02 CfgRB-Result  pic X(4).
               88 CfgRB-Result-OK-88    value low-values.
            02 filler redefines CfgRB-Result.
               03 CfgRB-ErrCode pic 9(4) comp-5.
                  88 CfgRB-Err-No-RegName-88      value  1.
                  88 CfgRB-Err-Bad-Line-88        value  2.
                  88 CfgRB-Err-FileNotFound-88    value  3.
                  88 CfgRB-Err-Create-88          value  4.
                  88 CfgRB-Err-Open-88            value  5.
                  88 CfgRB-Err-Read-88            value  6.
                  88 CfgRB-Err-Write-88           value  7.
                  88 CfgRB-Err-TXLOCAL-bad-88     value  8.
P18262            88 CfgRB-Err-TXDIR-invalid-88   value  9.
P18262            88 CfgRB-Err-TXRFDIR-invalid-88 value 10.
P17541            88 CfgRB-Err-dfh0msg-not-found-88 value 11.
P17541            88 CfgRB-Err-dfh0utl-not-found-88 value 12.
n26498            88 CfgRB-Err-dfhextfh-not-fnd-88 value 13.
nf-040            88 CfgRB-Err-TXSYSFP-invalid-88 value 14.
nf-040            88 CfgRb-Err-TXRDTP-invalid-88  value 15.
nf-040            88 CfgRb-Err-TXRDIR-invalid-88  value 16.
nf-056            88 CfgRB-Err-ENVVAR-overflow-88 value 17.
mvs030            88 CfgRB-Err-MFEXTMAP-not-fnd-88 value 18.
pw-054            88 CfgRB-Err-MFProt-failed-88    value 19.
nx-036            88 CfgRB-Err-cascfg-not-found-88 value 20.
aix017            88 CfgRB-Err-sec-grp-err-88      value 21.
aix017            88 CfgRB-Err-sec-module-unknown-88
aix017                                             value 22.
aix017            88 CfgRB-Err-sec-grp-unknown-88  value 23.
aix017            88 CfgRB-Err-sec-not-auth-88     value 24.
               03 CfgRB-ErrQual pic 9(4) comp-5.
nf-056            88 CfgRB-ErrQual-COBCPY-88       value 1.
sc-908            88 CfgRB-ErrQual-VDBASE-88       value 99.
mvs053$if GENESIS defined
mvs053            88 CfgRB-ErrQual-RDTDIR-88       value 1.
mvs053            88 CfgRB-ErrQual-WORKDIR-88      value 2.
mvs053            88 CfgRB-ErrQual-UsesSQL-88      value 3.
mvs053            88 CfgRB-ErrQual-DATALIB-88      value 4.
mvs053            88 CfgRB-ErrQual-LOADLIB-88      value 5.
mvs053            88 CfgRB-ErrQual-TXBMSCPY-88     value 6.
mvs054            88 CfgRB-ErrQual-EXPOPUP-88      value 7.
sc-908*mvs053     88 CfgRB-ErrQual-VDBASE-88       value 99.
mvs078            88 CfgRB-ErrQual-LOADLIB-BMS-88  value 8.
703539            88 CfgRB-ErrQual-REMKEY-88       value 9.
703539            88 CfgRB-ErrQual-REMHANDLE-88    value 10.
703539            88 CfgRB-ErrQual-REMDIR-88       value 11.
703539            88 CfgRB-ErrQual-DBNAME-88       value 12.
703539            88 CfgRB-ErrQual-LE-88           value 13.
703539            88 CfgRB-ErrQual-CONSOLE-PID-88  value 14.
703539            88 CfgRB-ErrQual-CONSOLE-KEY-88  value 15.
022358            88 CfgRB-ErrQual-FHREDIR-88      value 16.
nx-044            88 CfgRB-ErrQual-LOGDIR-88       value 17.
mvs053$end
N29415*        03 CfgRB-call-from           pic x(6).
N29415*           88 CfgRB-call-from-mfcics-88 value 'mfcics'.
nf-040      02 CfgRB-file-flag             pic x comp-x.
nx-044         88 CfgRB-file-none-88       value 0.
nf-040         88 CfgRB-file-GCA-88        value 1.
nf-040         88 CfgRB-file-RCA-88        value 2.
nf-040         88 CfgRB-file-DCA-88        value 3.
nf-040         88 CfgRB-file-GCF-88        value 4.
nf-040         88 CfgRB-file-RCF-88        value 5.
nf-040         88 CfgRB-file-DCF-88        value 6.
nx-044         88 CfgRB-file-MLDAP-88      value 7.
mvs036*cjbres      02 CfgRB-Adv-Org-flg           pic x.
mvs036*cjbres         88 CfgRB-Adv-Org-setup-88   value 'Y'.
mvs036      02 CfgRB-caller-flag           pic x comp-x.
mvs036         88 CfgRB-Adv-Org-setup-88   value 1.
mvs036         88 CfgRB-dfheini1-setup-88  value 2.
mvs036         88 CfgRB-dfhginit-setup-88  value 3.
mvs036         88 CfgRB-dfhrem-setup-88    value 4.

P17541$if 78-static defined
mvs053$if 32BIT-OS defined
mvs053   78 78-CfgInitGCA       value 'CfgCreateG'.
mvs053   78 78-CfgGInitGCA      value 'CfgGCreateG'.
mvs053   78 78-CfgStoreGCA      value 'CfgPutG'.
mvs053   78 78-CfgGetGCA        value 'CfgGetG'.
mvs053   78 78-CfgInitRCA       value 'CfgCreateR'.
mvs053   78 78-CfgStoreRCA      value 'CfgPutR'.
mvs053   78 78-CfgGetRCA        value 'CfgGetR'.
mvs053   78 78-CfgInitDCA       value 'CfgCreateD'.
mvs053   78 78-CfgDCAOnly       value 'CfgDOnly'.
mvs053   78 78-CfgStoreDCA      value 'CfgPutD'.
mvs053   78 78-CfgGetDCA        value 'CfgGetD'.
mvs053$else
P17541   78 78-CfgInitGCA       value '__CfgCreateG'.
P17541   78 78-CfgGInitGCA      value '__CfgGCreateG'.
P17541   78 78-CfgStoreGCA      value '__CfgPutG'.
P17541   78 78-CfgGetGCA        value '__CfgGetG'.
P17541   78 78-CfgInitRCA       value '__CfgCreateR'.
P17541   78 78-CfgStoreRCA      value '__CfgPutR'.
P17541   78 78-CfgGetRCA        value '__CfgGetR'.
P17541   78 78-CfgInitDCA       value '__CfgCreateD'.
P17541   78 78-CfgDCAOnly       value '__CfgDOnly'.
P17541   78 78-CfgStoreDCA      value '__CfgPutD'.
P17541   78 78-CfgGetDCA        value '__CfgGetD'.
mvs053$end (32BIT-OS)
P17541$else
         78 78-CfgInitGCA       value 'CfgCreateG'.
         78 78-CfgGInitGCA      value 'CfgGCreateG'.
         78 78-CfgStoreGCA      value 'CfgPutG'.
         78 78-CfgGetGCA        value 'CfgGetG'.
         78 78-CfgInitRCA       value 'CfgCreateR'.
         78 78-CfgStoreRCA      value 'CfgPutR'.
         78 78-CfgGetRCA        value 'CfgGetR'.
         78 78-CfgInitDCA       value 'CfgCreateD'.
         78 78-CfgDCAOnly       value 'CfgDOnly'.
         78 78-CfgStoreDCA      value 'CfgPutD'.
         78 78-CfgGetDCA        value 'CfgGetD'.
P17541$end
P17541   78 78-CfgInitGCA-e     value 'CfgCreateG'.
P17541   78 78-CfgGInitGCA-e    value 'CfgGCreateG'.
P17541   78 78-CfgStoreGCA-e    value 'CfgPutG'.
P17541   78 78-CfgGetGCA-e      value 'CfgGetG'.
P17541   78 78-CfgInitRCA-e     value 'CfgCreateR'.
P17541   78 78-CfgStoreRCA-e    value 'CfgPutR'.
P17541   78 78-CfgGetRCA-e      value 'CfgGetR'.
P17541   78 78-CfgInitDCA-e     value 'CfgCreateD'.
P17541   78 78-CfgDCAOnly-e     value 'CfgDOnly'.
P17541   78 78-CfgStoreDCA-e    value 'CfgPutD'.
P17541   78 78-CfgGetDCA-e      value 'CfgGetD'.
mvs034$if GENESIS defined
mvs034   78 78-CfgStorePrj      value 'CfgPutPrj'.
mvs034$end

      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcbcfr.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.26  2005/10/09 21:57:20  sc
      ***  sc-i66 First stage check-in of TM Message Queues implementation;
      ***         Enhance error recovery and failure mode when TM control
      ***         has failed or is not yet initialized; Change MFS to access
      ***         control blocks from the path setting of IMSMFSP; Create/
      ***         access message queues from the setting of IMSMESGQ where
      ***         IMSMESGQ=<queue-file-name>;<queue-file-blocks>;<queue-
      ***         file-buffers>;The default queue location is TXRFDIR;
      ***         Default blocks is 1024 and default buffers is 4; Maximum
      ***         block count is 63488; Maximum buffer count is 64; The
      ***         queue file is physically MF format var-length sequential
      ***         with a maximum record length of 63488; The maximum queue
      ***         file size is 3,999,777,940; This limit is imposed by the
      ***         limits of the 32 bit COBOL RTS file handling primitives
      ***         and of MF var-length sequential file formats;
      ***    Mod: casdbc.cbl   casgate.cbl  casmpr.cbl   casrdo5.cbl
      ***         castmc.cbl   casxmast.htm caszyims.cbl dfhc8rts.cpy
      ***         dfhcbcsa.cpy dfhcbmgr.cpy dfhcpgrq.cpy dfhcptrf.cpy
      ***         messages     testseq.cbl
      ***
      ***  Revision 1.25  2004/11/15 04:08:57  sc
      ***  sc-I08 Preliminary IMS structure work; Correct/Enhance JES
      ***         & IMS process start/stop messaging; Correct/Enhance
      ***         JES & IMS recovery processing (incomplete);
      ***    Mod: cascpsrv.cpy casctl.cbl   casctl.cfg   casdbc.cbl
      ***         casdbc.cfg   casmpr.cbl   casrdo52.cbl casrdo6.cbl
      ***         dfh0crtp.cbl dfh0msgl.cbl dfhcbcrp.cpy dfhcbcsa.cpy
      ***         dfhcbdca.cpy dfhcbice.cpy dfhcbmgr.cpy dfhcbmq.cpy
      ***         dfhcbtca.cpy dfhcpgrm.cpy dfhcpgrq.cpy dfhcwdie.cpy
      ***         dfheini1.cbl dfhgdied.cbl dfhgdump.cbl dfhgglbl.cbl
      ***         dfhmd.cbl    messages     traceid.doc  txmake.ctl
      ***
      ***  Revision 1.24  2004/10/14 07:44:15  sc
      ***  jes-38 Add edits for Classes; Assorted JES fixes;
      ***         Add initial IMS Message Processing Support;
      ***    Mod: cascpbie.cpy cascwbie.cpy casmpr.cbl   casrdo44.cbl
      ***         casrdo52.cbl casrdo6.cbl  casrdo66.cbl casrdo91.cbl
      ***         casutl.cbl   casxmast.htm dfhc8srv.cpy dfhcbcsa.cpy
      ***         dfhcbdca.cpy dfhcbmrg.cpy dfhcbrdr.cpy dfhcbtca.cpy
      ***         dfhcpcmd.cpy dfhcpgrm.cpy dfhcpgrq.cpy dfhecics.cbl
      ***         dfheini1.cbl dfhgglbl.cbl messages     txmake.ctl
      ***
      ***  Revision 1.23  2004/05/03 14:05:48  sc
      ***  jes-01 Add batch Job Entry Subsystem (JES) function.
      ***    Mod: See TXMAKE.CTL header for complete list
      ***
      ***  Revision 1.22  2002/11/30 20:59:56  PMW
      ***  pw-212    Primarily changes to default CAS startup. Defaults
      ***            the main internal paths TXRDTP, TXTRANP, TXFILEP
      ***            and TXMAPP so that region comes up with no config.
      ***            One or two changes concerned with startup/shutdown
      ***            issues hit during tests.
      ***  Modules:  casstart.cbl, dfh0cfg.cbl,  dfh0crtp.cbl, dfhdev.cbl,
      ***            dfhgreqc.cbl, dfhmc2fc.cbl, dfhmc2ru.cbl, dfhmd.cbl,
      ***            dfhpbms.cbl,  dfhpcbcu.cbl, dfhpcrem.cbl, dfhpcupg.cbl,
      ***            dfhrdtup.cbl, dfhtxp.cbl,   dfhtxpq.cbl,  dfhxichk.cbl,
      ***            dfhc8rts.cpy, dfhcbmgr.cpy, dfhcpcmd.cpy, dfhcpism.cpy,
      ***            dfhcpkcp.cpy, dfhcplck.cpy, dfhcpmrg.cpy, dfhcpsec.cpy,
      ***            killterm.cbl, MODSIT.CBL
      ***
      ***
      ***     Rev 1.21   Nov 30 2002 20:59:56   PMW
      ***  pw-212    Primarily changes to default CAS startup. Defaults
      ***            the main internal paths TXRDTP, TXTRANP, TXFILEP
      ***            and TXMAPP so that region comes up with no config.
      ***            One or two changes concerned with startup/shutdown
      ***            issues hit during tests.
      ***  Modules:  casstart.cbl, dfh0cfg.cbl,  dfh0crtp.cbl, dfhdev.cbl,
      ***            dfhgreqc.cbl, dfhmc2fc.cbl, dfhmc2ru.cbl, dfhmd.cbl,
      ***            dfhpbms.cbl,  dfhpcbcu.cbl, dfhpcrem.cbl, dfhpcupg.cbl,
      ***            dfhrdtup.cbl, dfhtxp.cbl,   dfhtxpq.cbl,  dfhxichk.cbl,
      ***            dfhc8rts.cpy, dfhcbmgr.cpy, dfhcpcmd.cpy, dfhcpism.cpy,
      ***            dfhcpkcp.cpy, dfhcplck.cpy, dfhcpmrg.cpy, dfhcpsec.cpy,
      ***            killterm.cbl, MODSIT.CBL
      ***
      ***     Rev 1.20   Nov 13 2002 14:11:30   PMW
      ***  pw-196    Interim and incomplete shape & GENESIS
      ***            work.
      ***  Modules:  dfh0cfg.cbl,  dfh0crtp.cbl, dfhcbmgr.cpy
      ***
      ***     Rev 1.19   17 Oct 2002 14:42:16   NJF
      ***  nx-066 - Provide ability to dynamically generate IDTs for system
      ***           administration requests.
      ***           Updates to RTS interface based on latest spec.
      ***           Change TXRFDIR to be <work-dir>\<regname>.
      ***           Add support for environment variable specification within
      ***           Medusa, $TXRFDIR\<regname>.env contains env vars.
      ***           Update for latest Medusa/mfdsa interface.
      ***  Modules: dfhginit.cbl dfheini1.cbl dfheserv.cbl dfh0cfgp.cbl
      ***           casasrvc.cbl dfh0cfg.cbl  dfhmd.cbl
      ***           dfhcprdt.cpy dfhcwver.cpy cascwrdt.cpy dfhc8srv.cpy
      ***           cascbctl.cpy dfhcpism.cpy dfhcbcfa.cpy  dfhcbmgr.cpy
      ***           dfhcplck.cpy cascbcfg.cpy
      ***           txmake.ctl   messages
      ***  New modules: casadmin.cbl cascbadm.cpy
      ***
      ***     Rev 1.18   28 May 2002 14:21:50   NJF
      ***  nx-009 - changes to remove hardcoded offsets dealing with message
      ***           prefix
      ***  Modules: dfhgdup.cbl  dfhpcupg.cbl dfhxecmm.cbl dfhxemsg.cbl
      ***           dfhxinit.cbl dfhxplim.cbl dfhtinit.cbl dfhpcini.cbl
      ***           dfhcbmgr.cpy dfhcpmsg.cpy dfhcpcfe.cpy dfhcpcfi.cpy
      ***           dfhcwcm2.cpy dfhcpcm2.cpy dfhcpcmd.cpy
      ***
      ***     Rev 1.17   Oct 18 1999 13:07:16   NJF
      ***  nf-186 - Added support for MQSeries triggering.
      ***           Work includes major restructuring of MQSeries
      ***           support to handle both V2 and V5 API structures.
      ***           Renamed support copybooks and modified previous
      ***           KAB code without use of change flags.
      ***           Note. Code currently untested but checked in as
      ***           incremental backup providing delivery for eMerge.
      ***  Modules: dfheibmq.cbl dfh0msgl.cbl messages
      ***           dfhcwbmq.cpy dfhcbmgr.cpy dfhcwcm2.cpy dfhcpcm2.cpy
      ***  New Modules: dfhcbmqi.cpy dfhcpmqi.cpy
      ***
      ***     Rev 1.16   07 Sep 1999 13:11:32   PEH
      ***  peh458 - Revert back to using Build tab instead of
      ***           CICS log for import/export functions.
      ***  modules: dfhcnvim.cbl dfhrdtup.cbl dfhrdtex.cbl dfhcbmgr.cpy
      ***
      ***     Rev 1.15   18 May 1999 10:27:50   PEH
      ***  515765 - Switched output from Build tab to CICS log,
      ***           and clear it before displaying any message.
      ***  modules: dfhrdtup.cbl dfhrdtex.cbl dfhcnvim.cbl
      ***           dfhcpmsg.cpy dfhcbmgr.cpy
      ***
      ***     Rev 1.14   13 Mar 1998 16:27:06   PMW
      ***  pw-064    Change to allow the execution of multiple regions under
      ***            multiple IDEs. Each region has its own daemon. This is
      ***            controlled through the registry.
      ***
      ***  Modules:  dfh0crtp.cbl, dfh0msg.cbl,  dfhc8api.cpy, dfhcbcrp.cpy,
      ***            dfhcbmgr.cpy, dfhcbmq.cpy,  dfhcpcds.cpy, dfhcpcmd.cpy,
      ***            dfhcpitb.cpy, dfhcpmrg.cpy, dfhcpmsg.cpy, dfhmd.cbl,
      ***            dfhrdtup.cbl, dfhrem.cbl,   dfhtxp.cbl,   dfhtxpq.cbl,
      ***            messages.
      ***
      ***
      ***     Rev 1.13   09 Dec 1997 14:48:22   NJF
      ***  mvs060 - defined a constant for the message file record length
      ***           and a "cross check" compilation error.
      ***  Modules: dfhcwmsg.cpy dfhcbmgr.cpy
      ***
      ***     Rev 1.12   03 Oct 1997 22:41:46   NJF
      ***  mvs038 - tidy up of messages from dfheini1 and moved
      ***           close IDELINK function.
      ***  Modules: dfh0cfg.cbl  dfheini1.cbl
      ***           dfhc8itb.cpy dfhcbmgr.cpy dfhcpitb.cpy dfhcpmsg.cpy
      ***           dfhcwitb.cpy
      ***
      ***     Rev 1.11   29 Sep 1997 14:25:06   NJF
      ***  mvs036 - various changes to enable VDBASE project
      ***           configuration support. Still incomplete due
      ***           to IDELINK API problems/limitations.
      ***  Modules: dfheini1.cbl dfhginit.cbl dfheserv.cbl dfh0msg.cbl
      ***           dfh0cfg.cbl  dfhgdup.cbl  dfhmd.cbl    dfhrapi.cbl
      ***           dfhcbmgr.cpy dfhcpitb.cpy dfhcwitb.cpy dfhcbcfr.cpy
      ***           dfhcbcsa.cpy dfhcpism.cpy
      ***           messages
      ***  New Modules: dfhc8itb.cpy dfhcbitb.cpy
      ***
      ***     Rev 1.10   15 Aug 1997 15:26:14   NJF
      ***  mvs021 - added support for output tab in single tasking
      ***           system when running under IDE. Call interface
      ***           to dfh0msg can be used rather than direct access
      ***           via dfhc?itb.cpy copybooks.
      ***  Modules: dfhecics.cbl dfh0crtp.cbl dfh0msg.cbl  dfhcpmsg.cpy
      ***           dfh0cfgp.cbl dfhcbmgr.cpy dfhcwitb.cpy dfhcpitb.cpy
      ***
      ***     Rev 1.9   03 Jul 1997 13:15:04   NJF
      ***  mvs012 - added capability to build 'gui' triggers for
      ***           MVS Express into makegen.
      ***           added MessageBox message destination for output
      ***  Modules: dfh0crtp.cbl dfh0msg.cbl  dfhgglbl.cbl dfhgrtrm.cbl
      ***           dfhrem.cbl   dfhmd.cbl    dfhtxs.cbl
      ***           dfhcbcrp.cpy dfhcpmsg.cpy dfhcbmq.cpy  dfhcpmg.cpy
      ***           dfhcbmgr.cpy dfhc8api.cpy
      ***           makegen.cbl  txmake.ctl   txcase.cmd   mwo-othr.mk
      ***  New Modules:          dfhrem.cfg   dfhgrtrm.cfg
      ***
      ***     Rev 1.8   10 Jul 1996 10:40:34   HPS
      ***  hs-068 - Replace old CFLE message system with one based on the
      ***           standard MTS messaging system.
      ***
      ***  Modules: messages  dfhzhelp  dfhzhelp.idx  dfhzdfdm.cbl
      ***           dfhzfcpy.cbl  dfh0msgl.cbl  dfhzeeda.cbl  dfhzkeda.cbl
      ***           dfhzreda.cbl  dfhzseda.cbl  dfhzfsel.cbl  dfhcbmgr.cpy
      ***           schfac01.cpy  ws002hlp.cpy  fnderr.cpy
      ***
      ***     Rev 1.7   26 Jun 1996 15:43:06   NJF
      ***  nf-118 - CHJB's XO messages not producing hyhelp files
      ***  Modules: dfh0msgl.cbl dfhcbmgr.cpy
      ***
      ***     Rev 1.6   03 Jun 1996 16:15:02   CHJB
      ***  cjbxa4 - Further XA implementation work
      ***           modules : dfhexa.cbl   dfhos2dm.cbl dfhginit.cbl
      ***                     dfheini1.cbl dfhetrm1.cbl dfheserv.cbl
      ***                     dfhcbmgr.cpy dfhcwmg.cpy  dfhcbdbm.cpy
      ***                     dfhcbuex.cpy dfhcbxat.cpy dfhcwuex.cpy
      ***                     dfhcwxid.cpy dfhzplt.cbl  messages
      ***           new     : dfhxareg.cbl dfhcwxaa.cpy
      ***
      ***     Rev 1.5   28 Mar 1996 17:43:54   NJF
      ***  nf-101 - Initial cut of 'livecobol' support for MTS as a
      ***           HTTP server. Using EARLY-RELEASE CALLADIS(TXADIS)
      ***           native accept/display calls are re-routed via a
      ***           special entry point in dfhebms.
      ***         - various code changes to avoid 196-S checker message
      ***           when using a REDEFINES statement where either the
      ***           base or redefinition contains an OCCURS DEPENDING ON
      ***           statement. These changes require further testing!
      ***  Modules: dfh0crtp.cbl dfhebms.cbl  dfhgdup.cbl  dfhgglbl.cbl
      ***           dfhmd.cbl    dfh0msgl.cbl dfhpcgen.cbl dfhpmgen.cbl
      ***           dfhppgen.cbl dfhcrtrg.cbl dfheserv.cbl
      ***           dfhcbcrp.cpy dfhcbcsa.cpy dfhcbrdr.cpy dfhcbmq.cpy
      ***           dfhcpism.cpy dfhcpsit.cpy dfhcbbms.cpy dfhcbmgr.cpy
      ***           dfhcbtst.cpy dfhcbtme.cpy dfhcptmp.cpy
      ***           txcase.cmd   txcase.sh    messages
      ***  New modules:          httpcfg.cbl  dfhcbcgi.cpy
      ***
      ***     Rev 1.4   21 Jan 1996 20:22:50   CHJB
      ***  cjbapi - Convert dfhpcpct to use the Resiurce definition
      ***           API.
      ***           Modules dfhpcpct.cbl dfhrval.cbl  dfhrmsg.cbl
      ***                   dfhpcrdl.cbl dfhcbrdl.cpy dfhcwpc2.cpy
      ***                   dfhcpmsg.cpy dfhcbmgr.cpy dfhcprd2.cpy
      ***                   dfhcwrd2.cpy dfhcprd3.cpy messages
      ***
      ***     Rev 1.3   15 Jan 1996 11:07:44   CHJB
      ***  cjbapi - change ws to (data) in generic modules and other
      ***           additions for RDO api
      ***
      ***     Rev 1.2   30 Jun 1995 15:47:52   GKB
      ***  gkb008 - Added messaging to dfhff.
      ***
      ***  modules : dfhff.cbl messages dfhcbmgr.cpy
      ***
      ***
      ***     Rev 1.0   10 Feb 1995 11:32:20   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
      *****************************************************************
      *                                                               *
      * Notes:                                                        *
      * 1. The MCU Messaging Routines support messages of the         *
      *    form 'DFHaannnnt text...'                                  *
      *    where,                                                     *
      *      aa   is a 2 character code representing the area         *
      *           of the product to which the message belongs         *
      *      nnnn is a 4 digit number identifying the message         *
      *      t    is a single character indicating the severity       *
      *           severity of the message                             *
      *           I - Informational                                   *
      *           W - Warning                                         *
      *           E - Error                                           *
      *           S - Severe                                          *
      *           F - Fatal                                           *
      *                                                               *
      * 2. Note that only the Open, Close and Get functions are       *
      *    available to the MCU runtime and utilities. The            *
      *    remaining functions are conditionally compiled out         *
      *    and only included for use by the Message file build        *
      *    and service programs.                                      *
      *                                                               *
      * 3. Before the message file can be used it must first be       *
      *    opened in one of three ways.                               *
      *    - MgOpenFile will open the message file Readonly and       *
      *      should be used by all MCU processes and utilities        *
      *      before making any Get or GetNext requests.               *
      *    - MgCreateFile will open the message file for output       *
      *      and always deletes any existing file first.              *
      *      This call should be used by the message creation         *
      *      utility only.                                            *
      *                                                               *
      * 4. For completeness the message file should be closed         *
      *    using MgCloseFile before any process using it is           *
      *    terminated.                                                *
      *                                                               *
      * 5. Retrieval of messages from the message file is done        *
      *    using MgGetMessage. When using this call, the fields       *
      *    in this request block should be set as follows             *
      *    - MsgRB-NumInserts is set to the number of inserts         *
      *      being passed to the message utility                      *
      *    - MsgRB-Inserts holds pointers to the number of            *
      *      null-terminated inserts defined by MsgRB-NumInserts      *
      *                                                               *
      * 6. On successful return from the message routine the          *
      *    following fields will have been updated.                   *
      *    - MsgRB-Buffer-Text will contain the text of the message   *
      *      including the prefix                                     *
      *                                                               *
      * 7. The RETURN-CODE special register will contain one of       *
      *    the following values                                       *
      *                                                               *
      *    0  - Success                                               *
      *    4  - Warning                                               *
      *    8  - Error                                                 *
      *    12 - Severe                                                *
      *    16 - Fatal                                                 *
      *                                                               *
      *    Return codes other than SUCCESS will be qualified by a     *
      *    value in MsgRB-ReturnCode                                  *
      *                                                               *
      *****************************************************************
      *
sc-082*if BUILD defined
sc-082$if 78-BUILD defined
         78 78-MgCreateFile     value 'MgOpenFileWO'.
         78 78-MgInsertMessage  value 'MgAddMsg'.
         78 78-Build-MsgProg    value 'dfh0msgb'.
      $end
sc-082*if UPDATE defined
sc-082$if 78-UPDATE defined
         78 78-MgUpdateFile     value 'MgOpenFileRW'.
         78 78-MgReplaceMessage value 'MgReplaceMsg'.
         78 78-MgDeleteMessage  value 'MgDeleteMsg'.
         78 78-Update-MsgProg   value 'dfh0msgu'.
      $end
sc-082*if BUILD not defined
sc-082$if 78-BUILD not defined
sc-082*if UPDATE not defined
sc-082$if 78-UPDATE not defined
         78 78-MgOpenFile       value 'MgOpenFileRO'.
         78 78-MgGetMessage     value 'MgGetMsg'.
p20141   78 78-MgSetForeground  value 'MgSetFgnd'.
n24608$IF DOS DEFINED
n24608   *> -- as the DOS preprocessor is built to a LBR it needs to be
n24608   *> -- able to locate the messaging program as it is not in the
n24608   *> -- LBR and $TXDIR\lib is not on the COBDIR
n24608   78 78-RunTime-MsgProg  value '$TXDIR\lib\dfh0msg'.
n24608$ELSE
         78 78-RunTime-MsgProg  value 'dfh0msg'.
n24608$END
      $end
      $end
pw-196*mvs021$if GENESIS defined
pw-196$if WIN-NT defined
mvs021***--------------------------------------------------------------*
mvs021   78 78-MgMessageBox                value 'MgMsgBox'.
mvs021   78 78-MgCreateOutputTab           value 'MgCrtTab'.
515765   78 78-MgClearOutputTab            value 'MgClrTab'.
mvs021   78 78-MgWriteOutputTab            value 'MgWriTab'.
mvs036*mvs021   78 78-MgCloseOutputTab            value 'MgClsTab'.
mvs038*mvs036   78 78-MgCloseIDELink              value 'MgClsIDE'.
mvs036   78 78-MgQueryGUI                  value 'MgQryGUI'.
mvs021   78 78-cics-log-tab-name           value 'CICSLog'.
peh458   78 78-build-tab-name              value 'MVSPROJ'.
pw-196$end
pw-196*mvs021$end
         78 78-MgBuildErrMsg    value 'MgBuildErrMsg'.
         78 78-MgCloseFile      value 'MgCloseFile'.

mvs060  78 78-MsgRB-Buffer-Length          value 256.

nx-009$if MTS-ASEE defined
nx-009  78 78-MsgRB-Msg-Prefix-Length      value 3.
nx-009  78 78-MsgRB-Msg-Prefix             value 'CAS'.
nx-009$else
nx-009  78 78-MsgRB-Msg-Prefix-Length      value 2.
nx-009  78 78-MsgRB-Msg-Prefix             value 'TX'.
nx-009$end
pw-212 78  78-MsgRB-Msg-Area-Offset        value
pw-212     78-MsgRB-Msg-Prefix-Length      + 1.
nx-009  78 78-MsgRB-Msg-Area-Length        value 2.
nx-009  78 78-MsgRB-Msg-Number-Length      value 4.
nx-009  78 78-MsgRB-Msg-Severity-Length    value 1.
nx-009  78 78-MsgRB-Msg-Severity-Offset    value
nx-009     78-MsgRB-Msg-Prefix-Length      +
nx-009     78-MsgRB-Msg-Area-Length        +
nx-009     78-MsgRB-Msg-Number-Length      +
nx-009     78-MsgRB-Msg-Severity-Length    .
nx-009  78 78-MsgRB-Msg-Number-Offset      value
nx-009     78-MsgRB-Msg-Prefix-Length      +
nx-009     78-MsgRB-Msg-Area-Length        + 1.
nx-009  78 78-MsgRB-Msg-Text-Start         value
nx-009     78-MsgRB-Msg-Severity-Offset    + 2.
nx-009
mvs060$if 78-MsgFile-Record-Length defined
mvs060$if 78-MsgFile-Record-Length not = 78-MsgRB-Buffer-Length
mvs060     *> --
mvs060     *> -- This is intended to cause a compilation error in
mvs060     *> -- dfh0msg.cbl which also includes dfhcfmsg.cpy
mvs060     *> --
mvs060     compilation errors are us
mvs060$end
mvs060$end
        01 MsgRB.
      *
           03 MsgRB-Id.
              05 MsgRB-Area   pic X(2).
nf-118  *> ------------------------------------------------------ <*
nf-118  *> --                                                  -- <*
nf-118  *> -- WARNING: any new messages prefixes must be       -- <*
nf-118  *> --          matched with changes in dfh0msgl for    -- <*
nf-118  *> --          automatic hyhelp message production     -- <*
nf-118  *> --                                                  -- <*
nf-118  *> ------------------------------------------------------ <*
sc-081           88 MsgRB-Area-AM-88 value 'AM'. *> Region Manigment
jes-01           88 MsgRB-Area-BJ-88 value 'BJ'. *> Batch JCL execution
sc-081           88 MsgRB-Area-BR-88 value 'BR'. *> Batch RDO (import/export)
sc-081           88 MsgRB-Area-CD-88 value 'CD'. *> Console Daemon
sc-x61           88 MsgRB-Area-CF-88 value 'CF'. *> Configuration Support
sc-081           88 MsgRB-Area-CL-88 value 'CL'. *> MCU Client
sc-081           88 MsgRB-Area-CS-88 value 'CS'. *> Communications
hs-068           88 MsgRB-Area-CT-88 value 'CT'. *> Supplied Transactions
sc-i66           88 MsgRB-Area-DB-88 value 'DB'. *> IMS Database Control
sc-081           88 MsgRB-Area-DU-88 value 'DU'. *> Dump Control
jes-01           88 MsgRB-Area-EX-88 value 'EX'. *> External (other component)
sc-081           88 MsgRB-Area-FC-88 value 'FC'. *> File Control
sc-081           88 MsgRB-Area-FD-88 value 'FD'. *> Dump Formatter
gkb008           88 MsgRB-Area-FF-88 value 'FF'. *> DFHFF file find
sc-081           88 MsgRB-Area-FT-88 value 'FT'. *> Trace Formatter
sc-081           88 MsgRB-Area-GP-88 value 'GP'. *> Global Process
sc-i66*sc-I08    88 MsgRB-Area-IC-88 value 'IC'. *> IMS Control
sc-i66*sc-I08    88 MsgRB-Area-ID-88 value 'ID'. *> IMS Database Control
sc-I08           88 MsgRB-Area-IP-88 value 'IP'. *> IMS Message Processing
sc-081           88 MsgRB-Area-JC-88 value 'JC'. *> Journal Control
sc-081           88 MsgRB-Area-KC-88 value 'KC'. *> Task Control
sc-081           88 MsgRB-Area-KE-88 value 'KE'. *> MCU Kernel
sc-081           88 MsgRB-Area-ME-88 value 'ME'. *> Messaging
sc-081           88 MsgRB-Area-MS-88 value 'MS'. *> Basic Mapping Support
nf-186           88 MsgRB-Area-MQ-88 value 'MQ'. *> MQSeries
mjw052           88 MsgRB-Area-OP-88 value 'OP'. *> User Messages to Console
sc-081           88 MsgRB-Area-PC-88 value 'PC'. *> Program Control
cjbapi           88 MsgRB-Area-RA-88 value 'RA'. *> Resource Definition API
cjbapi           88 MsgRB-Area-RB-88 value 'RB'. *> Resource Definition DFHRDEF
sc-081           88 MsgRB-Area-RD-88 value 'RD'. *> RDO incl CEDA INSTALL
nf-101           88 MsgRB-Area-RM-88 value 'RM'. *> Resource Manager Control
sc-081           88 MsgRB-Area-SC-88 value 'SC'. *> Storage Control
sc-081           88 MsgRB-Area-SE-88 value 'SE'. *> Security (incl singon/off)
sc-081           88 MsgRB-Area-SI-88 value 'SI'. *> System Initialization
sc-081           88 MsgRB-Area-SP-88 value 'SP'. *> Syncpoint & Recovery
sc-081           88 MsgRB-Area-ST-88 value 'ST'. *> Region Termination
sc-081           88 MsgRB-Area-TD-88 value 'TD'. *> Transient Data
sc-i66*sc-081    88 MsgRB-Area-TM-88 value 'TM'. *> System Terminat(dfhpause)
sc-i66           88 MsgRB-Area-TM-88 value 'TM'. *> IMS TM Control
sc-081           88 MsgRB-Area-TR-88 value 'TR'. *> Trace Control
sc-081           88 MsgRB-Area-TS-88 value 'TS'. *> Temporary Storage
sc-081           88 MsgRB-Area-XA-88 value 'XA'. *> API Preprocessor
sc-081           88 MsgRB-Area-XB-88 value 'XB'. *> BMS Macro Processor
cjbxa4           88 MsgRB-Area-XO-88 value 'XO'. *> Transaction Manager
              05 MsgRB-Number pic 9999.
      *
           03 MsgRB-Dest.
              88 MsgRB-Clear-Dests-88   value spaces.
              05 filler pic x.
                 88 MsgRB-Return-To-Caller-88 value '1'.
              05 filler pic x.
                 88 MsgRB-Send-To-Console-88  value '1'.
              05 filler pic x.
mvs012*          88 MsgRB-Send-To-StdOut-88   value '1'.
mvs012           88 MsgRB-Send-To-StdOut-88   value '1'
mvs012                                        false space.
              05 filler pic x.
mvs012*          88 MsgRB-Send-To-StdErr-88   value '1'.
mvs012           88 MsgRB-Send-To-StdErr-88   value '1'
mvs012                                        false space.
cjbapi        05 filler pic x.
cjbapi           88 MsgRB-No-time-88          value '1' false space.
              05 filler pic x.
sc-081           *> -- This is supported by 78-CICS-mesg-service-entry ONLY!
sc-081           88 MsgRB-Send-To-TDQ-88      value '1' false space.
              05 filler pic x.
sc-081           *> -- This is supported by 78-CICS-mesg-service-entry ONLY!
sc-081           88 MsgRB-Send-To-Terminal-88 value '1' false space.
mvs012        05 filler pic x.
mvs012           *> -- This is supported by GENESIS ONLY!
mvs012           88 MsgRB-Send-To-Output-Tab-88    value '1'
mvs012                                             false space.
mvs012        05 filler pic x.
mvs012           *> -- This is supported by GENESIS ONLY!
mvs012           88 MsgRB-Send-To-Message-Box-88   value '1'
mvs012                                             false space.
mvs012        05 filler pic x.
mvs012           *> -- This is supported by GENESIS ONLY!
mvs012           88 MsgRB-Filter-Message-88        value '1'
mvs012                                             false space.
              05 MsgRB-TDQ-Name pic x(4).

sc-081           88 MsgRB-DestTDQ-CADL value 'CADL'.
sc-081*> CADL-CEDA VTAM resource log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CAIL value 'CAIL'.
sc-081*> CAIL-Autoinstall terminal model resource log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CCPI value 'CCPI'.
sc-081*> CCPI-CPI Communications message log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CCSE value 'CCSE'.
sc-081*> CCSE-C/370 error data stream (stderr) log, indirect to CCSO.

sc-081           88 MsgRB-DestTDQ-CCSI value 'CCSI'.
sc-081*> CCSI-C/370 input data stream (stdin) log.  See note.

sc-081           88 MsgRB-DestTDQ-CCSO value 'CCSO'.
sc-081*> CCSO-C/370 output data stream (stdout) log.

sc-081           88 MsgRB-DestTDQ-CDBC value 'CDBC'.
sc-081*> CDBC-Database log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CDUL value 'CDUL'.
sc-081*> CDUL-Dump message log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CESE value 'CESE'.
sc-081*> CESE-Language Environment/370 runtime output.

sc-081           88 MsgRB-DestTDQ-CMIG value 'CMIG'.
sc-081*> CMIG-Migration log to detect use of EXEC CICS ADDRESS CSA commands.

sc-081           88 MsgRB-DestTDQ-CPLD value 'CPLD'.
sc-081*> CPLD-PL/I dumps, indirect to CPLI.

sc-081           88 MsgRB-DestTDQ-CPLI value 'CPLI'.
sc-081*> CPLI-PL/I SYSPRINT output, direct to DD name PLIMSG.

sc-081           88 MsgRB-DestTDQ-CRDI value 'CRDI'.
sc-081*> CRDI-RDO install log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSCS value 'CSCS'.
sc-081*> CSCS-Signon/sign-off security log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSDL value 'CSDL'.
sc-081*> CSDL-CEDA command log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSFL value 'CSFL'.
sc-081*> CSFL-File allocation message log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSKL value 'CSKL'.
sc-081*> CSKL-Transaction and profile resource log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSML value 'CSML'.
sc-081*> CSML-Signon/sign-off message log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSMT value 'CSMT'.
sc-081*> CSMT-Terminal error message and transaction abend message log,
sc-081*>      indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSNE value 'CSNE'.
sc-081*> CSNE-ZNAC-produced messages log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSPL value 'CSPL'.
sc-081*> CSPL-Program resource log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSRL value 'CSRL'.
sc-081*> CSRL-Partner resource log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSSL value 'CSSL'.
sc-081*> CSSL-Message log, direct to DD name MSGUSR (all the other general
sc-081*>      CICS queues are defined as indirect queues to CSSL).

sc-081           88 MsgRB-DestTDQ-CSTL value 'CSTL'.
sc-081*> CSTL-Terminal I/O error log, indirect to CSSL.

sc-081           88 MsgRB-DestTDQ-CSZL value 'CSZL'.
sc-081*> CSZL-The queue used for Front End Programming Interface (FEPI)
sc-081*>      messages.  You do not have to define this queue if you do not
sc-081*>      have FEPI installed.

sc-081           88 MsgRB-DestTDQ-CSZX value 'CSZX'.
sc-081*> CSZX-The queue used for Front End Programming Interface (FEPI)
sc-081*>      processing. You do not have to define this queue if you do not
sc-081*>      have FEPI installed.

sc-081*> Note:  The queue name CCSI has been reserved for the C/370 input data
sc-081*> stream (stdin), but any attempt to read from this stream causes EOF to be
sc-081*> returned.

           03 MsgRB-ReturnCode      pic s9(8) comp-5.
              88 MsgRB-SUCCESS-88            VALUE 0.
              88 MsgRB-File-Not-Found-88     VALUE -1.
              88 MsgRB-Buffer-Overrun-88     VALUE -2.
              88 MsgRB-Bad-File-State-88     VALUE -3.
              88 MsgRB-Message-Not-Found-88  VALUE -4.
              88 MsgRB-Duplicate-Key-88      VALUE -5.
sc-081        88 MsgRB-Invalid-Request-88    VALUE -6.
      *
pw-064     03 MsgRB-MessageBox.
pw-064        05 MsgRB-MessageBoxStyle pic x comp-x value 0.
pw-064           *> -- This is supported by GENESIS ONLY!
pw-064           *> -- Message box styles
pw-064           88  MsgRB-MB-OK-88            value 0.
pw-064           88  MsgRB-MB-OKCancel-88      value 1.
pw-064           88  MsgRB-MB-AbortRetryCancel-88
                                               value 2.
pw-064           88  MsgRB-MB-YesNoCancel-88   value 3.
pw-064           88  MsgRB-MB-YesNo-88         value 4.
pw-064           88  MsgRB-MB-RetryCancel-88   value 5.
pw-064           88  MsgRB-MessageBox-Resp-88m value 1, 2, 3, 4, 5
pw-064                                         false 0.
pw-064        05 MsgRB-MessageBox-Resp pic x(4)    comp-5.
pw-064           88  MsgRB-MBResp-IDOK-88     Value   1.
pw-064           88  MsgRB-MBResp-IDCANCEL-88 Value   2.
pw-064           88  MsgRB-MBResp-IDABORT-88  Value   3.
pw-064           88  MsgRB-MBResp-IDRETRY-88  Value   4.
pw-064           88  MsgRB-MBResp-IDIGNORE-88 Value   5.
pw-064           88  MsgRB-MBResp-IDYES-88    Value   6.
pw-064           88  MsgRB-MBResp-IDNO-88     Value   7.
pw-064           88  MsgRB-MBResp-IDCLOSE-88  Value   8.
pw-064           88  MsgRB-MBResp-IDHELP-88   Value   9.

           03 MsgRB-Inserts.
              05 MsgRB-NumInserts      pic x(2) comp-x value 16.
              05 MsgRB-Insert-ptr      pointer
                 occurs 16 times depending on MsgRB-NumInserts
mjs082           indexed by MsgRB-index.
      *
           03 MsgRB-Buffer.
              05 MsgRB-Buffer-Length   pic x(2) comp-x value 256.
              05 MsgRB-Buffer-Text.
                 07 MsgRB-Buffer-Char pic x
                    occurs 256 times depending on MsgRB-Buffer-Length.
mvs012$if GENESIS defined
mvs012     03 MsgRB-Message-Box-Work.
mvs021        05 MsgRB-Output-Tab-Name.
mvs021           07 MsgRB-Message-Box-Title
mvs021                                 pic x(32).
mvs012$end
nx-066***  call NT-API 78-MessageBox using
nx-066***      by value     0 size 4               *> -- NULL HWND
nx-066***      by content   z"message"
nx-066***      by content   z"title"
nx-066***      by value     0
nx-066***  end-call

      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcbmgr.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.9  2003/09/22 14:22:25  pmw
      ***  pw-268    Change SYSCON processing to write to SYSLOG.
      ***  Modules:  dfhmd.cbl,    dfhcwmg.cpy, dfhcpmg.cpy
      ***
      ***  Revision 1.8  2003/07/22 10:13:37  pmw
      ***  pw-243    "Final" changes for new IPC functions.
      ***            Primarily changed calls outside dfhcpipc.cpy
      ***            to use the new functions.
      ***  Modules:  casgate.cbl,  casgreqt.cbl, casstart.cbl, dfhgerr.cbl,
      ***            dfhgreq.cbl,  dfhgreqm.cbl, dfhmd.cbl,    cascperr.cpy,
      ***            dfhcperr.cpy, dfhcpgrm.cpy, dfhcpgrq.cpy, dfhcpipc.cpy,
      ***            dfhcpkcp.cpy, dfhcpkcw.cpy, dfhcpmd1.cpy, dfhcptrt.cpy,
      ***            dfhcwmg.cpy,  mfsysv.c,     mfsysv.h
      ***
      ***  Revision 1.7  2003/07/17 13:12:17  pmw
      ***  pw-242    Further IPC changes.
      ***  Modules:  dfh0mq.cbl,   dfhcpmq.cpy,  dfhcwmg.cpy,  mfsysv.c
      ***
      ***  Revision 1.6  2002/12/20 11:00:00  PMW
      ***  pw-221    Prevent "dirty" close of debug server.
      ***            Closing down the debug server by interruping
      ***            the animator was leaving the system in a state
      ***            where zombie processes were left and the DCA was
      ***            not being removed so that subsequent work was scheduled
      ***            to it and the CAS hung up.
      ***            When an attempt is made to interrupt the server we now
      ***            spawn a process which invokes the stop-debug-server code
      ***            in dfhgreq.
      ***  Modules:  dfhecics.cbl, dfhcpcm2.cpy, dfhcwcm2.cpy,  txmake.ctl,
      ***            mau-make.mk
      ***            Added routines to allow posting messages to syslogd
      ***  Modules:  dfhcpmg.cpy,  dfhcwmg.cpy
      ***
      ***  
      ***     Rev 1.5   Dec 20 2002 11:00:00   PMW
      ***  pw-221    Prevent "dirty" close of debug server.
      ***            Closing down the debug server by interruping 
      ***            the animator was leaving the system in a state
      ***            where zombie processes were left and the DCA was
      ***            not being removed so that subsequent work was scheduled
      ***            to it and the CAS hung up.
      ***            When an attempt is made to interrupt the server we now
      ***            spawn a process which invokes the stop-debug-server code
      ***            in dfhgreq.
      ***  Modules:  dfhecics.cbl, dfhcpcm2.cpy, dfhcwcm2.cpy,  txmake.ctl,   
      ***            mau-make.mk
      ***            Added routines to allow posting messages to syslogd
      ***  Modules:  dfhcpmg.cpy,  dfhcwmg.cpy
      ***  
      ***     Rev 1.4   10 Jul 2002 10:39:52   NJF
      ***  nx-015 - initial integration of CASDS (Medusa) to obtain
      ***           server definition
      ***           initial prototype of license management with concurrent
      ***           client processing counting
      ***  Modules: dfheini1.cbl dfhgglbl.cbl dfhginit.cbl casstop.cbl
      ***           dfhcbcsa.cpy dfhcpgrq.cpy dfhcpism.cpy dfhcpmg.cpy
      ***           dfhcwmg.cpy
      ***           messages
      ***  New Modules: dfhcwds.cpy dfhcbds.cpy dfhcpds.cpy
      ***
      ***     Rev 1.3   27 May 2002 22:34:18   SC
      ***  sc-908 AIX port and MQ work
      ***
      ***     Rev 1.2   Feb 26 1999 16:07:22   PMW
      ***  pw-087    The message box for formatting of dump/trace
      ***            files was not displaying the correct file name
      ***            due to a buffer being too small. Extended it.
      ***
      ***  Modules:  dfhcwmg.cpy
      ***
      ***     Rev 1.1   03 Jun 1996 16:15:06   CHJB
      ***  cjbxa4 - Further XA implementation work
      ***           modules : dfhexa.cbl   dfhos2dm.cbl dfhginit.cbl
      ***                     dfheini1.cbl dfhetrm1.cbl dfheserv.cbl
      ***                     dfhcbmgr.cpy dfhcwmg.cpy  dfhcbdbm.cpy
      ***                     dfhcbuex.cpy dfhcbxat.cpy dfhcwuex.cpy
      ***                     dfhcwxid.cpy dfhzplt.cbl  messages
      ***           new     : dfhxareg.cbl dfhcwxaa.cpy
      ***
      ***     Rev 1.0   10 Feb 1995 11:41:38   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
      *** Message Insert Buffer for easy definition of inserts
      ***--------------------------------------------------------------*
      $IF 78-MsgIB-NumInserts NOT DEFINED
            78 78-MsgIB-NumInserts value 4.
      $END
            01 MsgIB.
               02 filler occurs 78-MsgIB-NumInserts times
                                            indexed by MsgIB-index.
pw-087*           03 MsgIB-Buffer pic x(32).
pw-087            03 MsgIB-Buffer pic x(256).
P14761            03 filler redefines MsgIB-Buffer.
P14761               04 MsgIB-10Digits pic 9(10).
P14761               04 filler pic x.
P14761                  88 MsgIB-10Digits-Null-88 value low-values.
P14761               04           pic x(21).
sc-908               04           pic x(224).
cjbxa4            03 filler redefines MsgIB-Buffer.
cjbxa4               04 MsgIB-S5Digits pic -99999.
cjbxa4               04 filler pic x.
cjbxa4                  88 MsgIB-S5Digits-Null-88 value low-values.
cjbxa4               04           pic x(25).
sc-908               04           pic x(224).
                  03 filler redefines MsgIB-Buffer.
                     04 MsgIB-5Digits pic 99999.
                     04 filler pic x.
                        88 MsgIB-5Digits-Null-88 value low-values.
                     04           pic x(26).
sc-908               04           pic x(224).
                  03 filler redefines MsgIB-Buffer.
                     04 MsgIB-4Digits pic 9999.
                     04 filler pic x.
                        88 MsgIB-4Digits-Null-88 value low-values.
                     04           pic x(27).
sc-908               04           pic x(224).
                  03 filler redefines MsgIB-Buffer.
                     04 MsgIB-3Digits pic 999.
                     04 filler pic x.
                        88 MsgIB-3Digits-Null-88 value low-values.
                     04           pic x(28).
sc-908               04           pic x(224).
                  03 filler redefines MsgIB-Buffer.
                     04 MsgIB-2Digits pic 99.
                     04 filler pic x.
                        88 MsgIB-2Digits-Null-88 value low-values.
                     04           pic x(29).
sc-908               04           pic x(224).
nx-015         02 MsgIB-x         pic x comp-x.

pw-221$if UNIX defined
pw-243 78  78-syslog                   value 1.
pw-221 78  78-log-nFlags               value 3.
pw-221 78  78-log-nFac                 value 8.
pw-221 78  78-log-info                 value 6.
pw-221 01  ws-syslog-vars.
pw-221     03  ws-log-id               pic x(20).
pw-268*pw-221     03  ws-log-message          pic x(80).
pw-268     03  ws-log-message          pic x(200).
pw-242     03  ws-save-rc              pic x(4)    comp-x.
pw-221$end
      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcwmg.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.80.2.1  2005/12/19 15:12:42  pmw
      ***  pw-402    Handle request from unknown user received
      ***            from MFA.
      ***  Modules:  casgreqt.cbl, dfhe3270.cbl, dfhe32db.cbl,
      ***            dfhebms.cbl,  dfhecci1.cbl, dfhgreq.cbl,
      ***            dfhc8srv.cpy, dfhcbgrq.cpy, dfhcpgrq.cpy,
      ***            dfhcwgdl.cpy, dfhzcesn.cbl
      ***
      ***  Revision 1.80  2005/05/16 02:00:25  sc
      ***  sc-i44 Limit unlimited diagnostic output to 4 gig;
      ***    Mod: casrdo11.cbl casxmast.htm dfhc8srv.cpy dfhcpism.cpy
      ***
      ***  Revision 1.79  2005/04/22 04:12:44  sc
      ***  x55238 1055238 how to get an online list of TS queues;
      ***         Added code to power through TS Datasets and display
      ***         the results in ESMAC; Incomplete-need delete & display;
      ***    Mod: casrdo32.dll casxmast.htm dfhc8srv.cpy dfhetstd.cbl
      ***
      ***  Revision 1.78  2005/03/23 15:41:05  pmw
      ***  537177    Caught by case sensitivity. Changed to use
      ***            constant for call and entry.
      ***  Modules:  casgate.cbl, dfhc8srv.cpy, dfhcpgrq.cpy
      ***
      ***  Revision 1.77  2005/03/03 14:41:30  njf
      ***  nx-226 - Install exit procedure in 'user sub-system'
      ***           during EXCI processing so that we can intercept
      ***           RTS errors and attempt to clean up the CICS
      ***           call stack.
      ***  Modules: dfheserv.cbl dfhecie.cbl
      ***           dfhc8srv.cpy
      ***           txmake.ctl
      ***  New Module: caseexpr.cbl
      ***
      ***  Revision 1.76  2005/02/10 21:43:36  sc
      ***  sc-q01 Move all MQ service processing to MFRHMQ; Provide
      ***         optional MQ message handling by the RH; Provide
      ***         optional native or CICS API execution of service;
      ***         Provide execution control via the IDT; Add trace;
      ***    Mod: cascbmqa.cpy cascpctl.cpy cascpsrv.cpy casmqsrv.cbl
      ***         cblproto.cpy cbltypes.cpy dfhc8srv.cpy dfhcptrf.cpy
      ***         dfhcpxfh.cpy dfheserv.cbl MFRHMQ.cbl   mqnative.cbl
      ***         mqnative.idt RCMQGETK.cbl RCMQGETK.idt traceid.doc
      ***         txmake.ctl
      ***
      ***  Revision 1.75  2004/11/16 17:16:21  njf
      ***  nx-217 - Additional work for transaction demarcation support.
      ***           Add new interface to allow specification of XA RM
      ***           prior to tx_open() call.
      ***           Diagnostics added around tx_*() entry points.
      ***  Modules: cascbctl.cpy cascbsrv.cpy cascpsrv.cpy dfhc8srv.cpy
      ***
      ***  Revision 1.74  2004/11/07 21:50:08  njf
      ***  nx-213 - Initial support for X/Open TX (Transaction
      ***           Demarcation) Interface. RTS will provide external
      ***           interface to functions like tx_begin(), tx_commit()
      ***           and tx_rollback().
      ***           Exec interface update and function prototypes added,
      ***           all function currently return 'fail'.
      ***           Support not tested, requires RTS update that should
      ***           be part of NX WS8/JCL EAP.
      ***  Modules: cascbctl.cpy cascbsrv.cpy cascpsrv.cpy dfhc8srv.cpy
      ***
      ***  Revision 1.73  2004/11/05 17:04:29  sc
      ***  x53910 1053910 Ability to manage terminal ids for applications
      ***         to avoid massive modifications; This changed propagates
      ***         the request handler name, server (listener) IP and port,
      ***         and the client IP and port addresses to the SEP. The
      ***         server and client addresses are propagated to the auto-
      ***         install exit via two additional pointers in the structure
      ***         passed to the exit. The transformers (request/response
      ***         package construction/interpretation) is now moved outside
      ***         of dfhgreq/casgreqt. This reduces the processing done
      ***         while shared memory is locked. It also reduces the
      ***         complexity of dfhgreq/casgreqt.
      ***    Mod: casbat.cbl   cascbctl.cpy cascbhyd.cpy cascpctl.cpy
      ***         cascpsub.cpy casgate.cbl  cassuba.cbl  casutla.cbl
      ***         dfhc8srv.cpy dfhcbcsa.cpy dfhcbsfe.cpy dfhcbtca.cpy
      ***         dfhcp1x4.cpy dfhcpgr2.cpy dfhcpgrq.cpy dfhcpjcp.cpy
      ***         dfhcpt3p.cpy dfhcptrf.cpy dfhcwai.cpy  dfhebms.cbl
      ***         dfheserv.cbl dfhgjcp.cbl  dfht32db.cbl dfht32sb.cbl
      ***         dfhtinit.cbl dfhzai.cbl   traceid.doc
      ***
      ***  Revision 1.72  2004/10/20 04:42:26  sc
      ***  ims-03 Add Bodge for MFS services; Correct problems;
      ***    Mod: casbat.cbl   cascbsrv.cpy cascpsrv.cpy cascwsrv.cpy
      ***         casimap.bms  casmpr.cbl   casrdo44.cbl caszxims.cbl
      ***         demo90.bms   demo90.cbl   demo90.mfs   demo91.bms
      ***         demo91.cbl   demo91.mfs   demo92.bms   demo92.cbl
      ***         demo92.mfs   dfhc8srv.cpy dfhcbcsa.cpy dfhcbice.cpy
      ***         dfhcbjcr.cpy dfhcbtcs.cpy dfhcpdup.cpy dfhcpgrq.cpy
      ***         dfhcptrf.cpy dfhcwdu2.cpy dfheserv.cbl dfhgdump.cbl
      ***         mfrhdbg.cbl  mfrhtest.cbl txmake.ctl
      ***
      ***  Revision 1.71  2004/10/14 10:52:03  sc
      ***  ims-01 Edit correction
      ***
      ***  Revision 1.70  2004/10/14 07:44:17  sc
      ***  jes-38 Add edits for Classes; Assorted JES fixes;
      ***         Add initial IMS Message Processing Support;
      ***    Mod: cascpbie.cpy cascwbie.cpy casmpr.cbl   casrdo44.cbl
      ***         casrdo52.cbl casrdo6.cbl  casrdo66.cbl casrdo91.cbl
      ***         casutl.cbl   casxmast.htm dfhc8srv.cpy dfhcbcsa.cpy
      ***         dfhcbdca.cpy dfhcbmrg.cpy dfhcbrdr.cpy dfhcbtca.cpy
      ***         dfhcpcmd.cpy dfhcpgrm.cpy dfhcpgrq.cpy dfhecics.cbl
      ***         dfheini1.cbl dfhgglbl.cbl messages     txmake.ctl
      ***
      ***  Revision 1.69  2004/09/13 09:42:01  njf
      ***  nx-206 - Additional changes to support EXCI interface
      ***           in ES service programs. We now validate options
      ***           such as the requriement that the service is
      ***           marked as container-managed.
      ***  Modules: dfheserv.cbl dfhecie.cbl
      ***           cascbecl.cpy dfhcwlds.cpy dfhc8srv.cpy
      ***
      ***  Revision 1.68  2004/08/20 10:36:21  peh
      ***  1050529 - WIP update of EXCI work.
      ***  modules: cicsecm.cbl dfhxecmg.cbl dfhxvldt.cbl dfhxvtbl.cbl
      ***           dfhc8srv.cpy dfhctxv8.cpy dfhctxvp.cpy dfhcwgpi.cpy
      ***  new: dfhctvec.cpy
      ***
      ***  Revision 1.67  2004/08/18 03:03:57  sc
      ***  jes-14 Initial work on Accept/Display. This provides the
      ***         internal infrastructure to support these functions.
      ***         This delivery also contains some bits for CSC. The
      ***         ESMAC function to respond to an accept from console
      ***         is missing. The module casrdo9g is a static test
      ***         for the function that could be used for testing.
      ***    Mod: casbat.cbl  cscaccept.cbl cascbctl.cpy cascbsmg.cpy
      ***         cascpsrv.cpy casprn.cbl   casrdo44.cbl casrdo9d.cbl
      ***         casrdo9f.cbl casrdo9g.cbl cassuba.cbl  cgitask.cbl
      ***         dfhc8scp.cpy dfhc8srv.cpy dfhcbenq.cpy dfhcbtmp.cpy
      ***         dfhcpdup.cpy dfhcpenq.cpy dfhcpgrq.cpy dfheserv.cbl
      ***         hellow.cbl
      ***
      ***  Revision 1.66  2004/07/06 11:08:39  pmw
      ***  050958    This RPI was complaining that when an authorisation
      ***            failure was occuring at the MFM/SNA level MCO was
      ***            reporting a SYSIDERR. Changed to recognise the
      ***            FMH-7 being returned and to report NOTAUTH. Code
      ***            handles incorrect FMH-7, FMH as it should appear after
      ***            correction, sense code received today and correct
      ***            sense code.
      ***  Modules:  dfhecci1.cbl dfhexfpf.cbl dfhc8srv.cpy
      ***            dfhcbgrq.cpy dfhcbtcl.cpy dfhcpgrq.cpy
      ***
      ***  Revision 1.65  2004/06/04 13:40:14  sc
      ***  jes-02 Lock Manager ENQ/DEQ function (major work->dfhcpenq)
      ***         Other work associated with the JES & JCL effort.
      ***    Mod: casbat.cbl  cascbjes.cpy cascbloc.cpy cascbsft.cpy
      ***         casgate.cbl cascpsrv.cpy casgreqt.cbl casrdo6.cbl
      ***         cassub.cbl  dfhc8srv.cpy dfhcbenq.cpy dfhcbtmp.cpy
      ***         cassuba.cbl dfhcpdup.cpy dfhcpenq.cpy dfhcpkcp.cpy
      ***         dfhgdup.cbl dfhcptrf.cpy dfheserv.cbl dfhgdump.cbl
      ***         dfhgreq.cbl dfhgglbl.cbl dfhztenq.cbl mfjdfep.cpy
      ***         txmake.ctl
      ***
      ***  Revision 1.64  2004/05/03 14:05:53  sc
      ***  jes-01 Add batch Job Entry Subsystem (JES) function.
      ***    Mod: See TXMAKE.CTL header for complete list
      ***
      ***  Revision 1.63  2004/02/10 21:26:57  njf
      ***  nx-174 - change 'dirty container' processing to
      ***           remove a srv- state flag. New entry point
      ***           in dfheserv called to make the DCA transient.
      ***           Initial changes for 3270 bridge functions in
      ***           non-MFE environment removing calls to MFPM.
      ***  Modules: dfheserv.cbl dfhgglbl.cbl dfhginit.cbl
      ***           cascbctl.cpy cascpctl.cpy dfhcpbrl.cpy dfhcpgrq.cpy
      ***           dfhc8srv.cpy
      ***
      ***  Revision 1.62  2003/03/28 15:00:02  NJF
      ***  nx-140 - RTS server interface update.
      ***           Pass status from XA start/end/commit/rollback calls
      ***           back to RTS. Fairly major updates to XA interface and
      ***           TRUE functions, limited testing so far, may require
      ***           further updates.
      ***           Add callback to allow container-managed WS to attempt
      ***           syncpoint prior to application completion.
      ***  Modules: dfheserv.cbl dfhexa.cbl
      ***           dfhcbxal.cpy dfhcpuex.cpy dfhcwuex.cpy cascbctl.cpy
      ***           cascpctl.cpy dfhc8srv.cpy
      ***           messages
      ***
      ***
      ***     Rev 1.61   28 Mar 2003 15:00:02   NJF
      ***  nx-140 - RTS server interface update.
      ***           Pass status from XA start/end/commit/rollback calls
      ***           back to RTS. Fairly major updates to XA interface and
      ***           TRUE functions, limited testing so far, may require
      ***           further updates.
      ***           Add callback to allow container-managed WS to attempt
      ***           syncpoint prior to application completion.
      ***  Modules: dfheserv.cbl dfhexa.cbl
      ***           dfhcbxal.cpy dfhcpuex.cpy dfhcwuex.cpy cascbctl.cpy
      ***           cascpctl.cpy dfhc8srv.cpy
      ***           messages
      ***
      ***     Rev 1.60   09 Jan 2003 10:05:52   PEH
      ***  peh543 - Brought CICS API to TS 2.2 level.
      ***  modules: cvda.txt dfhc8srv.cpy dfhctcvd.cpy dfhctvds.cpy
      ***           dfhctvtp.cpy dfhctvws.cpy dfhvalue.inc dfhxvtbl.cbl
      ***
      ***     Rev 1.59   18 Dec 2002 15:09:14   NJF
      ***  nx-094 - Updates for latest RTS spec (removal of
      ***           ServiceQualifier, now just ServiceName)
      ***           NOTE: These changes should not be put in NX40EAP1
      ***                 stream (Valero)
      ***
      ***           (dfheserv.cbl/mfrhcgi.cbl/cascgirh.cbl/valerorh.cbl/
      ***            messages)
      ***
      ***           De-allocate BLL cell storage on link exit.
      ***           Updates for tn3270 processing via MFCS.
      ***
      ***  Modules: casgate.cbl  dfhginit.cbl dfheuser.cbl dfheserv.cbl
      ***           cascgirh.cbl valerorh.cbl mfrhcgi.cbl
      ***           cascperr.cpy dfhc8dsc.cpy dfhcbtce.cpy dfhcpcla.cpy
      ***           dfhcwkcp.cpy cascprdt.cpy dfhc8srv.cpy cbltypes.cpy
      ***           messages
      ***
      ***     Rev 1.58   29 Nov 2002 17:18:48   NJF
      ***  nx-091 - Updates for tn3270 processing
      ***           Updated custom request handling (incomplete)
      ***  Modules: cascssrv.cbl casgate.cbl
      ***           dfhc8srv.cpy cascwhyd.cpy cascbhyd.cpy dfhcpgrq.cpy
      ***           dfhcbtcs.cpy dfhcpgrm.cpy
      ***
      ***     Rev 1.57   Nov 13 2002 18:59:24   PMW
      ***  pw-197    Further build, shape and GENESIS changes.
      ***  Modules:  dfh0cfg.cbl, dfhecics.cbl, dfhc8srv.cpy, dfhcplds.cpy,
      ***            mau-make.mk, txmake.ctl
      ***
      ***     Rev 1.56   04 Nov 2002 22:14:06   NJF
      ***  - put back Rev 1.54 changes
      ***
      ***     Rev 1.55   01 Nov 2002 15:37:58   PEH
      ***  528478 - Added SET FILE() DSNAME() function.
      ***           This works OK for catalogued and uncatalogued base files.
      ***  modules: dfhesysp.cbl dfhefctl.cbl dfhc8srv.cpy
      ***
      ***     Rev 1.54   26 Oct 2002 12:40:30   SC
      ***  sc-949 HTTP Documents, MQ configuration, CGI header processing
      ***    Mod: dfheserv.cbl cashtsrv.cbl casmqsrv.cbl dfhtmqgw.cbl
      ***         dfhgglbl.cbl cascwctl.cpy dfhc8srv.cpy dfhcbast.cpy
      ***         dfhcbcsb.cpy casbnsrv.cbl cascbct2.cpy valerorh.cbl
      ***         casrdo6.cbl  casgate.cbl  cascbhyd.cpy
      ***
      ***     Rev 1.53   17 Oct 2002 14:42:12   NJF
      ***  nx-066 - Provide ability to dynamically generate IDTs for system
      ***           administration requests.
      ***           Updates to RTS interface based on latest spec.
      ***           Change TXRFDIR to be <work-dir>\<regname>.
      ***           Add support for environment variable specification within
      ***           Medusa, $TXRFDIR\<regname>.env contains env vars.
      ***           Update for latest Medusa/mfdsa interface.
      ***  Modules: dfhginit.cbl dfheini1.cbl dfheserv.cbl dfh0cfgp.cbl
      ***           casasrvc.cbl dfh0cfg.cbl  dfhmd.cbl
      ***           dfhcprdt.cpy dfhcwver.cpy cascwrdt.cpy dfhc8srv.cpy
      ***           cascbctl.cpy dfhcpism.cpy dfhcbcfa.cpy  dfhcbmgr.cpy
      ***           dfhcplck.cpy cascbcfg.cpy
      ***           txmake.ctl   messages
      ***  New modules: casadmin.cbl cascbadm.cpy
      ***
      ***     Rev 1.52   20 Sep 2002 16:11:42   NJF
      ***  nx-055 - update for latest RTS interface changes
      ***  Modules: casasrvc.cbl dfheserv.cbl dfhmd.cbl
      ***           dfhc8srv.cpy cascwrdt.cpy dfhcptmp.cpy cascprdt.cpy
      ***           dfhcwver.cpy cascbctl.cpy cascpctl.cpy
      ***           messages
      ***
      ***     Rev 1.51   06 Sep 2002 15:17:32   NJF
      ***  nx-046 - updates for latest RTS interface spec
      ***  Modules: dfheserv.cbl dfhgglbl.cbl
      ***           cascbct2.cpy cascbctl.cpy dfhc8srv.cpy cascpctl.cpy
      ***
      ***     Rev 1.50   02 Sep 2002 16:33:40   NJF
      ***  nx-043 - Update to trace ids for cas processing.
      ***           Fix for memory leak on dca local trace table.
      ***           Additional support for dirty container response.
      ***  Modules: dfheserv.cbl casmqsrv.cbl casbnsrv.cbl cashtsrv.cbl
      ***           dfhgglbl.cbl dfhemesg.cbl
      ***           cascpctl.cpy cascbctl.cpy dfhcptrf.cpy dfhc8srv.cpy
      ***           dfhcbdca.cpy dfhcpgrq.cpy dfhcpdup.cpy
      ***
      ***     Rev 1.49   21 Aug 2002 10:56:18   NJF
      ***  nx-0038 - interim check-in of updated configuration processing
      ***  Modules: casmqsrv.cbl casbnsrv.cbl cashtsrv.cbl dfheserv.cbl
      ***           cascfg.cbl
      ***           dfhc8srv.cpy dfhcprdt.cpy cascbctl.cpy cascpctl.cpy
      ***           cascbcfg.cpy
      ***
      ***     Rev 1.48   14 Aug 2002 22:19:44   SC
      ***  sc-923 Split of dfheserv into four modules
      ***   Mods: dfheserv.cbl dfhcptrl.cpy dfhc8srv.cpy txmake.ctl
      ***         cascbct2.cpy cascpctl.cpy casbnsrv.cbl cashtsrv.cbl
      ***         casddsrv.cbl cascwctl.cpy cascbctl.cpy casmqsrv.cbl
      ***         makegen.cbl
      ***
      ***     Rev 1.47   10 Jul 2002 08:22:26   SC
      ***  sc-916 ACCCGI Request Handler Support and RDO application
      ***         Also adjust to changed RTS interfaces.
      ***
      ***     Rev 1.46   27 Apr 2002 09:51:10   SC
      ***  sc-904, sq-904, and sh-904: Valero Early Adopter Program
      ***  Add MQ listener support. Add plugable Request Handler
      ***  support. Add unit test programs for HTTP and MQ flows.
      ***  Modules: dfheserv.cbl dfhtmqgw.cbl dfhgglbl.cbl dfhginit.cbl
      ***           dfhmd.cbl    mfzqget.cbl  dfhc8scp.cpy dfhc8srv.cpy
      ***           dfhcbtct.cpy mfreqcxt.cpy httpctl.txt  mftest.cbl
      ***           cpjrh.cbl    dfhzsoap.cbl gateway.cbl  httprun.cbl
      ***
      ***     Rev 1.45   27 Mar 2002 11:11:02   NJF
      ***  asee01 - Initial port of MFE/CICS to NX as part of
      ***           SolCorp work. Subset of CICS functionality to
      ***           be delivered as a NX AddPack.
      ***           Includes work to support long/spacey filenames
      ***           on NX/MFE and in future SX. (not complete)
      ***           This work also forms part of Web Services engine
      ***           and has attempted to keep a common code base
      ***           across all products.
      ***  Modules: cicsecm.cbl  dfh0cfg.cbl  dfh0cfgp.cbl dfh0conf.cbl
      ***           dfhebms.cbl  dfhecics.cbl dfhefctl.cbl dfheini1.cbl
      ***           dfherdio.cbl dfhetrm1.cbl dfhginit.cbl dfhmd.cbl
      ***           dfhrem.cbl   dfhtxs.cbl   mvstrig.cbl
      ***           dfhc8rts.cpy dfhcpcds.cpy dfhcpcmd.cpy dfhcpdev.cpy
      ***           dfhcpdir.cpy dfhcpism.cpy dfhcpitb.cpy dfhcplds.cpy
      ***           dfhcpmrg.cpy dfhcprdt.cpy dfhcprel.cpy dfhcpscn.cpy
      ***           dfhctxcm.cpy dfhcwcmd.cpy dfhcwdir.cpy dfhcwfnf.cpy
      ***           dfhcwism.cpy dfhcwlds.cpy dfhcwmrg.cpy dfhcwscn.cpy
      ***           dfhc8srv.cpy
      ***           makegen.cbl + more!
      ***
      ***     Rev 1.44   25 Jan 2002 15:19:06   PEH
      ***  701473 - Add MAPNAME and MAPSETNAME to INQUIRE TERMINAL.
      ***  modules: dfhc8srv.cpy dfhctvsi.cpy
      ***
      ***     Rev 1.43   09 Jan 2002 09:38:10   PEH
      ***  1027958 - Update INQUIRE TASK, PROGRAM and SYSTEM API.
      ***            Add INQUIRE UOW API (unsupported).
      ***  modules: dfhc8srv.cpy dfhctcvd.cpy dfhctvsi.cpy dfhctvss.cpy
      ***           dfhresp.inc  dfhvalue.inc dfhxvtbl.cbl
      ***
      ***     Rev 1.42   12 Dec 2001 11:23:58   PEH
      ***  1026930 - Added the new ECM directive LINKAGE=NO for called
      ***            programs. This means that DFHEIBLK and DFHCOMMAREA
      ***            will not be inserted into LINKAGE, and the procedure
      ***            division USING statement will not be updated.
      ***            Also, allow CICS programs to be executed in batch as
      ***            long as they don't invoke CICS calls.
      ***  modules: cicsecm.cbl dfhc8srv.cpy dfhctxc8.cpy dfhctxcf.cpy
      ***           dfhctxcp.cpy dfheuser.cbl dfhxecmb.cbl dfhctxcm.cpy
      ***
      ***     Rev 1.41   23 Nov 2001 21:55:08   SC
      ***  sc-900 Mods for soap server
      ***
      ***     Rev 1.40   31 Oct 2001 10:48:24   PEH
      ***  1024798 - Add limited support for VSE SPOOL REPORT.
      ***            Essentially, this support uses the existing SPOOL
      ***            API, which means that none of the report functions
      ***            is implemented.
      ***  modules: dfhc8srv.cpy dfhctvsp.cpy dfhesysp.cbl dfhxvtbl.cbl
      ***
      ***     Rev 1.39   16 Jul 2001 13:44:10   PEH
      ***  1022703 - Add NETNAMEIDERR to EIBRESP values.
      ***  modules: dfhc8srv.cpy dfhctrsp.cpy
      ***
      ***     Rev 1.38   Mar 30 2001 10:01:26   PMW
      ***  spool0    Initial support for SPOOL commands.
      ***  Modules:  dfheserv.cbl, dfheini1.cbl, dfhesysp.cbl, dfhginit.cbl,
      ***            dfhc8scp.cpy, dfhc8srv.cpy, dfhcbcsa.cpy, dfhcbscg.cpy,
      ***            dfhcbscl.cpy, dfhcpism.cpy, dfhctvsp.cpy
      ***
      ***     Rev 1.37   28 Jan 2000 10:44:44   PEH
      ***  peh482 - Added BRIDGE and IDENTIFIER to INQUIRE TASK.
      ***           Added BREXIT and FACILITYLIKE to INQUIRE
      ***            TRANSACTION.
      ***  modules: dfhctvsi.cpy dfhc8srv.cpy dfhesysp.cbl
      ***
      ***     Rev 1.36   06 Dec 1999 10:29:34   PMW
      ***  pw-097    Support for the additional of an optional path
      ***            for the backup file specified on the dfhpcupg
      ***            command line.
      ***
      ***  Modules:  dfhc8srv.cpy, dfhcwcmd.cpy, DFHPCUPG.CBL
      ***
      ***     Rev 1.35   03 Dec 1999 16:55:46   NJF
      ***  nf-196 - continuing work on 3270 bridge support and addition
      ***           of MQSeries batch support modules.
      ***  Modules: dfheibmq.cbl dfheserv.cbl dfhebms.cbl  dfhesysp.cbl
      ***           dfhcbmqi.cpy dfhcpbrl.cpy dfhcwtmp.cpy dfhcptmp.cpy
      ***           dfhcwism.cpy dfhcpmqi.cpy dfhcwbmq.cpy dfhc8srv.cpy
      ***  New modules: dfh0mqis.cbl mqconn.cbl mqconnx.cbl
      ***
      ***     Rev 1.34   26 Oct 1999 14:22:56   PEH
      ***  peh468 - Bring CVDAs and conditions to TS 1.3 level.
      ***  modules: dfhctrsp.cpy dfhc8srv.cpy dfhctcvd.cpy
      ***
      ***     Rev 1.33   25 Oct 1999 10:01:38   PEH
      ***  peh467 - Add Document Services API.
      ***  modules: dfhc8srv.cpy dfhxvtbl.cbl dfhxecmb.cbl dfhxecmg.cbl
      ***           dfhctxv8.cpy
      ***  new:     dfhctvds.cpy
      ***
      ***     Rev 1.32   21 Oct 1999 09:24:36   PEH
      ***  peh466 - Add Counter Services API.
      ***  modules: dfhc8srv.cpy dfhxvtbl.cbl
      ***  new:     dfhctvcs.cpy
      ***
      ***     Rev 1.31   18 Oct 1999 15:06:34   PEH
      ***  peh464 - Added START ATTACH, web services, and TCP/IP
      ***           services API.
      ***  modules: dfhctvic.cpy dfhxvtbl.cbl dfhc8srv.cpy exif-6m.doc
      ***  new:     dfhctvws.cpy dfhctvtp.cpy
      ***
      ***     Rev 1.30   08 Oct 1999 17:27:22   PEH
      ***  peh462 - Add new ASSIGN options.
      ***  modules: dfhctvaa.cpy dfhc8srv.cpy exif-6j.doc
      ***
      ***     Rev 1.29   08 Oct 1999 10:42:22   PEH
      ***  peh460 - Add all the new commands and functions for CICS
      ***           4.1 and TS 1.1 API.
      ***           ASSIGN options omitted owing to xarg limit.
      ***  modules: dfhctvaa.cpy dfhctvic.cpy dfhctvfc.cpy dfhctvdv.cpy
      ***           dfhctvtc.cpy dfhctvbm.cpy dfhc8srv.cpy dfhxvtbl.cbl
      ***           exif-6l.doc exif-6m.doc exif-6d.doc exif-6c.doc
      ***           exif-6t.doc exif-6v.doc exif-6w.docexif-6f.doc
      ***           exif-6n.doc exif-2.doc
      ***
      ***     Rev 1.28   01 Sep 1999 16:11:34   PEH
      ***  200088 - Allow ASSIGN INVOKINGPROG as unsupported option.
      ***  modules: dfhctvaa.cpy dfhc8srv.cpy
      ***
      ***     Rev 1.27   25 Aug 1999 15:42:00   PEH
      ***  peh455 - Add UNCOMMITTED as unsupported option on READ.
      ***           Add DFHRESP values: RECORDBUSY & LOCKED.
      ***  modules: dfhctvfc.cpy dfhc8srv.cpy dfhctrsp.cpy
      ***
      ***     Rev 1.26   24 Aug 1999 14:25:04   PEH
      ***  peh452 - Add support for the following:
      ***            enter tracenum() resource()
      ***            assign bridge()
      ***            inquire transaction() isolatest()
      ***                    taskdatakey() taskdataloc()
      ***  modules: dfhctvaa.cpy dfhc8srv.cpy dfhctvsi.cpy
      ***
      ***     Rev 1.25   29 Jul 1999 15:11:18   PEH
      ***  516108 - Add QNAME as unsupported option on:
      ***            DELETEQ TS, READQ TS, WRITEQ TS.
      ***           Add unsupported functions:
      ***            INQUIRE TSQUEUE/TSQNAME, SET TSQUEUE/TSQNAME.
      ***  modules: dfhctvts.cpy dfhc8srv.cpy dfhctxv8.cpy dfhctvsi.cpy
      ***           dfhctvss.cpy dfhxvtbl.cbl dfhctcvd.cpy exif-6z.doc
      ***           exif-6u.doc
      ***
      ***     Rev 1.24   21 Jul 1999 14:40:54   PEH
      ***  516109 - Add START BREXIT to ECM as an unsupported function.
      ***  modules: dfhctvic.cpy dfhc8srv.cpy dfhxvtbl.cbl exif-2.doc
      ***
      ***     Rev 1.23   02 Mar 1999 02:16:12   MJW
      ***  702177 Add SEGIDERR to table of valid condition names for DFHRESP().
      ***    Modules: dfhc8srv.cpy  dfhctrsp.cpy
      ***  ----------
      ***
      ***     Rev 1.22   09 Apr 1998 02:28:40   MJW
      ***  FULLDT Add FULLDATE option to FORMATTIME command.
      ***    Modules: dfhesche.cbl  dfhc8srv.cpy  dfhctvic.cpy
      ***  ----------
      ***
      ***     Rev 1.21   16 Jan 1998 15:53:42   PMW
      ***  500097    A SEND for a non-existant map should have
      ***            caused an APCT abend instead of AEI0.
      ***
      ***  Modules:  dfhc8srv.cpy
      ***
      ***     Rev 1.20   09 Jun 1997 15:10:12   PMW
      ***  n47670    Changes to allow selection of 24 or 31 bit amode
      ***            support for shared pages. This requires certain
      ***            actions to be denied if the SIT mode is 31 bit and
      ***            the program is 24 bit and the addressed area extends
      ***            passed the 16Meg line.
      ***
      ***  Modules:  dfheexin.cbl, dfheini1.cbl, dfhepctc.cbl, dfheserv.cbl,
      ***            dfhc8srv.cpy, dfhcbcsa.cpy, dfhcbpca.cpy, dfhcpapi.cpy,
      ***            dfhcpapz.cpy, dfhcpism.cpy, dfhcwapi.cpy
      ***
      ***
      ***
      ***
      ***     Rev 1.19   19 May 1997 15:11:22   PMW
      ***  pw-044    Have now added a 'reset' entry point in dfh0crtp
      ***            so that we do not have to rely on the success or
      ***            otherwise of a cancel operation.
      ***
      ***  Modules:  dfhtxs.cbl, dfh0crtp.cbl, dfhc8srv.cpy
      ***
      ***     Rev 1.18   30 Dec 1996 21:20:26   SC
      ***  sc-246 MQ EBCDIC support.  Add MQ API trace points.
      ***   Modules: dfhc8srv.cpy dfhcptrf.cpy dfhcweib.cpy dfheibmq.cbl traceid.doc
      ***
      ***     Rev 1.17   08 Nov 1996 09:21:22   PMW
      ***  pw-029    Additional 78-SP-is- entries for INQUIRE TASK
      ***            (pw-028) work.
      ***
      ***  Modules:  dfhc8srv.cpy
      ***
      ***     Rev 1.16   07 Nov 1996 15:40:02   gkb
      ***  n44827 - On single process termination we are not closing CCI.
      ***          This was causing the next invokation of a region from
      ***          the same machine to fail.
      ***           Added code to handle abnormal termination of single
      ***          tasking region so this also shuts down CCI, and de-
      ***          registers the cci client. Added a message to inform
      ***          the server region that the client region has terminated
      ***          abnormally.
      ***
      ***  Modules: dfhc8srv.cpy dfhcbcc2.cpy dfhcbtca.cpy dfhcpb32.cpy
      ***           dfhcpppc.cpy dfhcwcci.cpy dfhcwppc.cpy dfheserv.cbl
      ***           dfhetrm1.cbl dfhtcci.cbl  messages
      ***
      ***     Rev 1.15   25 Oct 1996 11:51:12   NJF
      ***  nf-141 - GA enablement of exception popup support. Early
      ***           release enabled for non-UNIX, single tasking.
      ***  Modules: dfheini1.cbl dfheuser.cbl dfheapup.cbl dfhc8srv.cpy
      ***           dfh0cfg.cbl  dfhcwini.cpy txcase.cmd   txcase.sh
      ***  New Modules: dfhzcpop.cbl dfhcbexp.cpy dfhcpop.bms
      ***
      ***     Rev 1.14   07 Oct 1996 10:56:20   MJW
      ***  P32115 Make AMODE"255" a synonym for NOAMODE when checking the
      ***         directives for a user program (returned by v3.2.50 COBOL).
      ***         Change all emulation tests of the AMODE setting to use the
      ***         flags in the ATP field (added flag for 24/31 bit to ATP)
      ***         since AMODE is user-program specific.
      ***         Add MFPM forced abend when an AMODE program is invoked, but
      ***         the support was not loaded (CSA flag = No).
      ***    Modules: dfheserv.cbl  dfhxc2pp.cbl  dfheexin.cbl  dfhepctc.cbl
      ***             dfhesche.cbl  dfhesysp.cbl  dfheuser.cbl  dfhc8srv.cpy
      ***             dfhcbatp.cpy  dfhcbapi.cpy  dfhcpadr.cpy  dfhcpscl.cpy
      ***  ----------
      ***
      ***     Rev 1.13   18 Sep 1996 15:19:26   PMW
      ***  n44235      Certain triggers were provoking CCI error 8s in the daemon
      ***              because the were not executing a CCI-Closeclient. Fixed this
      ***              for most cases by installing an exit procedure from dfh0crtp.
      ***              An entry is also available in dfh0crtp to this code.
      ***
      ***  Modules:    dfh0crtp.cbl, dfhetrm1.cbl, dfhgterm.cbl, dfhmd.cbl, dfhmon.cbl
      ***              dfhc8srv.cpy, dfhcbmq.cpy
      ***
      ***
      ***     Rev 1.12   13 Jun 1996 19:43:52   NJF
      ***  nf-114 - Enablement of web3270 interface (incomplete).
      ***  Modules: dfhc8srv.cpy dfhcbtct.cpy dfhebms.cbl dfheserv.cbl
      ***           txcase.cmd   txcase.sh
      ***  New: dfhcbhtf.cpy
      ***
      ***     Rev 1.11   11 Jun 1996 21:19:56   SC
      ***  sc-215 Correct GDS commands and EIBFN codes
      ***
      ***     Rev 1.10   18 Mar 1996 16:33:24   NJF
      ***  nf-099 - moved load of dfh0load / dfh0ex32 from
      ***           dfh0cfg to dfheini1 now (update 1 req)
      ***         - added ability to specify an env var for
      ***           DFLTSIT in the config file
      ***         - changed the initialisation interface into
      ***           MF/370 to indicate running single or
      ***           multi tasking
      ***         - added vector control api interface for
      ***           MF/370 so it can inquire/raise abend conditions
      ***         - added messaging code for MF/370 initialisation
      ***  Modules: dfheini1.cbl dfheuser.cbl dfh0cfg.cbl messages
      ***           txcase.cmd   txcase.sh    dfhc8srv.cpy
      ***  New Modules: dfhcbcvc.cpy exvecapi.doc
      ***
      ***     Rev 1.9   14 Feb 1996 01:02:00   TJC
      ***  tc-181 - Changes for the following;
      ***
      ***           p29761         :  Allow copy of private groups
      ***           p30181/p30172  :  Fix basic RDO F6=Expand function
      ***                             This required BRDO to register with
      ***                             DFHRAPI with an initialization call
      ***           tc-sta         :  Correct problems with the statically
      ***                             linked dfhrapi.
      ***
      ***           modules:  dfhc8srv.cpy  dfhcpdeb.cpy  dfhpcbon.cbl
      ***                     dfhpcrdg.cbl  dfhrapi.cbl   m160rapi.mk
      ***
      ***     Rev 1.8   13 Feb 1996 05:11:52   TJC
      ***  tc-170 - Rdo file version upgrade processing added.
      ***
      ***           modules:  dfhpcrdg.cbl dfhrapi.bl dfhrdef.cbl dfhpcupg.cbl
      ***                     dfhc8rdm.cpy dfhc8srv.cpy dfhcbrdr.cpy
      ***                     dfhcpder.cpy dfhcphdr.cpy dfhcprd2.cpy
      ***                     dfhcwson.s
      ***
      ***     Rev 1.7   14 Dec 1995 04:13:58   MJW
      ***  N31059 Redesign/Reimplement CALL Handling in CICS Programs
      ***         Changes to support calls from non-CICS programs and to
      ***         support non-main Entry points in CICS programs.
      ***         ----------
      ***         Mixed high-level language rules are now enforced.
      ***         ----------
      ***    Modules: dfheini1.cbl  dfhepctc.cbl  dfheserv.cbl  dfheuser.cbl
      ***             dfhgcsaa.cbl  dfhxc2pc.cbl  dfhxc2pp.cbl  dfhxppin.cbl
      ***             dfhzai.cbl    dfhzcins.cbl  dfhzcmap.cbl  stutest1.cbl
      ***             messages      dfhc8prp.cpy  dfhc8rts.cpy  dfhc8srv.cpy
      ***             dfhcbapi.cpy  dfhcbatp.cpy  dfhcbppt.cpy  dfhcbprp.cpy
      ***             dfhclapi.cpy  dfhclusr.cpy  dfhcpapi.cpy  dfhcpcvt.cpy
      ***             dfhcprdt.cpy  dfhctepi.cpy  dfhctexe.cpy  dfhctpro.cpy
      ***             dfhctws.cpy   dfhcwapi.cpy
      ***  ----------
      ***
      ***     Rev 1.6   11 Aug 1995 06:49:34   SC
      ***  P27252 EXEC CICS LOAD ENTRY() support
      ***    This work adds support for the ENTRY() parameter and
      ***    allows this to work with .dll, .gnt, and .int modules
      ***    in both single and multi-tasking systems.  Also corrected
      ***    errors in MFPM support for local deallocate. Also re-did
      ***    the work for pao20814 which was lost last year. Added
      ***    test programs for LOAD api function. Unit testing is
      ***    complete. Additional work will be required for SPI and
      ***    errors uncovered in integrated testing.
      ***   Modules: dfh0ld16.asm dfh0utl1.asm dfh0utl2.asm dfhc8srv.cpy
      ***            dfhcbapi.cpy dfhcbppt.cpy dfhcbrel.cpy dfhcbtcs.cpy
      ***            dfhcpadr.cpy dfhcpapi.cpy dfhcpism.cpy dfhcprel.cpy
      ***            dfhcpscl.cpy dfhcptmp.cpy dfhcptrn.cpy dfhctvpc.cpy
      ***            dfheexin.cbl dfhepctc.cbl dfheserv.cbl dfhesync.cbl
      ***            dfhesysp.cbl dfheuser.cbl dfhgdump.cbl dfhzload.cbl
      ***            ldt0000b.cbl ldt1000b.cbl ldv0000b.cbl m16-utls.mk
      ***            traceid.doc  txcase.cmd   txmake.ctl   dfhebms.cbl
      ***
      ***     Rev 1.5   10 Aug 1995 23:30:52   SC
      ***  P27252 EXEC CICS LOAD ENTRY() support
      ***    This work adds support for the ENTRY() parameter and
      ***    allows this to work with .dll, .gnt, and .int modules
      ***    in both single and multi-tasking systems.  Also corrected
      ***    errors in MFPM support for local deallocate. Also re-did
      ***    the work for pao20814 which was lost last year. Added
      ***    test programs for LOAD api function. Unit testing is
      ***    complete. Additional work will be required for SPI and
      ***    errors uncovered in integrated testing.
      ***   Modules: dfh0ld16.asm dfh0utl1.asm dfh0utl2.asm dfhc8srv.cpy
      ***            dfhcbapi.cpy dfhcbppt.cpy dfhcbrel.cpy dfhcbtcs.cpy
      ***            dfhcpadr.cpy dfhcpapi.cpy dfhcpism.cpy dfhcprel.cpy
      ***            dfhcpscl.cpy dfhcptmp.cpy dfhcptrn.cpy dfhctvpc.cpy
      ***            dfheexin.cbl dfhepctc.cbl dfheserv.cbl dfhesync.cbl
      ***            dfhesysp.cbl dfheuser.cbl dfhgdump.cbl dfhzload.cbl
      ***            ldt0000b.cbl ldt1000b.cbl ldv0000b.cbl m16-utls.mk
      ***            traceid.doc  txcase.cmd   txmake.ctl   dfhebms.cbl
      ***
      ***     Rev 1.4   19 Jun 1995 21:44:00   MJW
      ***  mjwx76 Add special entry point (MFXWSADR) for MF/370 CICS
      ***         support that returns the address of the MCO control
      ***         area (DFH-MF-CONTROL) in the "current" User program.
      ***    Modules: dfheuser.cbl  dfhc8srv.cpy  dfheuser.def  dfheuser.3ef
      ***  ----------
      ***
      ***     Rev 1.3   04 Jun 1995 22:32:18   SC
      ***  P25238 Need ability to manipulate TCTTE to change case translation
      ***    Diamond Shamrock: Work completed to query the client process and
      ***    mmanupilate values in that process. Additional work will be
      ***    needed to fill out the SET/INQUIRE TERMINAL parameter set.
      ***   Modules: dfhc8srv.cpy dfhcbjcr.cpy dfhcbrdr.cpy dfhcbtcs.cpy
      ***            dfhcpgrq.cpy dfhcpt3p.cpy dfhcptir.cpy dfhcptmc.cpy
      ***            dfhctcvd.cpy dfhctvss.cpy dfhesysp.cbl dfhgreq.cbl
      ***            dfht32db.cbl dfht32sb.cbl dfhtcci.cbl  dfhxcics.cbl
      ***
      ***     Rev 1.2   30 Mar 1995 22:49:02   SC
      ***  N37025 Add CICS V4.1 API function for START and FORMATTIME
      ***    USERID for START and extended date formats for FORMATTIME.
      ***    Add extensive tests for FORMATTIME, and corrected errors.
      ***  Modules: dfhc8srv.cpy dfhcbrdr.cpy dfhctvic.cpy dfhedate.cbl
      ***           dfheexin.cbl dfhesche.cbl dfheserv.cbl ifv1000b.cbl
      ***
      ***     Rev 1.1   13 Mar 1995 10:50:38   CHJB
      ***  cjbgui - Remove old change flags and add animator 2 restart
      ***           exit procedure name
      ***
      ***     Rev 1.0   10 Feb 1995 11:27:56   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
      ***  Year value used to determine 1900s or 2000s Century

sc-949$if MTS-ASEE defined
nx-094*sc-949 78  78-arh-SOAP-rh-name         value z'MFRHSOAP'.
nx-094 78  78-arh-SOAP-rh-name         value 'MFRHSOAP'.
sc-949 78  78-arh-SOAP-rh-len          value 8.
nx-094*sc-949 78  78-arh-MFBINP-rh-name       value z'MFRHBINP'.
nx-094 78  78-arh-MFBINP-rh-name       value 'MFRHBINP'.
sc-949 78  78-arh-MFBINP-rh-len        value 8.
sc-q01 78  78-arh-MFMQ-rh-name         value 'MFRHMQ'.
sc-q01 78  78-arh-MFMQ-rh-len          value 6.
nx-094*sc-949 78  78-arh-CGI-rh-name          value z'MFRHCGI'.
nx-094 78  78-arh-CGI-rh-name          value 'MFRHCGI'.
sc-949 78  78-arh-CGI-rh-len           value 7.
nx-094*sc-949 78  78-arh-asee-rh-name         value z'asee'.
nx-094 78  78-arh-asee-rh-name         value 'asee'.
sc-949 78  78-arh-asee-rh-len          value 4.
jes-01 78  78-arh-MFRHJCL-rh-name      value 'MFRHJCL'.
jes-01 78  78-arh-MFRHJCL-rh-len       value 7.
jes-38 78  78-arh-MFRHIMS-rh-name      value 'MFRHIMS'.
jes-38 78  78-arh-MFRHIMS-rh-len       value 7.
ims-03 78  78-arh-MFRHDBG-rh-name      value 'MFRHDBG'.
ims-03 78  78-arh-MFRHDBG-rh-len       value 7.
sc-949$end (MTS-ASEE defined)
sc-i44***  *>-----------------------------------------------<*
sc-i44***  *> Value = 4 gig - 4 meg    value 4290772992     <*
sc-i44***  *>      or 2 gig - 4 meg    value 2145386496     <*
sc-i44***  *> The valuse is checked after a write           <*
sc-i44***  *> operation. Therefore, the two meg buffer      <*
sc-i44***  *> allows for this overflow prior to the switch. <*
sc-i44***  *>-----------------------------------------------<*
sc-i44 78  78-diag-dataset-max-size    value 4290772992.
sc-i44*78  78-diag-dataset-max-size    value 2145386496.

      $IF DOS defined
       78  78-gnt-extention            value '.gnt '.
P27252 78  78-dll-extention            value '.dle '.
      $ELSE
      $IF WIN defined
       78  78-dll-extention            value '.dlw '.
      $ELSE
asee01*78  78-dll-extention            value '.dll '.
pw-197$if UNIX defined
pw-197 78  78-dll-extention            value '.so'.
pw-197$else
asee01 78  78-dll-extention            value '.dll'.
pw-197$end
      $END
      $END

       78  78-CICS-earliest-1900-year  value 80.

      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation Server Module / Entry-Point Names               *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-CICS-get-address         value 'mFdfh_get_address'.

       78  78-CICS-IPC-INITIALIZE      value 'dfhgreq'.

      $IF OSMCO = 'UNIX'
       78  78-CICS-server-ecics-exit   value 'mFdfh_ecics_exit'.
       78  78-CICS-server-eserv-exit   value 'mFdfh_eserv_exit'.
      $ELSE
       78  78-CICS-server-ecics-exit   value 'mFxcicsx'.
       78  78-CICS-server-eserv-exit   value 'mFxservx'.
      $END
cjbgui 78  78-CICS-server-anim-exit    value 'mFxserva'.

       78  78-CICS-RD-FILE-IO          VALUE 'dfherdio'.
       78  78-CICS-CNV-FILE-IO         VALUE 'dfherdcv'.
       78  78-CICS-FILE-CTL-OPEN       value 'dfhefcop'.
       78  78-CICS-RD-table-fill-pgm   value 'dfhpcini'.
tc-170 78  78-CICS-RD-upgrade-pgm      value 'dfhpcupg'.
       78  78-CICS-run-time-lock       value 'dfhelock'.

       78  78-CICS-BMS-SUPPORT         value 'dfhebms'.
       78  78-CSPG-transid             value 'CSPG'.
       78  78-CICS-shutdown            value 'mF_shut'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-bms-api             value 'mFdfh_bms_ctl'.
       78  78-CICS-termctl-api         value 'mFdfh_term_ctl'.
       78  78-CICS-bms-term-init       value 'mFdfh_bms_term_init'.
       78  78-CICS-bms-syncpoint       value 'mFdfh_bms_syncpoint'.
       78  78-CICS-62-service          value 'mFdfh_62_service'.
       78  78-CICS-bms-inputmsg        value 'mFdfh_bms_inputmsg'.
      $ELSE
       78  78-CICS-bms-api             value 'mFxbmsap'.
       78  78-CICS-termctl-api         value 'mFxtcpap'.
       78  78-CICS-bms-term-init       value 'mFxbmsti'.
       78  78-CICS-bms-syncpoint       value 'mFxbmssy'.
       78  78-CICS-62-service          value 'mFx62srv'.
       78  78-CICS-bms-inputmsg        value 'mFxbmsim'.
      $END

n44827 78  78-CICS-cci-disconnect      value  'mF_cci_disconnect'.
       78  78-CICS-EXEC-INTERFACE      value 'dfheexin'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-base-api            value 'mFdfh_base_API'.
      $ELSE
       78  78-CICS-base-api            value 'mFxbseap'.
      $END

       78  78-CICS-FILE-CONTROL        value 'dfhefctl'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-filectl-api         value 'mFdfh_file_ctl'.
       78  78-CICS-filectl-internal    value 'mFdfh_file_internal'.
       78  78-CICS-filectl-reset       value 'mFdfh_file_reset'.
528478 78  78-CICS-filectl-dsn         value 'mFdfh_file_dsnupdate'.
      $ELSE
       78  78-CICS-filectl-api         value 'mFxfcpap'.
       78  78-CICS-filectl-internal    value 'mFxfcpin'.
       78  78-CICS-filectl-reset       value 'mFxfcrst'.
528478 78  78-CICS-filectl-dsn         value 'mFxfcdsn'.
      $END
       78  78-CICS-FILE-CTL-KSDS       value 'dfhefcks'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-filectl-ksds        value 'mFdfh_file_KSDS'.
      $ELSE
       78  78-CICS-filectl-ksds        value 'mFxfcKSD'.
      $END
       78  78-CICS-FILE-CTL-ESDS       value 'dfhefces'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-filectl-esds        value 'mFdfh_file_ESDS'.
      $ELSE
       78  78-CICS-filectl-esds        value 'mFxfcESD'.
      $END
       78  78-CICS-FILE-CTL-ESDS-OLD   value 'dfhefcek'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-filectl-esds-old    value 'mFdfh_file_ESKK'.
      $ELSE
       78  78-CICS-filectl-esds-old    value 'mFxfcESK'.
      $END
       78  78-CICS-FILE-CTL-RRDS       value 'dfhefcrr'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-filectl-rrds        value 'mFdfh_file_RRDS'.
      $ELSE
       78  78-CICS-filectl-rrds        value 'mFxfcRRD'.
      $END


       78  78-CICS-CSPG-PROG-CONTROL   value 'dfhzcspg'.
       78  78-CICS-TASK-PROG-CONTROL   value 'dfhepctc'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-taskctl-api         value 'mFdfh_prog_task'.
       78  78-CICS-taskctl-internal    value 'mFdfh_prog_internal'.
       78  78-CICS-program-verify      value 'mFdfh_program_verify'.
      $ELSE
       78  78-CICS-taskctl-api         value 'mFxkcpap'.
       78  78-CICS-taskctl-internal    value 'mFxkcpin'.
       78  78-CICS-program-verify      value 'mFxpcpvr'.
      $END

       78  78-CICS-TSTD-SUPPORT        value 'dfhetstd'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-tstdctl-api         value 'mFdfh_tstd_ctl'.
       78  78-CICS-tstdctl-internal    value 'mFdfh_tstd_internal'.
       78  78-CICS-start-data-write    value 'mFdfh_ic_write'.
       78  78-CICS-start-data-retrieve value 'mFdfh_ic_retrieve'.
       78  78-CICS-start-data-cancel   value 'mFdfh_ic_cancel'.
       78  78-CICS-page-queue-delete   value 'mFdfh_pg_q_delete'.
       78  78-CICS-page-queue-write    value 'mFdfh_pg_q_write'.
       78  78-CICS-tstd-syncpoint      value 'mFdfh_tstd_syncpoint'.
       78  78-CICS-write-protected-ice  value 'mFdfh_wr_prot_ice'.
       78  78-CICS-delete-protected-ice value 'mFdfh_del_prot_ice'.
       78  78-CICS-PLI-td-queue-write  value 'mFdfh_PLI_td_write'.
      $ELSE
       78  78-CICS-tstdctl-api         value 'mFxtstdc'.
       78  78-CICS-tstdctl-internal    value 'mFxtstdi'.
       78  78-CICS-start-data-write    value 'mFxicwri'.
       78  78-CICS-start-data-retrieve value 'mFxicret'.
       78  78-CICS-start-data-cancel   value 'mFxiccan'.
       78  78-CICS-page-queue-delete   value 'mFxpgqdl'.
       78  78-CICS-page-queue-write    value 'mFxpgqwr'.
       78  78-CICS-tstd-syncpoint      value 'mFxtstds'.
       78 78-CICS-write-protected-ice  value 'mFxicpwr'.
       78 78-CICS-delete-protected-ice value 'mFxicpdl'.
       78  78-CICS-PLI-td-queue-write  value 'mFPLITDQ'.
      $END

       78  78-CICS-region-message-service value 'dfh0rmsg'.
       78  78-CICS-message-service     value 'dfhemesg'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-mesg-service-entry  value 'mFdfh_mesg_srv'.
      $ELSE
       78  78-CICS-mesg-service-entry  value 'mFxmsgsr'.
      $END

       78  78-CICS-FS-transformers     value 'dfhexfpf'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-file-xfp            value 'mFdfh_file_xfp'.
       78  78-CICS-tstd-xfp            value 'mFdfh_tstd_xfp'.
       78  78-CICS-prog-xfp            value 'mFdfh_prog_xfp'.
       78  78-CICS-schd-xfp            value 'mFdfh_schd_xfp'.
       78  78-CICS-sync-xfp            value 'mFdfh_sync_xfp'.
      $ELSE
       78  78-CICS-file-xfp            value 'mFxfilex'.
       78  78-CICS-tstd-xfp            value 'mFxtstdx'.
       78  78-CICS-prog-xfp            value 'mFxprogx'.
       78  78-CICS-schd-xfp            value 'mFxschdx'.
       78  78-CICS-sync-xfp            value 'mFxsyncx'.
      $END

       78  78-CICS-JRNL-SUPPORT        value 'dfhejrnl'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-jrnlctl-write       value 'mFdfh_jrnl_write'.
       78  78-CICS-jrnlctl-wait        value 'mFdfh_jrnl_wait'.
       78  78-CICS-jrnlctl-internal    value 'mFdfh_jrnl_internal'.
      $ELSE
       78  78-CICS-jrnlctl-write       value 'mFxjrnwr'.
       78  78-CICS-jrnlctl-wait        value 'mFxjrnwt'.
       78  78-CICS-jrnlctl-internal    value 'mFxjrnin'.
      $END

       78  78-CICS-SYNCPOINT           value 'dfhesync'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-syncpoint-api       value 'mFdfh_syncpoint'.
       78  78-CICS-IMS-abend-sync      value 'mFdfh_ims_abend'.
       78  78-CICS-PLI-tran-backout    value 'mFdfh_PLI_backout'.
      $ELSE
       78  78-CICS-syncpoint-api       value 'mFxsyncp'.
       78  78-CICS-IMS-abend-sync      value 'mFxsynct'.
       78  78-CICS-PLI-tran-backout    value 'mFPLIDTB'.
      $END

       78  78-CICS-ABEND-MESSAGE       value 'dfhecerr'.

       78  78-CICS-ICE-SUPPORT         value 'dfhesche'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-intrvl-ctl-api      value 'mFdfh_intrvl_ctl'.
      $ELSE
       78  78-CICS-intrvl-ctl-api      value 'mFxicpap'.
      $END

       78  78-CICS-USER-PROLOGUE       value 'dfheuser'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-user-interface      value 'mFdfh_user_init'.
       78  78-CICS-user-swap-atp       value 'mFdfh_swap_atp'.
       78  78-CICS-user-link-exit      value 'mFdfh_link_exit'.
       78  78-CICS-user-call-exit      value 'mFdfh_call_exit'.
       78  78-CICS-vector-control      value 'mFdfh_vector_ctl'.
nf-099 78  78-CICS-vector-control-api  value 'mFdfh_vector_ctl_api'.
mjwx76 78  78-CICS-curr-WS-address     value 'mFdfh_WS_address'.
nf-141 78  78-CICS-inq-set-expopup     value 'mFdfh_inq_set_expopup'.
026930 78  78-CICS-user-rts-err        value 'mFdfh_user_rts_error'.
      $ELSE
       78  78-CICS-user-interface      value 'mFxuserx'.
       78  78-CICS-user-swap-atp       value 'mFxswapx'.
       78  78-CICS-user-link-exit      value 'mFxlinkx'.
       78  78-CICS-user-call-exit      value 'mFxcallx'.
       78  78-CICS-vector-control      value 'mFxvectc'.
nf-099 78  78-CICS-vector-control-api  value 'mFxvecta'.
mjwx76 78  78-CICS-curr-WS-address     value 'mFxwsadr'.
nf-141 78  78-CICS-inq-set-expopup     value 'mFxispup'.
026930 78  78-CICS-user-rts-err        value 'mFxrterr'.
      $END

       78  78-CICS-DATE-ROUTINES       value 'dfhedate'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-asktime-api         value 'mFdfh_asktime'.
       78  78-CICS-formattime-api      value 'mFdfh_formattime'.
      $ELSE
       78  78-CICS-asktime-api         value 'mFxasktm'.
       78  78-CICS-formattime-api      value 'mFxfortm'.
      $END

       78  78-CICS-SYSTEM-PROG-SUPPORT value 'dfhesysp'.
      $IF OSMCO = 'UNIX'
       78  78-CICS-sysprog-ctl         value 'mFdfh_sys_prog'.
spool1 78  78-CICS-spool-syncpoint     value 'mFdfh_spool_syncpoint'.
      $ELSE
       78  78-CICS-sysprog-ctl         value 'mFxsyspg'.
spool1 78  78-CICS-spool-syncpoint     value 'mFxsplsy'.
      $END

      ***--------------------------------------------------------------*

       78  78-CICS-SHUTDOWN-SIGNALS    value 'dfheshut'.

       78  78-CICS-UNIX-INITIALIZE     value 'dfheini1'.
       78  78-CICS-OS2-INITIALIZE      value 'dfheini2'.

       78  78-CICS-UNIX-TERMINATE      value 'dfhetrm1'.
       78  78-CICS-OS2-TERMINATE       value 'dfhetrm2'.


       78  78-CICS-DLI-SUPPORT         value 'COBOLDLI'.

       78  78-CICS-TERMINAL-EMULATION  value 'dfht3270'.
       78  78-CICS-SERVER              value 'dfhecics'.
tc-sta$if 78-static defined
tc-sta 78  78-CICS-encrypt-decrypt     value '__dfhucryp'.
tc-sta$else
       78  78-CICS-encrypt-decrypt     value 'dfhucryp'.
tc-sta$end
       78  78-CICS-new-encrypt-decrypt value 'dfhucryu'.

       78  78-flush-trace-buffer       value 'mFftrace'.
       78  78-3270-screen-mode-user-exit value 'dfhu3270'.

pw-098 78  78-MQ-XAT-AutoInstall-Name  value 'DFHEIBMQ'.

      ***--------------------------------------------------------------*

       78  78-CICS-DEV-SCREEN-HANDLER  value 'dfh0scrn'.
       78  78-CICS-DEV-HELP            value 'dfh0help'.
       78  78-CICS-DEV-USER-EDITOR     value 'dfhmedit'.
       78  78-CICS-DEV-MF-EDITOR       value 'dfhmwbed'.
       78  78-CICS-DEV-CHECK           value 'dfhmchck'.
       78  78-CICS-DEV-ANIMATE         value 'dfhmanim'.
       78  78-CICS-DEV-COMPILE         value 'dfhmcomp'.
       78  78-CICS-DEV-RUN             value 'dfhmrun'.
       78  78-CICS-DEV-RDT-MAINT       value 'dfhmparm'.
       78  78-CICS-DEV-SDF-MAINT       value 'dfhmsdf'.
       78  78-CICS-DEV-SDF-DELETE      value 'dfhsdelt'.
       78  78-CICS-DEV-SET-CONFIG      value 'dfhminst'.
       78  78-CICS-DEV-CONFIG-DATA     value 'dfhmcnfg'.
       78  78-CICS-MIGRATION           value 'dfhmmigr'.
       78  78-CICS-DEV-MIGUTIL         value 'dfhmigr'.
       78  78-CICS-DEV-MIGEDIT         value 'dfhmed1'.
       78  78-CICS-DEV-MIGRUN          value 'dfhmru1'.
       78  78-CICS-DEV-CMD-LINE        value 'dfhmgclt'.

       78  78-CICS-DEV-FCT-IO          value 'dfhpfcio'.
       78  78-CICS-DEV-PCT-IO          value 'dfhppcio'.
       78  78-CICS-DEV-TCT-IO          value 'dfhptcio'.
       78  78-CICS-DEV-DCT-IO          value 'dfhpdcio'.
       78  78-CICS-DEV-JCT-IO          value 'dfhpjcio'.
       78  78-CICS-DEV-SDF-IO          value 'dfhsmsio'.
       78  78-CICS-DEV-SCR-IO          value 'dfhsscio'.

nf-114$if UNIX defined
sc-923*78 78-srv-handler-resp-build    value 'mFdfh_srv_resp_build'.
sc-923 78 78-srv-handler-resp-http     value 'mFdfh_srv_resp_http'.
sc-923 78 78-srv-handler-resp-bin      value 'mFdfh_srv_resp_bin'.
sc-923 78 78-srv-handler-resp-mq       value 'mFdfh_srv_resp_mq'.
nx-091 78 78-srv-handler-resp-custom   value 'mFdfh_srv_resp_custom'.
sc-923 78 78-srv-syncpoint-api         value 'mFdfh_sync_srv'.
sc-904 78 78-srv-handler-lookup-req    value 'mFdfh_srv_lookup_req'.
sc-904 78 78-srv-handler-service-info  value 'mFdfh_srv_rec_info'.
sc-904 78 78-srv-handler-trace-info    value 'mFdfh_srv_rec_trace'.
sc-916 78 78-srv-handler-address       value 'mFdfh_srv_address'.
nx-043*nx-038 78 78-srv-handler-deploy-info   value 'mFdfh_srv_dep_info'.
nx-046*nx-038 78 78-srv-handler-appl-info     value 'mFdfh_srv_appl_info'.
nx-046 78 78-srv-handler-service-details value 'mFdfh_srv_srv_details'.
nx-055 78 78-srv-handler-locate-exit   value 'mFdfh_srv_locate_exit'.
jes-14*nx-066 78 78-srv-handler-console-msg   value 'mFdfh_srv_console_msg'.
nx-140 78 78-srv-handler-syncpoint     value 'mFdfh_srv_syncpoint'.
nx-174 78 78-srv-make-transient-dca    value 'mFdfh_mk_transient_dca'.
nf-114 78 78-HTTP-response-builder     value 'mFdfh_HTTP_resp_build'.
n44235 78 78-crtpCloseClient           value 'mFdfh_crtpCloseClient'.
pw-044 78 78-crtpReset                 value 'mFdfh_crtpReset'.
nf-114$else
sc-923*78 78-srv-handler-resp-build    value 'mFHTSPrb'.
sc-923 78 78-srv-handler-resp-http     value 'mFHTSPrH'.
sc-923 78 78-srv-handler-resp-bin      value 'mFHTSPrB'.
sc-923 78 78-srv-handler-resp-mq       value 'mFHTSPrM'.
nx-091 78 78-srv-handler-resp-custom   value 'mFHTSPrC'.
sc-923 78 78-srv-syncpoint-api         value 'mFxsyncS'.
sc-904 78 78-srv-handler-lookup-req    value 'mFHTSLrq'.
sc-904 78 78-srv-handler-service-info  value 'mFHTSRin'.
sc-904 78 78-srv-handler-trace-info    value 'mFHTSRtr'.
sc-916 78 78-srv-handler-address       value 'mFHTSAdr'.
nx-043*nx-038 78 78-srv-handler-deploy-info   value 'mFHTSRdi'.
nx-046 78 78-srv-handler-service-details value 'mFHTSSde'.
nx-038 78 78-srv-handler-appl-info     value 'mFHTSRai'.
nx-055 78 78-srv-handler-locate-exit   value 'mFHTSLex'.
jes-14*nx-066 78 78-srv-handler-console-msg   value 'mFHTSCmg'.
nx-140 78 78-srv-handler-syncpoint     value 'mFHTSSyn'.
nx-174 78 78-srv-make-transient-dca    value 'mFHTSmtd'.
nf-114 78 78-HTTP-response-builder     value 'mFHTTPrb'.
n44235 78 78-crtpCloseClient           value 'mFHcClsC'.
pw-044 78 78-crtpReset                 value 'mFHcRst'.
nf-114$end
jes-02 78  78-es-lock-service          value 'ES_LOCK_MGR'.
nx-213 78 78-tx-fn-begin               value 'mFdfh_srv_tx_begin'.
nx-213 78 78-tx-fn-close               value 'mFdfh_srv_tx_close'.
nx-213 78 78-tx-fn-commit              value 'mFdfh_srv_tx_commit'.
nx-213 78 78-tx-fn-info                value 'mFdfh_srv_tx_info'.
nx-213 78 78-tx-fn-open                value 'mFdfh_srv_tx_open'.
nx-213 78 78-tx-fn-rollback            value 'mFdfh_srv_tx_rollback'.
nx-213 78 78-tx-fn-set-comt-ret        value 'mFdfh_srv_tx_comt_ret'.
nx-213 78 78-tx-fn-set-trans-ctl       value 'mFdfh_srv_tx_tran_ctl'.
nx-213 78 78-tx-fn-set-trans-tmout     value 'mFdfh_srv_tx_tran_tmout'.
nx-217 78 78-tx-fn-associate-rm        value 'mFdfh_srv_tx_assoc_rm'.
x53910 78  78-call-process-interaction value 'ES_GREQ_Interact'.
x53910 78  78-get-IP-addresses         value 'ES_Get_IP_Addr'.
nx-226 78 78-exci-exit-proc            value 'mFdfh_exci_exit_proc'.
nx-226 78 78-exci-exit-proc-pgm        value 'caseexpr'.
nx-226 78 78-exci-rts-error-cleanup    value 'mFdfh_exci_rts_proc'.
x55238 78 78-get-ts-td-fcd-table       value 'mfTsTdFcds'.

537177 78  78-mf-xdispcs               value 'mF_xDispCS'.
      ***--------------------------------------------------------------*
      ***                                                              *
      ***    CCI Transport                                             *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-xport-control-length     value 9.     *> -- length of flow

      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation AID Key ID Numbers for HANDLE AID               *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-AID-key-maximum          value 34.

       78  78-AID-key-is-PF1           value 1.
       78  78-AID-key-is-PF2           value 2.
       78  78-AID-key-is-PF3           value 3.
       78  78-AID-key-is-PF4           value 4.
       78  78-AID-key-is-PF5           value 5.
       78  78-AID-key-is-PF6           value 6.
       78  78-AID-key-is-PF7           value 7.
       78  78-AID-key-is-PF8           value 8.
       78  78-AID-key-is-PF9           value 9.
       78  78-AID-key-is-PF10          value 10.
       78  78-AID-key-is-PF11          value 11.
       78  78-AID-key-is-PF12          value 12.
       78  78-AID-key-is-PF13          value 13.
       78  78-AID-key-is-PF14          value 14.
       78  78-AID-key-is-PF15          value 15.
       78  78-AID-key-is-PF16          value 16.
       78  78-AID-key-is-PF17          value 17.
       78  78-AID-key-is-PF18          value 18.
       78  78-AID-key-is-PF19          value 19.
       78  78-AID-key-is-PF20          value 20.
       78  78-AID-key-is-PF21          value 21.
       78  78-AID-key-is-PF22          value 22.
       78  78-AID-key-is-PF23          value 23.
       78  78-AID-key-is-PF24          value 24.
       78  78-AID-key-is-ENTER         value 25.
       78  78-AID-key-is-CLEAR         value 26.
       78  78-AID-key-is-PA1           value 27.
       78  78-AID-key-is-PA2           value 28.
       78  78-AID-key-is-PA3           value 29.
       78  78-AID-key-is-CLRPARTN      value 30.
       78  78-AID-key-is-OPERID        value 31.
       78  78-AID-key-is-LIGHTPEN      value 32.
       78  78-AID-key-is-TRIGGER       value 33.
       78  78-AID-key-is-ANYKEY        value 34.

      ***--------------------------------------------------------------*

       78  78-aid-PF22-ASCII-value     value x'5B'.
       78  78-aid-PF22-EBCDIC-value    value x'4A'.

      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation EIBRESP Values                                  *
      ***    Keep DFHRESP.INC in sync for PL/I!                        *
      ***                                                              *
      ***--------------------------------------------------------------*

peh455*78  78-EIBRESP-maximum          value 98.
027958*peh455 78  78-EIBRESP-maximum          value 100.
027958 78  78-EIBRESP-maximum          value 117.
       78  78-EIBRESP-max-table        value 78-EIBRESP-maximum + 2.

       78  78-EIBRESP-is-NORMAL        value 0.
       78  78-EIBRESP-is-ERROR         value 1.
       78  78-EIBRESP-is-RDATT         value 2.
       78  78-EIBRESP-is-WRBRK         value 3.
       78  78-EIBRESP-is-EOF           value 4.
050529 78  78-EIBRESP-is-WARNING       value 4.
       78  78-EIBRESP-is-EODS          value 5.
       78  78-EIBRESP-is-EOC           value 6.
       78  78-EIBRESP-is-INBFMH        value 7.
       78  78-EIBRESP-is-ENDINPT       value 8.
       78  78-EIBRESP-is-NONVAL        value 9.
       78  78-EIBRESP-is-NOSTART       value 10.
       78  78-EIBRESP-is-TERMIDERR     value 11.
       78  78-EIBRESP-is-FILENOTFOUND  value 12.
       78  78-EIBRESP-is-NOTFND        value 13.
       78  78-EIBRESP-is-DUPREC        value 14.
       78  78-EIBRESP-is-DUPKEY        value 15.
       78  78-EIBRESP-is-INVREQ        value 16.
       78  78-EIBRESP-is-IOERR         value 17.
       78  78-EIBRESP-is-NOSPACE       value 18.
       78  78-EIBRESP-is-NOTOPEN       value 19.
       78  78-EIBRESP-is-ENDFILE       value 20.
       78  78-EIBRESP-is-ILLOGIC       value 21.
       78  78-EIBRESP-is-LENGERR       value 22.
       78  78-EIBRESP-is-QZERO         value 23.
       78  78-EIBRESP-is-SIGNAL        value 24.
       78  78-EIBRESP-is-QBUSY         value 25.
       78  78-EIBRESP-is-ITEMERR       value 26.
       78  78-EIBRESP-is-PGMIDERR      value 27.
       78  78-EIBRESP-is-TRANSIDERR    value 28.
       78  78-EIBRESP-is-ENDDATA       value 29.
       78  78-EIBRESP-is-INVTSREQ      value 30.
       78  78-EIBRESP-is-EXPIRED       value 31.
       78  78-EIBRESP-is-RETPAGE       value 32.
       78  78-EIBRESP-is-RTEFAIL       value 33.
       78  78-EIBRESP-is-RTESOME       value 34.
       78  78-EIBRESP-is-TSIOERR       value 35.
       78  78-EIBRESP-is-MAPFAIL       value 36.
       78  78-EIBRESP-is-INVERRTERM    value 37.
       78  78-EIBRESP-is-INVMPSZ       value 38.
       78  78-EIBRESP-is-IGREQID       value 39.
       78  78-EIBRESP-is-OVERFLOW      value 40.
       78  78-EIBRESP-is-INVLDC        value 41.
       78  78-EIBRESP-is-NOSTG         value 42.
       78  78-EIBRESP-is-JIDERR        value 43.
       78  78-EIBRESP-is-QIDERR        value 44.
       78  78-EIBRESP-is-NOJBUFSP      value 45.
       78  78-EIBRESP-is-DSSTAT        value 46.
       78  78-EIBRESP-is-SELNERR       value 47.
       78  78-EIBRESP-is-FUNCERR       value 48.
       78  78-EIBRESP-is-UNEXPIN       value 49.
       78  78-EIBRESP-is-NOPASSBKRD    value 50.
       78  78-EIBRESP-is-NOPASSBKWR    value 51.
702177 78  78-EIBRESP-is-SEGIDERR      value 52.
       78  78-EIBRESP-is-SYSIDERR      value 53.
       78  78-EIBRESP-is-ISCINVREQ     value 54.
       78  78-EIBRESP-is-ENQBUSY       value 55.
       78  78-EIBRESP-is-ENVDEFERR     value 56.
       78  78-EIBRESP-is-IGREQCD       value 57.
       78  78-EIBRESP-is-SESSIONERR    value 58.
       78  78-EIBRESP-is-SYSBUSY       value 59.
       78  78-EIBRESP-is-SESSBUSY      value 60.
       78  78-EIBRESP-is-NOTALLOC      value 61.
       78  78-EIBRESP-is-CBIDERR       value 62.
       78  78-EIBRESP-is-INVEXITREQ    value 63.
       78  78-EIBRESP-is-INVPARTNSET   value 64.
       78  78-EIBRESP-is-INVPARTN      value 65.
       78  78-EIBRESP-is-PARTNFAIL     value 66.
       78  78-EIBRESP-is-USERIDERR     value 69.
       78  78-EIBRESP-is-NOTAUTH       value 70.
       78  78-EIBRESP-is-VOLIDERR      value 71.
       78  78-EIBRESP-is-SUPPRESSED    value 72.
       78  78-EIBRESP-is-WRONGSTAT     value 73.
       78  78-EIBRESP-is-NAMEERROR     value 74.
       78  78-EIBRESP-is-RESIDERR      value 75.
       78  78-EIBRESP-is-CCERROR       value 76.
       78  78-EIBRESP-is-MAPERROR      value 77.
       78  78-EIBRESP-is-NOSPOOL       value 80.
       78  78-EIBRESP-is-TERMERR       value 81.
       78  78-EIBRESP-is-ROLLEDBACK    value 82.
       78  78-EIBRESP-is-END           value 83.
       78  78-EIBRESP-is-DISABLED      value 84.
       78  78-EIBRESP-is-ALLOCERR      value 85.
       78  78-EIBRESP-is-STRELERR      value 86.
       78  78-EIBRESP-is-OPENERR       value 87.
       78  78-EIBRESP-is-SPOLBUSY      value 88.
050529 78  78-EIBRESP-is-LINKERR       value 88.
       78  78-EIBRESP-is-SPOLERR       value 89.
       78  78-EIBRESP-is-NODEIDERR     value 90.
       78  78-EIBRESP-is-TASKIDERR     value 91.
       78  78-EIBRESP-is-TCIDERR       value 92.
       78  78-EIBRESP-is-DSNNOTFOUND   value 93.
       78  78-EIBRESP-is-LOADING       value 94.
       78  78-EIBRESP-is-MODELIDERR    value 95.
       78  78-EIBRESP-is-OUTDESCRERR   value 96.
       78  78-EIBRESP-is-PARTNERIDERR  value 97.
       78  78-EIBRESP-is-PROFILEIDERR  value 98.
peh455 78  78-EIBRESP-is-NETNAMERR     value 99.
022703 78  78-EIBRESP-is-NETNAMEIDERR  value 99.
peh455 78  78-EIBRESP-is-LOCKED        value 100.
peh468 78  78-EIBRESP-is-RECORDBUSY    value 101.
peh468 78  78-EIBRESP-is-UOWNOTFOUND   value 102.
peh468 78  78-EIBRESP-is-UOWLNOTFOUND  value 103.
peh468 78  78-EIBRESP-is-LINKABEND     value 104.
peh468 78  78-EIBRESP-is-CHANGED       value 105.
peh468 78  78-EIBRESP-is-PROCESSBUSY   value 106.
peh468 78  78-EIBRESP-is-ACTIVITYBUSY  value 107.
peh468 78  78-EIBRESP-is-PROCESSERR    value 108.
peh468 78  78-EIBRESP-is-ACTIVITYERR   value 109.
peh468 78  78-EIBRESP-is-CONTAINERERR  value 110.
peh468 78  78-EIBRESP-is-EVENTERR      value 111.
peh468 78  78-EIBRESP-is-TOKENERR      value 112.
peh468 78  78-EIBRESP-is-NOTFINISHED   value 113.
peh468 78  78-EIBRESP-is-POOLERR       value 114.
peh468 78  78-EIBRESP-is-TIMERERR      value 115.
peh468 78  78-EIBRESP-is-SYMBOLERR     value 116.
peh468 78  78-EIBRESP-is-TEMPLATERR    value 117.
       78  78-EIBRESP-is-NOTPOSS       value 255.

      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation CVDA Values (for DFHVALUE and API)              *
      ***    These values are now generated by GENCVDA.                *
      ***                                                              *
      ***--------------------------------------------------------------*
       78  78-CVDA-is-IGNORE           value 1.
       78  78-CVDA-is-NOTAPPLIC        value 1.
       78  78-CVDA-is-T7770            value 1.
       78  78-CVDA-is-BDAM             value 2.
       78  78-CVDA-is-IMMEDIATE        value 2.
       78  78-CVDA-is-SYSTEM7          value 2.
       78  78-CVDA-is-EVENTUAL         value 3.
       78  78-CVDA-is-VSAM             value 3.
       78  78-CVDA-is-REMOTE           value 4.
       78  78-CVDA-is-ESDS             value 5.
       78  78-CVDA-is-KSDS             value 6.
       78  78-CVDA-is-RRDS             value 7.
       78  78-CVDA-is-KEYED            value 8.
       78  78-CVDA-is-TCONSOLE         value 8.
       78  78-CVDA-is-NOTKEYED         value 9.
       78  78-CVDA-is-BASE             value 10.
       78  78-CVDA-is-CRITICAL         value 11.
       78  78-CVDA-is-PATH             value 11.
       78  78-CVDA-is-FIXED            value 12.
       78  78-CVDA-is-VARIABLE         value 13.
       78  78-CVDA-is-UNDEFINED        value 14.
       78  78-CVDA-is-NOTSUPPORTED     value 15.
       78  78-CVDA-is-BLOCKED          value 16.
       78  78-CVDA-is-UNBLOCKED        value 17.
       78  78-CVDA-is-OPEN             value 18.
       78  78-CVDA-is-SEQDISK          value 18.
       78  78-CVDA-is-CLOSED           value 19.
       78  78-CVDA-is-OPENING          value 20.
       78  78-CVDA-is-MAGTAPE          value 20.
       78  78-CVDA-is-CLOSING          value 21.
       78  78-CVDA-is-CLOSEREQUEST     value 22.
       78  78-CVDA-is-ENABLED          value 23.
       78  78-CVDA-is-DISABLED         value 24.
       78  78-CVDA-is-CDRDLPRT         value 24.
       78  78-CVDA-is-DISABLING        value 25.
       78  78-CVDA-is-OLD              value 26.
       78  78-CVDA-is-SHARE            value 27.
       78  78-CVDA-is-NEW              value 28.
       78  78-CVDA-is-RECOVERABLE      value 29.
       78  78-CVDA-is-NOTRECOVABLE     value 30.
       78  78-CVDA-is-EMPTYREQ         value 31.
       78  78-CVDA-is-NOEMPTYREQ       value 32.
       78  78-CVDA-is-HARDCOPY         value 32.
       78  78-CVDA-is-UNENABLED        value 33.
       78  78-CVDA-is-TWX3335          value 33.
       78  78-CVDA-is-UNENABLING       value 34.
       78  78-CVDA-is-TELETYPE         value 34.
       78  78-CVDA-is-READABLE         value 35.
       78  78-CVDA-is-NOTREADABLE      value 36.
       78  78-CVDA-is-T1050            value 36.
       78  78-CVDA-is-UPDATABLE        value 37.
       78  78-CVDA-is-NOTUPDATABLE     value 38.
       78  78-CVDA-is-BROWSABLE        value 39.
       78  78-CVDA-is-NOTBROWSABLE     value 40.
       78  78-CVDA-is-T2740            value 40.
       78  78-CVDA-is-ADDABLE          value 41.
       78  78-CVDA-is-NOTADDABLE       value 42.
       78  78-CVDA-is-T2741COR         value 42.
       78  78-CVDA-is-DELETABLE        value 43.
       78  78-CVDA-is-T2741BCD         value 43.
       78  78-CVDA-is-NOTDELETABLE     value 44.
       78  78-CVDA-is-HEX              value 45.
       78  78-CVDA-is-DEC              value 46.
       78  78-CVDA-is-BLK              value 47.
       78  78-CVDA-is-EXCTL            value 48.
       78  78-CVDA-is-NOEXCTL          value 49.
       78  78-CVDA-is-ALTERABLE        value 52.
       78  78-CVDA-is-NOTALTERABLE     value 53.
       78  78-CVDA-is-LOG              value 54.
       78  78-CVDA-is-NOLOG            value 55.
       78  78-CVDA-is-CTRLABLE         value 56.
       78  78-CVDA-is-NOTCTRLABLE      value 57.
       78  78-CVDA-is-SNA              value 60.
       78  78-CVDA-is-VTAM             value 60.
       78  78-CVDA-is-BSAM             value 61.
       78  78-CVDA-is-BTAM-ES          value 62.
       78  78-CVDA-is-BTAM             value 62.
       78  78-CVDA-is-BGAM             value 63.
       78  78-CVDA-is-TCAM             value 64.
       78  78-CVDA-is-VIDEOTERM        value 64.
       78  78-CVDA-is-TCAMSNA          value 65.
       78  78-CVDA-is-T2260L           value 65.
       78  78-CVDA-is-CONSOLE          value 66.
       78  78-CVDA-is-CREATE           value 67.
       78  78-CVDA-is-NOCREATE         value 68.
       78  78-CVDA-is-ACQUIRED         value 69.
       78  78-CVDA-is-RELEASED         value 70.
       78  78-CVDA-is-ACQUIRING        value 71.
       78  78-CVDA-is-COLDACQ          value 72.
       78  78-CVDA-is-T2260R           value 72.
       78  78-CVDA-is-INSERVICE        value 73.
       78  78-CVDA-is-OUTSERVICE       value 74.
       78  78-CVDA-is-T1053            value 74.
       78  78-CVDA-is-ATI              value 75.
       78  78-CVDA-is-NOATI            value 76.
       78  78-CVDA-is-T2265            value 76.
       78  78-CVDA-is-TTI              value 77.
       78  78-CVDA-is-NOTTI            value 78.
       78  78-CVDA-is-PAGEABLE         value 79.
       78  78-CVDA-is-AUTOPAGE         value 80.
       78  78-CVDA-is-AUTOPAGEABLE     value 80.
       78  78-CVDA-is-TTCAM            value 80.
       78  78-CVDA-is-ALLOCATED        value 81.
       78  78-CVDA-is-CONFFREE         value 82.
       78  78-CVDA-is-CONFRECEIVE      value 83.
       78  78-CVDA-is-CONFSEND         value 84.
       78  78-CVDA-is-FREE             value 85.
       78  78-CVDA-is-PENDFREE         value 86.
       78  78-CVDA-is-PENDRECEIVE      value 87.
       78  78-CVDA-is-RECEIVE          value 88.
       78  78-CVDA-is-ROLLBACK         value 89.
       78  78-CVDA-is-SEND             value 90.
       78  78-CVDA-is-SYNCFREE         value 91.
       78  78-CVDA-is-SYNCRECEIVE      value 92.
       78  78-CVDA-is-SYNCSEND         value 93.
       78  78-CVDA-is-FREEING          value 94.
       78  78-CVDA-is-AVAILABLE        value 95.
       78  78-CVDA-is-OBTAINING        value 96.
       78  78-CVDA-is-NOTTABLE         value 100.
       78  78-CVDA-is-CICSTABLE        value 101.
       78  78-CVDA-is-USERTABLE        value 102.
       78  78-CVDA-is-REMTABLE         value 103.
       78  78-CVDA-is-PRIMARY          value 110.
       78  78-CVDA-is-TAKEOVER         value 111.
       78  78-CVDA-is-IRC              value 121.
       78  78-CVDA-is-INDIRECT         value 122.
       78  78-CVDA-is-XM               value 123.
       78  78-CVDA-is-APPC             value 124.
       78  78-CVDA-is-LU61             value 125.
       78  78-CVDA-is-PENDING          value 126.
       78  78-CVDA-is-NOTPENDING       value 127.
       78  78-CVDA-is-BISYNCH          value 128.
       78  78-CVDA-is-T2770            value 130.
       78  78-CVDA-is-T2780            value 132.
       78  78-CVDA-is-T3780            value 133.
       78  78-CVDA-is-T2980            value 134.
       78  78-CVDA-is-T3735            value 136.
       78  78-CVDA-is-T3740            value 137.
       78  78-CVDA-is-T3600BI          value 138.
       78  78-CVDA-is-XOK              value 143.
       78  78-CVDA-is-XNOTDONE         value 144.
       78  78-CVDA-is-T3277R           value 145.
       78  78-CVDA-is-T3275R           value 146.
       78  78-CVDA-is-JAVA             value 147.
       78  78-CVDA-is-T3284R           value 147.
       78  78-CVDA-is-CPLUSPLUS        value 148.
       78  78-CVDA-is-T3286R           value 148.
       78  78-CVDA-is-C                value 149.
       78  78-CVDA-is-ASSEMBLER        value 150.
       78  78-CVDA-is-COBOL            value 151.
       78  78-CVDA-is-PLI              value 152.
       78  78-CVDA-is-PL1              value 152.
       78  78-CVDA-is-RPG              value 153.
       78  78-CVDA-is-T3277L           value 153.
       78  78-CVDA-is-PROGRAM          value 154.
       78  78-CVDA-is-MAP              value 155.
       78  78-CVDA-is-MAPSET           value 155.
       78  78-CVDA-is-T3284L           value 155.
       78  78-CVDA-is-PARTITIONSET     value 156.
       78  78-CVDA-is-T3286L           value 156.
       78  78-CVDA-is-PROFILE          value 157.
       78  78-CVDA-is-ANY              value 158.
       78  78-CVDA-is-BELOW            value 159.
       78  78-CVDA-is-PURGEABLE        value 160.
       78  78-CVDA-is-BIPROG           value 160.
       78  78-CVDA-is-NOTPURGEABLE     value 161.
       78  78-CVDA-is-SYSTEM3          value 161.
       78  78-CVDA-is-OLDCOPY          value 162.
       78  78-CVDA-is-HOLD             value 163.
       78  78-CVDA-is-NOHOLD           value 164.
       78  78-CVDA-is-SYS370           value 164.
       78  78-CVDA-is-LPA              value 165.
       78  78-CVDA-is-NOTLPA           value 166.
       78  78-CVDA-is-SYS7BSCA         value 166.
       78  78-CVDA-is-NEWCOPY          value 167.
       78  78-CVDA-is-PHASEIN          value 168.
       78  78-CVDA-is-ALLCONN          value 169.
       78  78-CVDA-is-AUTOCONN         value 170.
       78  78-CVDA-is-NONAUTOCONN      value 171.
       78  78-CVDA-is-GOINGOUT         value 172.
       78  78-CVDA-is-SHARED           value 173.
       78  78-CVDA-is-PRIVATE          value 174.
       78  78-CVDA-is-SPRSTRACE        value 175.
       78  78-CVDA-is-STANTRACE        value 176.
       78  78-CVDA-is-SDLC             value 176.
       78  78-CVDA-is-SPECTRACE        value 177.
       78  78-CVDA-is-T3601            value 177.
       78  78-CVDA-is-DYNAMIC          value 178.
       78  78-CVDA-is-T3614            value 178.
       78  78-CVDA-is-STATIC           value 179.
       78  78-CVDA-is-STARTUP          value 180.
       78  78-CVDA-is-T3790            value 180.
       78  78-CVDA-is-ACTIVE           value 181.
       78  78-CVDA-is-T3790UP          value 181.
       78  78-CVDA-is-FIRSTQUIESCE     value 182.
       78  78-CVDA-is-T3790SCSP        value 182.
       78  78-CVDA-is-FINALQUIESCE     value 183.
       78  78-CVDA-is-SYSDUMP          value 184.
       78  78-CVDA-is-T3650PIPE        value 184.
       78  78-CVDA-is-NOSYSDUMP        value 185.
       78  78-CVDA-is-T3653HOST        value 185.
       78  78-CVDA-is-TRANDUMP         value 186.
       78  78-CVDA-is-T3650ATT         value 186.
       78  78-CVDA-is-NOTRANDUMP       value 187.
       78  78-CVDA-is-T3650USER        value 187.
       78  78-CVDA-is-SWITCH           value 188.
       78  78-CVDA-is-MODEANY          value 189.
       78  78-CVDA-is-CONTNLU          value 189.
       78  78-CVDA-is-MODE24           value 190.
       78  78-CVDA-is-INTACTLU         value 190.
       78  78-CVDA-is-MODE31           value 191.
       78  78-CVDA-is-BATCHLU          value 191.
       78  78-CVDA-is-BACKOUT          value 192.
       78  78-CVDA-is-LUTYPE6          value 192.
       78  78-CVDA-is-NOBACKOUT        value 193.
       78  78-CVDA-is-LUTYPE4          value 193.
       78  78-CVDA-is-EXTSECURITY      value 194.
       78  78-CVDA-is-CICSSECURITY     value 195.
       78  78-CVDA-is-CICSECURITY      value 195.
       78  78-CVDA-is-NOSECURITY       value 196.
       78  78-CVDA-is-ALTERNATE        value 197.
       78  78-CVDA-is-DEFAULT          value 198.
       78  78-CVDA-is-OFF              value 200.
       78  78-CVDA-is-ON               value 201.
       78  78-CVDA-is-RESSECNO         value 202.
       78  78-CVDA-is-RESSECINT        value 203.
       78  78-CVDA-is-RESSECEXT        value 204.
       78  78-CVDA-is-RESSECYES        value 204.
       78  78-CVDA-is-CMDSECNO         value 205.
       78  78-CVDA-is-CMDSECEXT        value 207.
       78  78-CVDA-is-CMDSECYES        value 207.
       78  78-CVDA-is-COMMIT           value 208.
       78  78-CVDA-is-RESSYS           value 208.
       78  78-CVDA-is-READBACK         value 209.
       78  78-CVDA-is-ISCMMCONV        value 209.
       78  78-CVDA-is-EMPTY            value 210.
       78  78-CVDA-is-LUCMODGRP        value 210.
       78  78-CVDA-is-NOTEMPTY         value 211.
       78  78-CVDA-is-LUCSESS          value 211.
       78  78-CVDA-is-FULL             value 212.
       78  78-CVDA-is-TERMINAL         value 213.
       78  78-CVDA-is-NOTERMINAL       value 214.
       78  78-CVDA-is-PHYSICAL         value 215.
       78  78-CVDA-is-LOGICAL          value 216.
       78  78-CVDA-is-EXTRA            value 221.
       78  78-CVDA-is-INTRA            value 222.
       78  78-CVDA-is-NOCTL            value 223.
       78  78-CVDA-is-ASACTL           value 224.
       78  78-CVDA-is-SWITCHING        value 225.
       78  78-CVDA-is-INPUT            value 226.
       78  78-CVDA-is-OUTPUT           value 227.
       78  78-CVDA-is-DISPATCHABLE     value 228.
       78  78-CVDA-is-RUNNING          value 229.
       78  78-CVDA-is-SUSPENDED        value 231.
       78  78-CVDA-is-TASK             value 233.
       78  78-CVDA-is-TERM             value 234.
       78  78-CVDA-is-DEST             value 235.
       78  78-CVDA-is-PURGE            value 236.
       78  78-CVDA-is-FORCEPURGE       value 237.
       78  78-CVDA-is-FILE             value 238.
       78  78-CVDA-is-TCLASS           value 239.
       78  78-CVDA-is-TIME             value 240.
       78  78-CVDA-is-MCHCTL           value 241.
       78  78-CVDA-is-PRESETSEC        value 242.
       78  78-CVDA-is-NOPRESETSEC      value 243.
       78  78-CVDA-is-SIGNEDON         value 244.
       78  78-CVDA-is-SIGNEDOFF        value 245.
       78  78-CVDA-is-LUW              value 246.
       78  78-CVDA-is-UOW              value 246.
       78  78-CVDA-is-AUXILIARY        value 247.
       78  78-CVDA-is-MAIN             value 248.
       78  78-CVDA-is-TAPE1            value 250.
       78  78-CVDA-is-TAPE2            value 251.
       78  78-CVDA-is-DISK1            value 252.
       78  78-CVDA-is-DISK2            value 253.
       78  78-CVDA-is-DISK2PAUSE       value 254.
       78  78-CVDA-is-SMF              value 255.
       78  78-CVDA-is-OPENINPUT        value 256.
       78  78-CVDA-is-OPENOUTPUT       value 257.
       78  78-CVDA-is-READY            value 258.
       78  78-CVDA-is-NOTREADY         value 259.
       78  78-CVDA-is-CURRENT          value 260.
       78  78-CVDA-is-CLOSELEAVE       value 261.
       78  78-CVDA-is-AUTOARCH         value 262.
       78  78-CVDA-is-NOAUTOARCH       value 263.
       78  78-CVDA-is-REVERTED         value 264.
       78  78-CVDA-is-ADVANCE          value 265.
       78  78-CVDA-is-COLDSTART        value 266.
       78  78-CVDA-is-WARMSTART        value 267.
       78  78-CVDA-is-EMERGENCY        value 268.
       78  78-CVDA-is-LOGTERM          value 269.
       78  78-CVDA-is-FINPUT           value 270.
       78  78-CVDA-is-FOUTPUT          value 271.
       78  78-CVDA-is-FOPEN            value 272.
       78  78-CVDA-is-FCLOSE           value 273.
       78  78-CVDA-is-OK               value 274.
       78  78-CVDA-is-NOWRITE          value 275.
       78  78-CVDA-is-READONLY         value 275.
       78  78-CVDA-is-REMOVE           value 276.
       78  78-CVDA-is-RECOVERED        value 277.
       78  78-CVDA-is-AINIT            value 282.
       78  78-CVDA-is-BINIT            value 283.
       78  78-CVDA-is-AUTOINIT         value 284.
       78  78-CVDA-is-NOSWITCH         value 285.
       78  78-CVDA-is-SWITCHNEXT       value 286.
       78  78-CVDA-is-SWITCHALL        value 287.
       78  78-CVDA-is-SHUTDOWN         value 288.
       78  78-CVDA-is-NOSHUTDOWN       value 289.
       78  78-CVDA-is-RESET            value 290.
       78  78-CVDA-is-ADD              value 291.
       78  78-CVDA-is-DELETE           value 292.
       78  78-CVDA-is-INTSTART         value 310.
       78  78-CVDA-is-INTSTOP          value 311.
       78  78-CVDA-is-AUXSTART         value 312.
       78  78-CVDA-is-AUXPAUSE         value 313.
       78  78-CVDA-is-AUXSTOP          value 314.
       78  78-CVDA-is-GTFSTART         value 317.
       78  78-CVDA-is-GTFSTOP          value 318.
       78  78-CVDA-is-SYSTEMON         value 319.
       78  78-CVDA-is-SYSTEMOFF        value 320.
       78  78-CVDA-is-USERON           value 321.
       78  78-CVDA-is-USEROFF          value 322.
       78  78-CVDA-is-SINGLEON         value 323.
       78  78-CVDA-is-SINGLEOFF        value 324.
       78  78-CVDA-is-PERF             value 330.
       78  78-CVDA-is-NOPERF           value 331.
       78  78-CVDA-is-EXCEPT           value 332.
       78  78-CVDA-is-NOEXCEPT         value 333.
       78  78-CVDA-is-EVENT            value 334.
       78  78-CVDA-is-NOEVENT          value 335.
       78  78-CVDA-is-WAIT             value 340.
       78  78-CVDA-is-NOWAIT           value 341.
       78  78-CVDA-is-FORCE            value 342.
       78  78-CVDA-is-FORCEUOW         value 342.
       78  78-CVDA-is-CLOSEFAILED      value 349.
       78  78-CVDA-is-IMMCLOSE         value 350.
       78  78-CVDA-is-FORCECLOSE       value 351.
       78  78-CVDA-is-IMMCLOSING       value 352.
       78  78-CVDA-is-FORCECLOSING     value 353.
       78  78-CVDA-is-FWDRECOVABLE     value 354.
       78  78-CVDA-is-UNDETERMINED     value 355.
       78  78-CVDA-is-NORMALBKOUT      value 356.
       78  78-CVDA-is-FAILEDBKOUT      value 357.
       78  78-CVDA-is-FAILINGBKOUT     value 358.
       78  78-CVDA-is-INVALID          value 359.
       78  78-CVDA-is-VALID            value 360.
       78  78-CVDA-is-NOTFWDRCVBLE     value 361.
       78  78-CVDA-is-EXITTRACE        value 362.
       78  78-CVDA-is-NOEXITTRACE      value 363.
       78  78-CVDA-is-ZCPTRACE         value 364.
       78  78-CVDA-is-NOZCPTRACE       value 365.
       78  78-CVDA-is-TCEXITALL        value 366.
       78  78-CVDA-is-TCEXITSYSTEM     value 367.
       78  78-CVDA-is-TCEXITNONE       value 368.
       78  78-CVDA-is-TCEXITALLOFF     value 369.
       78  78-CVDA-is-CEDF             value 370.
       78  78-CVDA-is-MODEL            value 370.
       78  78-CVDA-is-NOCEDF           value 371.
       78  78-CVDA-is-SURROGATE        value 371.
       78  78-CVDA-is-SESSION          value 372.
       78  78-CVDA-is-APPCSINGLE       value 373.
       78  78-CVDA-is-APPCPARALLEL     value 374.
       78  78-CVDA-is-COBOLII          value 375.
       78  78-CVDA-is-NOTINIT          value 376.
       78  78-CVDA-is-LE370            value 377.
       78  78-CVDA-is-INACTIVE         value 378.
       78  78-CVDA-is-CICSDATAKEY      value 379.
       78  78-CVDA-is-USERDATAKEY      value 380.
       78  78-CVDA-is-CICSEXECKEY      value 381.
       78  78-CVDA-is-USEREXECKEY      value 382.
       78  78-CVDA-is-DPLSUBSET        value 383.
       78  78-CVDA-is-FULLAPI          value 384.
       78  78-CVDA-is-FMHPARM          value 385.
       78  78-CVDA-is-NOFMHPARM        value 386.
       78  78-CVDA-is-OBOPERID         value 387.
       78  78-CVDA-is-NOOBOPERID       value 388.
       78  78-CVDA-is-APLKYBD          value 391.
       78  78-CVDA-is-NOAPLKYBD        value 392.
       78  78-CVDA-is-APLTEXT          value 393.
       78  78-CVDA-is-NOAPLTEXT        value 394.
       78  78-CVDA-is-AUDALARM         value 395.
       78  78-CVDA-is-NOAUDALARM       value 396.
       78  78-CVDA-is-BACKTRANS        value 397.
       78  78-CVDA-is-NOBACKTRANS      value 398.
       78  78-CVDA-is-COLOR            value 399.
       78  78-CVDA-is-NOCOLOR          value 400.
       78  78-CVDA-is-COPY             value 401.
       78  78-CVDA-is-NOCOPY           value 402.
       78  78-CVDA-is-DUALCASE         value 403.
       78  78-CVDA-is-NODUALCASE       value 404.
       78  78-CVDA-is-EXTENDEDDS       value 405.
       78  78-CVDA-is-NOEXTENDEDDS     value 406.
       78  78-CVDA-is-FORMFEED         value 407.
       78  78-CVDA-is-NOFORMFEED       value 408.
       78  78-CVDA-is-HFORM            value 409.
       78  78-CVDA-is-NOHFORM          value 410.
       78  78-CVDA-is-VFORM            value 411.
       78  78-CVDA-is-NOVFORM          value 412.
       78  78-CVDA-is-HILIGHT          value 413.
       78  78-CVDA-is-NOHILIGHT        value 414.
       78  78-CVDA-is-KATAKANA         value 415.
       78  78-CVDA-is-NOKATAKANA       value 416.
       78  78-CVDA-is-LIGHTPEN         value 417.
       78  78-CVDA-is-NOLIGHTPEN       value 418.
       78  78-CVDA-is-MSRCONTROL       value 419.
       78  78-CVDA-is-NOMSRCONTROL     value 420.
       78  78-CVDA-is-OBFORMAT         value 421.
       78  78-CVDA-is-NOOBFORMAT       value 422.
       78  78-CVDA-is-OUTLINE          value 423.
       78  78-CVDA-is-NOOUTLINE        value 424.
       78  78-CVDA-is-PARTITIONS       value 425.
       78  78-CVDA-is-NOPARTITIONS     value 426.
       78  78-CVDA-is-PRINTADAPT       value 427.
       78  78-CVDA-is-NOPRINTADAPT     value 428.
       78  78-CVDA-is-PROGSYMBOL       value 429.
       78  78-CVDA-is-NOPROGSYMBOL     value 430.
       78  78-CVDA-is-ALLQUERY         value 431.
       78  78-CVDA-is-NOQUERY          value 432.
       78  78-CVDA-is-COLDQUERY        value 433.
       78  78-CVDA-is-SOSI             value 434.
       78  78-CVDA-is-NOSOSI           value 435.
       78  78-CVDA-is-TEXTKYBD         value 436.
       78  78-CVDA-is-NOTEXTKYBD       value 437.
       78  78-CVDA-is-TEXTPRINT        value 438.
       78  78-CVDA-is-NOTEXTPRINT      value 439.
       78  78-CVDA-is-VALIDATION       value 440.
       78  78-CVDA-is-NOVALIDATION     value 441.
       78  78-CVDA-is-RELREQ           value 442.
       78  78-CVDA-is-NORELREQ         value 443.
       78  78-CVDA-is-DISCREQ          value 444.
       78  78-CVDA-is-NODISCREQ        value 445.
       78  78-CVDA-is-ALTPRTCOPY       value 446.
       78  78-CVDA-is-NOALTPRTCOPY     value 447.
       78  78-CVDA-is-PRTCOPY          value 448.
       78  78-CVDA-is-NOPRTCOPY        value 449.
       78  78-CVDA-is-UCTRAN           value 450.
       78  78-CVDA-is-NOUCTRAN         value 451.
       78  78-CVDA-is-TRANIDONLY       value 452.
       78  78-CVDA-is-NEWSESSION       value 485.
       78  78-CVDA-is-OLDSESSION       value 486.
       78  78-CVDA-is-NOSTSN           value 487.
       78  78-CVDA-is-STSNSET          value 488.
       78  78-CVDA-is-STSNTEST         value 489.
       78  78-CVDA-is-EB               value 490.
       78  78-CVDA-is-CD               value 491.
       78  78-CVDA-is-MORE             value 492.
       78  78-CVDA-is-LIC              value 493.
       78  78-CVDA-is-RU               value 494.
       78  78-CVDA-is-NOTCDEB          value 495.
       78  78-CVDA-is-NONE             value 496.
       78  78-CVDA-is-DEFRESP1         value 497.
       78  78-CVDA-is-DEFRESP2         value 498.
       78  78-CVDA-is-DEFRESP3         value 499.
       78  78-CVDA-is-NOALARM          value 500.
       78  78-CVDA-is-ALARM            value 501.
       78  78-CVDA-is-FMH              value 502.
       78  78-CVDA-is-NOFMH            value 503.
       78  78-CVDA-is-PROTECTED        value 504.
       78  78-CVDA-is-UNPROTECTED      value 505.
       78  78-CVDA-is-MDT              value 506.
       78  78-CVDA-is-NOMDT            value 507.
       78  78-CVDA-is-DATA             value 508.
       78  78-CVDA-is-STSN             value 509.
       78  78-CVDA-is-BEGINSESSION     value 510.
       78  78-CVDA-is-TIMEOUT          value 511.
       78  78-CVDA-is-INSTALLFAIL      value 512.
       78  78-CVDA-is-DISCARDFAIL      value 513.
       78  78-CVDA-is-SETFAIL          value 514.
       78  78-CVDA-is-ACQFAIL          value 515.
       78  78-CVDA-is-SESSIONLOST      value 516.
       78  78-CVDA-is-SESSIONFAIL      value 517.
       78  78-CVDA-is-CONVIDLE         value 518.
       78  78-CVDA-is-ADDFAIL          value 519.
       78  78-CVDA-is-DELETEFAIL       value 520.
       78  78-CVDA-is-UNSOLDATA        value 521.
       78  78-CVDA-is-NORMALRESP       value 522.
       78  78-CVDA-is-EXCEPTRESP       value 523.
       78  78-CVDA-is-ATTENTION        value 524.
       78  78-CVDA-is-LUSTAT           value 525.
       78  78-CVDA-is-CANCEL           value 526.
       78  78-CVDA-is-RTR              value 527.
       78  78-CVDA-is-DEFRESP1OR2      value 528.
       78  78-CVDA-is-POSITIVE         value 529.
       78  78-CVDA-is-NEGATIVE         value 530.
       78  78-CVDA-is-NOMSGJRNL        value 531.
       78  78-CVDA-is-INOUT            value 532.
       78  78-CVDA-is-T3278M2          value 533.
       78  78-CVDA-is-T3278M3          value 534.
       78  78-CVDA-is-T3278M4          value 535.
       78  78-CVDA-is-T3278M5          value 536.
       78  78-CVDA-is-T3279M2          value 537.
       78  78-CVDA-is-T3279M3          value 538.
       78  78-CVDA-is-T3279M4          value 539.
       78  78-CVDA-is-T3279M5          value 540.
       78  78-CVDA-is-LUP              value 541.
       78  78-CVDA-is-FORMATTED        value 542.
       78  78-CVDA-is-DATASTREAM       value 543.
       78  78-CVDA-is-LOSE             value 544.
       78  78-CVDA-is-WIN              value 545.
       78  78-CVDA-is-NOTINBOUND       value 546.
       78  78-CVDA-is-INBOUND          value 547.
       78  78-CVDA-is-RELEASING        value 549.
       78  78-CVDA-is-INSTALLED        value 550.
       78  78-CVDA-is-NOTINSTALLED     value 551.
       78  78-CVDA-is-TPS55M2          value 552.
       78  78-CVDA-is-TPS55M3          value 553.
       78  78-CVDA-is-TPS55M4          value 554.
       78  78-CVDA-is-TPS55M5          value 555.
       78  78-CVDA-is-NOCONV           value 556.
       78  78-CVDA-is-PENDSTSN         value 557.
       78  78-CVDA-is-PENDBEGIN        value 558.
       78  78-CVDA-is-APPLICATION      value 559.
       78  78-CVDA-is-PENDDATA         value 560.
       78  78-CVDA-is-PENDSTART        value 561.
       78  78-CVDA-is-PENDRELEASE      value 562.
       78  78-CVDA-is-RELEASE          value 563.
       78  78-CVDA-is-PENDUNSOL        value 564.
       78  78-CVDA-is-PENDPASS         value 565.
       78  78-CVDA-is-CONVERSE         value 600.
       78  78-CVDA-is-NOCONVERSE       value 601.
       78  78-CVDA-is-SYNCPOINT        value 602.
       78  78-CVDA-is-NOSYNCPOINT      value 603.
       78  78-CVDA-is-GMT              value 604.
       78  78-CVDA-is-LOCAL            value 605.
       78  78-CVDA-is-FORMATEDF        value 606.
       78  78-CVDA-is-NOFORMATEDF      value 607.
       78  78-CVDA-is-NOTASKSTART      value 608.
       78  78-CVDA-is-STARTED          value 609.
       78  78-CVDA-is-STOPPED          value 610.
       78  78-CVDA-is-TASKSTART        value 611.
       78  78-CVDA-is-BUSY             value 612.
       78  78-CVDA-is-NOTBUSY          value 613.
       78  78-CVDA-is-SCS              value 614.
       78  78-CVDA-is-DS3270           value 615.
       78  78-CVDA-is-ASCII7           value 616.
       78  78-CVDA-is-ASCII8           value 617.
       78  78-CVDA-is-AUTOSTART        value 618.
       78  78-CVDA-is-INDOUBT          value 620.
       78  78-CVDA-is-INFLIGHT         value 621.
       78  78-CVDA-is-WAITFORGET       value 622.
       78  78-CVDA-is-CONTROLSHUT      value 623.
       78  78-CVDA-is-CANCELLED        value 624.
       78  78-CVDA-is-FIRSTINIT        value 625.
       78  78-CVDA-is-SECONDINIT       value 626.
       78  78-CVDA-is-THIRDINIT        value 627.
       78  78-CVDA-is-INITCOMPLETE     value 628.
       78  78-CVDA-is-STANDBY          value 629.
       78  78-CVDA-is-AUTOACTIVE       value 630.
       78  78-CVDA-is-AUTOINACTIVE     value 631.
       78  78-CVDA-is-CTLGALL          value 632.
       78  78-CVDA-is-CTLGMODIFY       value 633.
       78  78-CVDA-is-CTLGNONE         value 634.
       78  78-CVDA-is-START            value 635.
       78  78-CVDA-is-POST             value 636.
       78  78-CVDA-is-DELAY            value 637.
       78  78-CVDA-is-ROUTE            value 638.
       78  78-CVDA-is-CLEAR            value 640.
       78  78-CVDA-is-NOCLEAR          value 641.
       78  78-CVDA-is-USER             value 642.
       78  78-CVDA-is-SYSTEM           value 643.
       78  78-CVDA-is-SHUTENABLED      value 644.
       78  78-CVDA-is-SHUTDISABLED     value 645.
       78  78-CVDA-is-EXCI             value 650.
       78  78-CVDA-is-GENERIC          value 651.
       78  78-CVDA-is-SPECIFIC         value 652.
       78  78-CVDA-is-SYSCONNECT       value 653.
       78  78-CVDA-is-NOSYSCONNECT     value 654.
       78  78-CVDA-is-FORCECANCEL      value 655.
       78  78-CVDA-is-NOISOLATE        value 657.
       78  78-CVDA-is-ISOLATE          value 658.
       78  78-CVDA-is-NOTDEFINED       value 659.
       78  78-CVDA-is-CICS             value 660.
       78  78-CVDA-is-NONCICS          value 661.
       78  78-CVDA-is-SUBSPACE         value 663.
       78  78-CVDA-is-BASESPACE        value 664.
       78  78-CVDA-is-XCF              value 665.
       78  78-CVDA-is-REQUIRED         value 666.
       78  78-CVDA-is-NOTREQUIRED      value 667.
       78  78-CVDA-is-SOS              value 668.
       78  78-CVDA-is-NOTSOS           value 669.
       78  78-CVDA-is-REGISTERED       value 670.
       78  78-CVDA-is-UNREGISTERED     value 671.
       78  78-CVDA-is-UNAVAILABLE      value 672.
       78  78-CVDA-is-CMDPROT          value 673.
       78  78-CVDA-is-NOCMDPROT        value 674.
       78  78-CVDA-is-RELATED          value 675.
       78  78-CVDA-is-REGERROR         value 677.
       78  78-CVDA-is-DEREGISTERED     value 678.
       78  78-CVDA-is-DEREGERROR       value 679.
       78  78-CVDA-is-REENTPROT        value 680.
       78  78-CVDA-is-NOREENTPROT      value 681.
       78  78-CVDA-is-SOSBELOW         value 682.
       78  78-CVDA-is-SOSABOVE         value 683.
       78  78-CVDA-is-DAE              value 684.
       78  78-CVDA-is-NODAE            value 685.
       78  78-CVDA-is-CONNECTED        value 690.
       78  78-CVDA-is-NOTCONNECTED     value 691.
       78  78-CVDA-is-SPI              value 693.
       78  78-CVDA-is-NOSPI            value 694.
       78  78-CVDA-is-NORECOVDATA      value 700.
       78  78-CVDA-is-RECOVDATA        value 701.
       78  78-CVDA-is-RESYNC           value 702.
       78  78-CVDA-is-UNCONNECTED      value 703.
       78  78-CVDA-is-IMMQUIESCED      value 706.
       78  78-CVDA-is-QUIESCED         value 707.
       78  78-CVDA-is-QUIESCING        value 708.
       78  78-CVDA-is-UNQUIESCED       value 709.
       78  78-CVDA-is-NOLOSTLOCKS      value 710.
       78  78-CVDA-is-NORETAINED       value 711.
       78  78-CVDA-is-RECOVERLOCKS     value 712.
       78  78-CVDA-is-REMLOSTLOCKS     value 713.
       78  78-CVDA-is-RESETLOCKS       value 714.
       78  78-CVDA-is-RETAINED         value 715.
       78  78-CVDA-is-RETRY            value 716.
       78  78-CVDA-is-RLS              value 720.
       78  78-CVDA-is-NOTRLS           value 721.
       78  78-CVDA-is-UNCOMMITTED      value 722.
       78  78-CVDA-is-CONSISTENT       value 723.
       78  78-CVDA-is-REPEATABLE       value 724.
       78  78-CVDA-is-RLSACTIVE        value 730.
       78  78-CVDA-is-RLSINACTIVE      value 731.
       78  78-CVDA-is-VRRDS            value 732.
       78  78-CVDA-is-REMSESSION       value 740.
       78  78-CVDA-is-CLIENT           value 741.
       78  78-CVDA-is-EXECENQ          value 751.
       78  78-CVDA-is-EXECENQADDR      value 752.
       78  78-CVDA-is-OWNER            value 753.
       78  78-CVDA-is-WAITER           value 754.
       78  78-CVDA-is-CONNECTION       value 755.
       78  78-CVDA-is-DATASET          value 756.
       78  78-CVDA-is-HEURCOMMIT       value 757.
       78  78-CVDA-is-HEURBACKOUT      value 758.
       78  78-CVDA-is-RLSSERVER        value 761.
       78  78-CVDA-is-SHUNTED          value 762.
       78  78-CVDA-is-WAITCOMMIT       value 763.
       78  78-CVDA-is-WAITING          value 765.
       78  78-CVDA-is-WAITRMI          value 766.
       78  78-CVDA-is-TDQ              value 767.
       78  78-CVDA-is-TSQ              value 768.
       78  78-CVDA-is-COORDINATOR      value 770.
       78  78-CVDA-is-RMI              value 771.
       78  78-CVDA-is-STARTING         value 772.
       78  78-CVDA-is-SUBORDINATE      value 773.
       78  78-CVDA-is-NRS              value 774.
       78  78-CVDA-is-UNKNOWN          value 774.
       78  78-CVDA-is-MVS              value 780.
       78  78-CVDA-is-DUMMY            value 781.
       78  78-CVDA-is-FAILED           value 782.
       78  78-CVDA-is-FLUSH            value 783.
       78  78-CVDA-is-NOSYSLOG         value 784.
       78  78-CVDA-is-SYSLOG           value 785.
       78  78-CVDA-is-KEEP             value 786.
       78  78-CVDA-is-COLD             value 788.
       78  78-CVDA-is-INITIAL          value 789.
       78  78-CVDA-is-ENDAFFINITY      value 790.
       78  78-CVDA-is-CACHE            value 791.
       78  78-CVDA-is-COMMITFAIL       value 792.
       78  78-CVDA-is-DATASETFULL      value 793.
       78  78-CVDA-is-DEADLOCK         value 794.
       78  78-CVDA-is-DELEXITERROR     value 795.
       78  78-CVDA-is-INDEXRECFULL     value 796.
       78  78-CVDA-is-IOERROR          value 797.
       78  78-CVDA-is-OPENERROR        value 798.
       78  78-CVDA-is-RLSGONE          value 799.
       78  78-CVDA-is-BACKUPNONBWO     value 800.
       78  78-CVDA-is-SKIP             value 810.
       78  78-CVDA-is-LEAVE            value 811.
       78  78-CVDA-is-REWIND           value 811.
       78  78-CVDA-is-REREAD           value 812.
       78  78-CVDA-is-MOD              value 813.
       78  78-CVDA-is-QUEUE            value 814.
       78  78-CVDA-is-REJECT           value 815.
       78  78-CVDA-is-IGNORERR         value 816.
       78  78-CVDA-is-UNATTEMPTED      value 820.
       78  78-CVDA-is-RRCOMMITFAIL     value 830.
       78  78-CVDA-is-RRINDOUBT        value 831.
       78  78-CVDA-is-LCKSTRUCFULL     value 832.
       78  78-CVDA-is-CFTABLE          value 833.
       78  78-CVDA-is-LOAD             value 834.
       78  78-CVDA-is-NOLOAD           value 835.
       78  78-CVDA-is-CONTENTION       value 836.
       78  78-CVDA-is-LOCKING          value 837.
       78  78-CVDA-is-ABEND            value 900.
       78  78-CVDA-is-CGROUP           value 902.
       78  78-CVDA-is-CONNECT          value 903.
       78  78-CVDA-is-CONNECTING       value 904.
       78  78-CVDA-is-CSIGN            value 905.
       78  78-CVDA-is-CTERM            value 906.
       78  78-CVDA-is-CTX              value 907.
       78  78-CVDA-is-COPID            value 908.
       78  78-CVDA-is-CUSERID          value 909.
       78  78-CVDA-is-DISCONNING       value 910.
       78  78-CVDA-is-EQUAL            value 911.
       78  78-CVDA-is-EXIT             value 912.
       78  78-CVDA-is-GROUP            value 913.
       78  78-CVDA-is-HIGH             value 914.
       78  78-CVDA-is-LOW              value 915.
       78  78-CVDA-is-NOCONNECT        value 916.
       78  78-CVDA-is-NOEXIT           value 917.
       78  78-CVDA-is-NORELEASE        value 918.
       78  78-CVDA-is-NOROLLBACK       value 919.
       78  78-CVDA-is-NOTWAIT          value 920.
       78  78-CVDA-is-N906D            value 921.
       78  78-CVDA-is-POOL             value 922.
       78  78-CVDA-is-REBUILD          value 923.
       78  78-CVDA-is-RECONNECT        value 924.
       78  78-CVDA-is-SIGN             value 925.
       78  78-CVDA-is-SQLCODE          value 926.
       78  78-CVDA-is-TWAIT            value 927.
       78  78-CVDA-is-TXID             value 928.
       78  78-CVDA-is-TX               value 929.
       78  78-CVDA-is-USERID           value 930.
       78  78-CVDA-is-N906             value 931.
       78  78-CVDA-is-TPOOL            value 932.
       78  78-CVDA-is-OPID             value 933.
       78  78-CVDA-is-NORESYNC         value 934.
       78  78-CVDA-is-NOTFIRED         value 1000.
       78  78-CVDA-is-FIRED            value 1001.
       78  78-CVDA-is-ACTIVITY         value 1002.
       78  78-CVDA-is-COMPOSITE        value 1003.
       78  78-CVDA-is-TIMER            value 1004.
       78  78-CVDA-is-AND              value 1005.
       78  78-CVDA-is-OR               value 1006.
       78  78-CVDA-is-PROCESS          value 1010.
       78  78-CVDA-is-NOUSER           value 1011.
       78  78-CVDA-is-EVENTFAIL        value 1012.
       78  78-CVDA-is-FORCED           value 1013.
       78  78-CVDA-is-INCOMPLETE       value 1014.
       78  78-CVDA-is-UNEXPECTED       value 1015.
       78  78-CVDA-is-NORMAL           value 1016.
       78  78-CVDA-is-EXPIRED          value 1017.
       78  78-CVDA-is-UNEXPIRED        value 1018.
       78  78-CVDA-is-NOTDYNAMIC       value 1021.
       78  78-CVDA-is-NOTROUTABLE      value 1022.
       78  78-CVDA-is-ROUTABLE         value 1023.
       78  78-CVDA-is-DORMANT          value 1024.
       78  78-CVDA-is-CANCELLING       value 1025.
       78  78-CVDA-is-COMPLETE         value 1026.
       78  78-CVDA-is-NOTSUSPENDED     value 1027.
       78  78-CVDA-is-SSL              value 1030.
       78  78-CVDA-is-NOSSL            value 1031.
       78  78-CVDA-is-CLIENTAUTH       value 1032.
       78  78-CVDA-is-HTTPYES          value 1033.
       78  78-CVDA-is-HTTPNO           value 1034.
       78  78-CVDA-is-PDSMEMBER        value 1035.
       78  78-CVDA-is-APPEND           value 1036.
       78  78-CVDA-is-NOAPPEND         value 1037.
       78  78-CVDA-is-BINARY           value 1038.
       78  78-CVDA-is-EBCDIC           value 1039.
       78  78-CVDA-is-QUASIRENT        value 1050.
       78  78-CVDA-is-THREADSAFE       value 1051.
       78  78-CVDA-is-BASEAPI          value 1052.
       78  78-CVDA-is-OPENAPI          value 1053.
       78  78-CVDA-is-NOFORCE          value 1054.
       78  78-CVDA-is-CKOPEN           value 1055.
       78  78-CVDA-is-UKOPEN           value 1056.
       78  78-CVDA-is-QR               value 1057.
       78  78-CVDA-is-INTERNAL         value 1058.
       78  78-CVDA-is-RRMS             value 1063.
       78  78-CVDA-is-HOTPOOL          value 1065.
       78  78-CVDA-is-NOTHOTPOOL       value 1066.
       78  78-CVDA-is-NOAUTO           value 1071.
       78  78-CVDA-is-PROGAUTO         value 1072.
       78  78-CVDA-is-FULLAUTO         value 1073.
       78  78-CVDA-is-JVM              value 1080.
       78  78-CVDA-is-NOJVM            value 1081.
       78  78-CVDA-is-DEBUG            value 1082.
       78  78-CVDA-is-NODEBUG          value 1083.
       78  78-CVDA-is-NONLE370         value 1084.
       78  78-CVDA-is-PUBLISH          value 1085.
       78  78-CVDA-is-RETRACT          value 1086.
       78  78-CVDA-is-CLIENTCERT       value 1087.
       78  78-CVDA-is-NONCRITICAL      value 1090.
       78  78-CVDA-is-NOAUTHENTIC      value 1091.
       78  78-CVDA-is-BASICAUTH        value 1092.
       78  78-CVDA-is-CERTIFICAUTH     value 1093.
       78  78-CVDA-is-AUTOREGISTER     value 1094.
       78  78-CVDA-is-AUTOAUTH         value 1095.
       78  78-CVDA-is-HTTP             value 1096.
       78  78-CVDA-is-IIOP             value 1097.
       78  78-CVDA-is-ECI              value 1098.
       78  78-CVDA-is-VERIFY           value 1099.
       78  78-CVDA-is-BOTH             value 1100.
       78  78-CVDA-is-CORBA            value 1101.
       78  78-CVDA-is-EJB              value 1102.
       78  78-CVDA-is-HOME             value 1103.
       78  78-CVDA-is-IGNORED          value 1105.
       78  78-CVDA-is-OBJMANAGED       value 1106.
       78  78-CVDA-is-OTS              value 1107.
       78  78-CVDA-is-OTSCOORD         value 1108.
       78  78-CVDA-is-RESPECTED        value 1109.
       78  78-CVDA-is-PHASEOUT         value 1111.
       78  78-CVDA-is-INITING          value 1112.
       78  78-CVDA-is-PENDINIT         value 1113.
       78  78-CVDA-is-PENDRESOLVE      value 1114.
       78  78-CVDA-is-RESOLVING        value 1115.
       78  78-CVDA-is-UNRESOLVED       value 1116.
       78  78-CVDA-is-UNUSABLE         value 1117.
       78  78-CVDA-is-DISCARDING       value 1118.


      *** ÚÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄ¿
      *** ³ State ³ State name     ³ APPC sync level   ³ cvda ³
      *** ³ number³                ÃÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄ´ code ³
      *** ³       ³                ³ 0   ³ 1    ³ 2    ³      ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 1     ³ Allocated      ³ Yes ³ Yes  ³ Yes  ³ 81   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 2     ³ Send           ³ Yes ³ Yes  ³ Yes  ³ 90   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 3     ³ Pendreceive    ³ Yes ³ Yes  ³ Yes  ³ 87   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 4     ³ Pendfree       ³ Yes ³ Yes  ³ Yes  ³ 86   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 5     ³ Receive        ³ Yes ³ Yes  ³ Yes  ³ 88   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 6     ³ Confreceive    ³ No  ³ Yes  ³ Yes  ³ 83   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 7     ³ Confsend       ³ No  ³ Yes  ³ Yes  ³ 84   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 8     ³ Conffree       ³ No  ³ Yes  ³ Yes  ³ 82   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 9     ³ Syncreceive    ³ No  ³ No   ³ Yes  ³ 92   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 10    ³ Syncsend       ³ No  ³ No   ³ Yes  ³ 93   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 11    ³ Syncfree       ³ No  ³ No   ³ Yes  ³ 91   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 12    ³ Free           ³ Yes ³ Yes  ³ Yes  ³ 85   ³
      *** ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´
      *** ³ 13    ³ Rollback       ³ No  ³ No   ³ Yes  ³ 89   ³
      *** ÀÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÙ



      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation WRITE OPERATOR Action Codes                     *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-WTO-ACTION-is-IMMEDIATE  value 2.
       78  78-WTO-ACTION-is-EVENTUAL   value 3.
       78  78-WTO-ACTION-is-CRITICAL   value 11.




      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation System Abend Codes                              *
      ***                                                              *
      ***--------------------------------------------------------------*

P32115 78  78-SYS-ABEND-needs-MFPM     value 'MFPM'.
N31059 78  78-SYS-ABEND-mixed-lang     value 'LANG'.
       78  78-SYS-ABEND-recurse-in-lvl value 'RECU'.
       78  78-SYS-ABEND-recurse-no-ppt value 'RPPT'.
       78  78-SYS-ABEND-prologue-error value 'RCAL'.
       78  78-SYS-ABEND-interface      value 'EXIF'.
       78  78-SYS-ABEND-unsupported    value 'FUNC'.
       78  78-SYS-ABEND-atp-alloc      value 'MATP'.
       78  78-SYS-ABEND-bll-alloc      value 'MBLL'.
       78  78-SYS-ABEND-set-alloc      value 'MUSR'.
       78  78-SYS-ABEND-inact-logic    value 'IRST'.
       78  78-SYS-ABEND-commarea-alloc value 'MCOM'.
       78  78-SYS-ABEND-local-storage  value 'ALSA'.
P27252 78  78-SYS-ABEND-shared-storage value 'ASSA'.
500097*78  78-SYS-ABEND-no-mapset-file value 'AEI0'.
500097 78  78-SYS-ABEND-no-mapset-file value 'APCT'.
       78  78-SYS-ABEND-no-map-in-mset value 'ABM0'.
n47670 78  78-SYS-ABEND-MFPM-mismatch  value 'MFPE'.
spool0 78  78-SYS-ABEND-SPOOL-nohandle value 'APST'.
nx-206 78  78-SYS-ABEND-EXCI-no-MTO    VALUE 'EXIM'.
nx-206 78  78-SYS-ABEND-EXCI-app-mdg   VALUE 'EXIA'.
nx-206 78  78-SYS-ABEND-EXCI-COBPATH   VALUE 'EXIC'.

       78  78-SYS-ABEND-x1             value '????'.



      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation Standard Interface and Vector Values            *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-xarg-is-value            value 32768.

       78  78-vector-is-good           value 0.

       78  78-vector-is-ignore         value 0.
       78  78-vector-is-abend          value 1.
       78  78-vector-is-do-link        value 2.
       78  78-vector-is-do-xctl        value 2.
       78  78-vector-is-do-user-call   value 2.
       78  78-vector-is-do-return      value 2.
       78  78-vector-is-ignore-aid     value 2.
       78  78-vector-is-ignore-error   value 0.




      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation EIBFN Values                                    *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-EIBFN-address                value x'0202'.
       78  78-EIBFN-handle-condition       value x'0204'.
       78  78-EIBFN-handle-aid             value x'0206'.
       78  78-EIBFN-assign                 value x'0208'.
       78  78-EIBFN-ignore-condition       value x'020A'.
       78  78-EIBFN-push-handle            value x'020C'.
       78  78-EIBFN-pop-handle             value x'020E'.
       78  78-EIBFN-address-set            value x'0210'.
       78  78-EIBFN-receive                value x'0402'.
       78  78-EIBFN-send                   value x'0404'.
       78  78-EIBFN-converse               value x'0406'.
       78  78-EIBFN-issue-eods             value x'0408'.
       78  78-EIBFN-issue-copy             value x'040A'.
       78  78-EIBFN-wait-terminal          value x'040C'.
       78  78-EIBFN-issue-load             value x'040E'.
       78  78-EIBFN-wait-signal            value x'0410'.
       78  78-EIBFN-issue-reset            value x'0412'.
       78  78-EIBFN-issue-disconnect       value x'0414'.
       78  78-EIBFN-issue-endoutput        value x'0416'.
       78  78-EIBFN-issue-eraseaup         value x'0418'.
       78  78-EIBFN-issue-endfile          value x'041A'.
       78  78-EIBFN-issue-print            value x'041C'.
       78  78-EIBFN-issue-signal           value x'041E'.
       78  78-EIBFN-allocate               value x'0420'.
       78  78-EIBFN-free                   value x'0422'.
       78  78-EIBFN-point                  value x'0424'.
       78  78-EIBFN-build-attach           value x'0426'.
       78  78-EIBFN-extract-attach         value x'0428'.
       78  78-EIBFN-extract-tct            value x'042A'.
       78  78-EIBFN-wait-convid            value x'042C'.
       78  78-EIBFN-extract-process        value x'042E'.
       78  78-EIBFN-issue-abend            value x'0430'.
       78  78-EIBFN-connect-process        value x'0432'.
       78  78-EIBFN-issue-confirmation     value x'0434'.
       78  78-EIBFN-issue-error            value x'0436'.
       78  78-EIBFN-issue-prepare          value x'0438'.
       78  78-EIBFN-issue-pass             value x'043A'.
       78  78-EIBFN-extract-logonmsg       value x'043C'.
       78  78-EIBFN-extract-attributes     value x'043E'.
       78  78-EIBFN-read                   value x'0602'.
       78  78-EIBFN-write                  value x'0604'.
       78  78-EIBFN-rewrite                value x'0606'.
       78  78-EIBFN-delete                 value x'0608'.
       78  78-EIBFN-unlock                 value x'060A'.
       78  78-EIBFN-startbr                value x'060C'.
       78  78-EIBFN-readnext               value x'060E'.
       78  78-EIBFN-readprev               value x'0610'.
       78  78-EIBFN-endbr                  value x'0612'.
       78  78-EIBFN-resetbr                value x'0614'.

      ***  -- The following 2 EIBFN values are invented for internal
      ***  -- interface usage only.  They are not moved to EIBFN.
       78  78-EIBFN-open-dataset           value x'06F0'.
       78  78-EIBFN-close-dataset          value x'06FC'.


       78  78-EIBFN-writeq-td              value x'0802'.
       78  78-EIBFN-readq-td               value x'0804'.
       78  78-EIBFN-deleteq-td             value x'0806'.
       78  78-EIBFN-writeq-ts              value x'0A02'.
       78  78-EIBFN-readq-ts               value x'0A04'.
       78  78-EIBFN-deleteq-ts             value x'0A06'.
       78  78-EIBFN-getmain                value x'0C02'.
       78  78-EIBFN-freemain               value x'0C04'.
       78  78-EIBFN-link                   value x'0E02'.
       78  78-EIBFN-xctl                   value x'0E04'.
       78  78-EIBFN-load                   value x'0E06'.
       78  78-EIBFN-return                 value x'0E08'.
       78  78-EIBFN-release                value x'0E0A'.
       78  78-EIBFN-abend                  value x'0E0C'.
       78  78-EIBFN-handle-abend           value x'0E0E'.

      ***  -- The following 2 EIBFN values are invented for the EXEC
      ***  -- interface only.  They are not moved to EIBFN.
       78  78-EIBFN-vsc2-call              value x'0EF2'.
       78  78-EIBFN-vsc2-stop-run          value x'0EF8'.


       78  78-EIBFN-asktime-update-eib     value x'1002'.
       78  78-EIBFN-delay                  value x'1004'.
       78  78-EIBFN-post                   value x'1006'.
       78  78-EIBFN-start                  value x'1008'.
       78  78-EIBFN-retrieve               value x'100A'.
       78  78-EIBFN-cancel                 value x'100C'.
       78  78-EIBFN-wait-event             value x'1202'.
       78  78-EIBFN-enq                    value x'1204'.
       78  78-EIBFN-deq                    value x'1206'.
       78  78-EIBFN-suspend                value x'1208'.
       78  78-EIBFN-write-journalnum       value x'1402'.
       78  78-EIBFN-wait-journalnum        value x'1404'.
peh460 78  78-EIBFN-write-journalname      value x'1406'.
peh460 78  78-EIBFN-wait-journalname       value x'1408'.
       78  78-EIBFN-syncpoint              value x'1602'.
       78  78-EIBFN-syncpoint-rollback     value x'1602'.
       78  78-EIBFN-resync-entryname       value x'1604'.
       78  78-EIBFN-receive-map            value x'1802'.
       78  78-EIBFN-send-map               value x'1804'.
       78  78-EIBFN-send-text              value x'1806'.
       78  78-EIBFN-send-page              value x'1808'.
       78  78-EIBFN-purge-message          value x'180A'.
       78  78-EIBFN-route                  value x'180C'.
       78  78-EIBFN-receive-partn          value x'180E'.
       78  78-EIBFN-send-partnset          value x'1810'.
       78  78-EIBFN-send-control           value x'1812'.
       78  78-EIBFN-enter-traceid          value x'1A04'.
       78  78-EIBFN-dump-transaction-old   value x'1C02'.
       78  78-EIBFN-issue-add              value x'1E02'.
       78  78-EIBFN-issue-erase            value x'1E04'.
       78  78-EIBFN-issue-replace          value x'1E06'.
       78  78-EIBFN-issue-abort            value x'1E08'.
       78  78-EIBFN-issue-query            value x'1E0A'.
       78  78-EIBFN-issue-end              value x'1E0C'.
       78  78-EIBFN-issue-receive          value x'1E0E'.
       78  78-EIBFN-issue-note             value x'1E10'.
       78  78-EIBFN-issue-wait             value x'1E12'.
       78  78-EIBFN-issue-send             value x'1E14'.
       78  78-EIBFN-bif-deedit             value x'2002'.
peh466 78  78-EIBFN-define-counter         value x'2004'.
peh466 78  78-EIBFN-get-counter            value x'2006'.
peh466 78  78-EIBFN-update-counter         value x'2008'.
peh466 78  78-EIBFN-delete-counter         value x'200A'.
peh466 78  78-EIBFN-rewind-counter         value x'200C'.
peh466 78  78-EIBFN-query-counter          value x'200E'.
peh466 78  78-EIBFN-define-dcounter        value x'2014'.
peh466 78  78-EIBFN-get-dcounter           value x'2016'.
peh466 78  78-EIBFN-update-dcounter        value x'2018'.
peh466 78  78-EIBFN-delete-dcounter        value x'201A'.
peh466 78  78-EIBFN-rewind-dcounter        value x'201C'.
peh466 78  78-EIBFN-query-dcounter         value x'201E'.
       78  78-EIBFN-enable-program         value x'2202'.
       78  78-EIBFN-disable-program        value x'2204'.
       78  78-EIBFN-extract-exit           value x'2206'.
peh464 78  78-EIBFN-web-receive            value x'3802'.
peh464 78  78-EIBFN-web-send               value x'3804'.
peh464 78  78-EIBFN-web-read               value x'3806'.
peh464 78  78-EIBFN-web-startbrowse        value x'3808'.
peh464 78  78-EIBFN-web-readnext           value x'380A'.
peh464 78  78-EIBFN-web-endbrowse          value x'380C'.
peh464 78  78-EIBFN-web-write              value x'380E'.
peh464 78  78-EIBFN-web-extract            value x'3810'.
peh464 78  78-EIBFN-web-retrieve           value x'3814'.
peh467 78  78-EIBFN-document-create        value x'3C02'.
peh467 78  78-EIBFN-document-insert        value x'3C04'.
peh467 78  78-EIBFN-document-retrieve      value x'3C06'.
peh467 78  78-EIBFN-document-set           value x'3C08'.
peh464 78  78-EIBFN-extract-tcpip          value x'3E0E'.
peh464 78  78-EIBFN-extract-certificate    value x'3E10'.
       78  78-EIBFN-inquire-autinstmodel   value x'4202'.
       78  78-EIBFN-discard-autinstmodel   value x'4210'.
       78  78-EIBFN-inquire-partner        value x'4402'.
       78  78-EIBFN-discard-partner        value x'4410'.
       78  78-EIBFN-inquire-profile        value x'4602'.
       78  78-EIBFN-discard-profile        value x'4610'.
       78  78-EIBFN-enter-tracenum         value x'4802'.
       78  78-EIBFN-monitor                value x'4804'.
       78  78-EIBFN-asktime-get-abstime    value x'4A02'.
       78  78-EIBFN-formattime             value x'4A04'.
       78  78-EIBFN-inquire-file           value x'4C02'.
       78  78-EIBFN-set-file               value x'4C04'.
       78  78-EIBFN-discard-file           value x'4C10'.
       78  78-EIBFN-inquire-program        value x'4E02'.
       78  78-EIBFN-set-program            value x'4E04'.
       78  78-EIBFN-discard-program        value x'4E10'.
       78  78-EIBFN-inquire-transaction    value x'5002'.
       78  78-EIBFN-set-transaction        value x'5004'.
       78  78-EIBFN-discard-transaction    value x'5010'.
       78  78-EIBFN-inquire-terminal       value x'5202'.
       78  78-EIBFN-set-terminal           value x'5204'.
       78  78-EIBFN-inquire-netname        value x'5206'.
       78  78-EIBFN-set-netname            value x'5208'.
       78  78-EIBFN-inquire-terminal-2     value x'5212'.
       78  78-EIBFN-set-terminal-2         value x'5214'.
       78  78-EIBFN-inquire-netname-2      value x'5216'.
       78  78-EIBFN-inquire-system         value x'5402'.
       78  78-EIBFN-set-system             value x'5404'.
       78  78-EIBFN-spoolopen              value x'5602'.
       78  78-EIBFN-spoolread              value x'5604'.
       78  78-EIBFN-spoolwrite             value x'5606'.
       78  78-EIBFN-spoolclose             value x'5610'.
024798 78  78-EIBFN-spoolopen-report       value x'5620'.
024798 78  78-EIBFN-spoolwrite-report      value x'5628'.
024798 78  78-EIBFN-spoolclose-report      value x'562C'.
       78  78-EIBFN-inquire-connection     value x'5802'.
       78  78-EIBFN-set-connection         value x'5804'.
       78  78-EIBFN-inquire-modename       value x'5A02'.
       78  78-EIBFN-set-modename           value x'5A04'.
       78  78-EIBFN-inquire-tdqueue        value x'5C02'.
       78  78-EIBFN-set-tdqueue            value x'5C04'.
       78  78-EIBFN-inquire-task           value x'5E02'.
       78  78-EIBFN-set-task               value x'5E04'.
       78  78-EIBFN-change-task            value x'5E06'.
       78  78-EIBFN-inquire-tclass         value x'5E12'.
       78  78-EIBFN-set-tclass             value x'5E14'.
       78  78-EIBFN-wait-external          value x'5E22'.
       78  78-EIBFN-waitcics               value x'5E32'.
       78  78-EIBFN-inquire-journalnum     value x'6002'.
       78  78-EIBFN-set-journalnum         value x'6004'.
       78  78-EIBFN-inquire-volume         value x'6202'.
       78  78-EIBFN-set-volume             value x'6204'.
       78  78-EIBFN-perform-secrty-rebld   value x'6402'.
       78  78-EIBFN-inquire-dumpds         value x'6602'.
       78  78-EIBFN-set-dumpds             value x'6604'.
       78  78-EIBFN-inquire-trandumpcode   value x'6612'.
       78  78-EIBFN-set-trandumpcode       value x'6614'.
       78  78-EIBFN-inquire-sysdumpcode    value x'6622'.
       78  78-EIBFN-set-sysdumpcode        value x'6624'.
       78  78-EIBFN-inquire-vtam           value x'6802'.
       78  78-EIBFN-set-vtam               value x'6804'.
       78  78-EIBFN-inquire-autoinstall    value x'6812'.
       78  78-EIBFN-set-autoinstall        value x'6814'.
       78  78-EIBFN-query-security         value x'6A02'.
       78  78-EIBFN-write-operator         value x'6C02'.
       78  78-EIBFN-inquire-irc            value x'6E02'.
       78  78-EIBFN-set-irc                value x'6E04'.
       78  78-EIBFN-inquire-statistics     value x'7002'.
       78  78-EIBFN-set-statistics         value x'7004'.
       78  78-EIBFN-perform-stat-record    value x'7006'.
       78  78-EIBFN-collect-statistics     value x'7008'.
       78  78-EIBFN-inquire-monitor        value x'7012'.
       78  78-EIBFN-set-monitor            value x'7014'.
       78  78-EIBFN-perform-resettime      value x'7202'.
       78  78-EIBFN-signon                 value x'7402'.
       78  78-EIBFN-signoff                value x'7404'.
peh460 78  78-EIBFN-verify-password        value x'7406'.
peh460 78  78-EIBFN-change-password        value x'7408'.
       78  78-EIBFN-perform-shutdown       value x'7602'.
       78  78-EIBFN-inquire-tracedest      value x'7802'.
       78  78-EIBFN-set-tracedest          value x'7804'.
       78  78-EIBFN-inquire-traceflag      value x'7812'.
       78  78-EIBFN-set-traceflag          value x'7814'.
       78  78-EIBFN-inquire-tracetype      value x'7822'.
       78  78-EIBFN-set-tracetype          value x'7824'.
       78  78-EIBFN-inquire-dsname         value x'7A02'.
       78  78-EIBFN-set-dsname             value x'7A04'.
       78  78-EIBFN-dump-transaction       value x'7E02'.
       78  78-EIBFN-dump-system            value x'7E04'.
516108 78  78-EIBFN-inquire-tsqueue        value x'8002'.
516108 78  78-EIBFN-set-tsqueue            value x'8004'.
516108 78  78-EIBFN-inquire-tsqname        value x'8012'.
516108 78  78-EIBFN-set-tsqname            value x'8014'.
027958 78  78-EIBFN-inquire-uow            value x'9002'.
027958 78  78-EIBFN-set-uow                value x'9004'.

      ***  -- The following group of EIBFN values are
      ***  -- invented; documented values are unknown
      ***  -- at this time.

516108*78  78-EIBFN-inquire-tsqueue        value x'5C06'.

sc-215*78  78-EIBFN-gds-allocate           value x'0520'.
sc-215*78  78-EIBFN-gds-assign             value x'0526'.
sc-215*78  78-EIBFN-gds-connect-process    value x'0532'.
sc-215*78  78-EIBFN-gds-extract-attribs    value x'053E'.
sc-215*78  78-EIBFN-gds-extract-process    value x'052E'.
sc-215*78  78-EIBFN-gds-free               value x'0522'.
sc-215*78  78-EIBFN-gds-issue-abend        value x'0530'.
sc-215*78  78-EIBFN-gds-issue-confirm      value x'0534'.
sc-215*78  78-EIBFN-gds-issue-error        value x'0536'.
sc-215*78  78-EIBFN-gds-issue-prepare      value x'0538'.
sc-215*78  78-EIBFN-gds-issue-signal       value x'051E'.
sc-215*78  78-EIBFN-gds-receive            value x'0502'.
sc-215*78  78-EIBFN-gds-send               value x'0504'.
sc-215*78  78-EIBFN-gds-wait               value x'050C'.
sc-215     *>------------------------------------------<*
sc-215     *> -- From CICS/ESA V4R1 User's Handbook -- <*
sc-215     *>------------------------------------------<*
sc-215 78  78-EIBFN-gds-allocate           value x'2402'.
sc-215 78  78-EIBFN-gds-assign             value x'2404'.
sc-215 78  78-EIBFN-gds-extract-process    value x'2406'.
sc-215 78  78-EIBFN-gds-free               value x'2408'.
sc-215 78  78-EIBFN-gds-issue-abend        value x'240a'.
sc-215 78  78-EIBFN-gds-connect-process    value x'240c'.
sc-215 78  78-EIBFN-gds-issue-confirm      value x'240e'.
sc-215 78  78-EIBFN-gds-issue-error        value x'2410'.
sc-215 78  78-EIBFN-gds-issue-signal       value x'2412'.
sc-215 78  78-EIBFN-gds-receive            value x'2414'.
sc-215 78  78-EIBFN-gds-send               value x'2416'.
sc-215 78  78-EIBFN-gds-wait               value x'2418'.
sc-215 78  78-EIBFN-gds-issue-prepare      value x'241a'.
sc-215 78  78-EIBFN-gds-extract-attribs    value x'241c'.

      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation FORMATTIME Extended Argument Identifiers        *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-DATE-is-YYDDD                value 01.
       78  78-DATE-is-YYMMDD               value 02.
       78  78-DATE-is-YYDDMM               value 03.
       78  78-DATE-is-DDMMYY               value 04.
       78  78-DATE-is-MMDDYY               value 05.
       78  78-DATE-is-DAYCOUNT             value 06.
       78  78-DATE-is-DAYOFWEEK            value 07.
       78  78-DATE-is-DAYOFMONTH           value 08.
       78  78-DATE-is-MONTHOFYEAR          value 09.
       78  78-DATE-is-YEAR                 value 10.
       78  78-DATE-is-DATE                 value 11.
       78  78-DATE-is-TIME                 value 12.
N37025 78  78-DATE-is-DDMMYYYY             value 13.
N37025 78  78-DATE-is-MMDDYYYY             value 14.
N37025 78  78-DATE-is-YYYYDDD              value 15.
N37025 78  78-DATE-is-YYYYDDMM             value 16.
N37025 78  78-DATE-is-YYYYMMDD             value 17.
FULLDT 78  78-DATE-is-FULLDATE             value 18.
516109
516109***--------------------------------------------------------------*
516109***                                                              *
516109***    Emulation START BREXIT extended Argument Identifiers      *
516109***                                                              *
516109***--------------------------------------------------------------*
516109
516109 78  78-START-is-BREXIT              value 01.
516109 78  78-START-is-BRDATA              value 02.
516109 78  78-START-is-BRDATALENGTH        value 03.
peh460
peh460***--------------------------------------------------------------*
peh460***                                                              *
peh460***    Emulation VERIFY PASSWORD extended Argument Identifiers   *
peh460***                                                              *
peh460***--------------------------------------------------------------*
peh460
peh460 78  78-VERIFY-is-DAYSLEFT           value 01.
peh460 78  78-VERIFY-is-EXPIRYTIME         value 02.
peh460 78  78-VERIFY-is-INVALIDCOUNT       value 03.
peh464
peh464***--------------------------------------------------------------*
peh464***                                                              *
peh464***    Emulation EXTRACT CERTIFICATE extended Argument IDs       *
peh464***                                                              *
peh464***--------------------------------------------------------------*
peh464
peh464 78  78-EXTRACT-is-LOCALITY          value 01.
peh464 78  78-EXTRACT-is-LOCALITYLEN       value 02.
peh464 78  78-EXTRACT-is-ORGANIZATION      value 03.
peh464 78  78-EXTRACT-is-ORGANIZATLEN      value 04.
peh464 78  78-EXTRACT-is-ORGUNIT           value 05.
peh464 78  78-EXTRACT-is-ORGUNITLEN        value 06.




      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation ASSIGN Extended Argument Identifiers            *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-INFO-is-ABCODE               value 01.
       78  78-INFO-is-ABDUMP               value 02.
       78  78-INFO-is-ABPROGRAM            value 03.
       78  78-INFO-is-ALTSCRNHT            value 04.
       78  78-INFO-is-ALTSCRNWD            value 05.
       78  78-INFO-is-APLKYBD              value 06.
       78  78-INFO-is-APLTEXT              value 07.
       78  78-INFO-is-APPLID               value 08.
       78  78-INFO-is-ASRAINTRPT           value 09.
       78  78-INFO-is-ASRAPSW              value 10.
       78  78-INFO-is-ASRAREGS             value 11.
       78  78-INFO-is-BTRANS               value 12.
       78  78-INFO-is-CMDSEC               value 13.
       78  78-INFO-is-COLOR                value 14.
       78  78-INFO-is-CWALENG              value 15.
       78  78-INFO-is-DEFSCRNHT            value 16.
       78  78-INFO-is-DEFSCRNWD            value 17.
       78  78-INFO-is-DELIMITER            value 18.
       78  78-INFO-is-DESTCOUNT            value 19.
       78  78-INFO-is-DESTID               value 20.
       78  78-INFO-is-DESTIDLENG           value 21.
       78  78-INFO-is-DSSCS                value 22.
       78  78-INFO-is-DS3270               value 23.
       78  78-INFO-is-EXTDS                value 24.
       78  78-INFO-is-EWASUPP              value 25.
       78  78-INFO-is-FACILITY             value 26.
       78  78-INFO-is-FCI                  value 27.
       78  78-INFO-is-GCHARS               value 28.
       78  78-INFO-is-GCODES               value 29.
       78  78-INFO-is-GMMI                 value 30.
       78  78-INFO-is-HILIGHT              value 31.
       78  78-INFO-is-INITPARM             value 32.
       78  78-INFO-is-INITPARMLEN          value 33.
       78  78-INFO-is-INPARTN              value 34.
       78  78-INFO-is-KATAKANA             value 35.
       78  78-INFO-is-LDCMNEM              value 36.
       78  78-INFO-is-LDCNUM               value 37.
       78  78-INFO-is-MAPCOLUMN            value 38.
       78  78-INFO-is-MAPHEIGHT            value 39.
       78  78-INFO-is-MAPLINE              value 40.
       78  78-INFO-is-MAPWIDTH             value 41.
       78  78-INFO-is-MSRCONTROL           value 42.
       78  78-INFO-is-NATLANGINUSE         value 43.
       78  78-INFO-is-NETNAME              value 44.
       78  78-INFO-is-NEXTTRANSID          value 45.
       78  78-INFO-is-NUMTAB               value 46.
       78  78-INFO-is-OPCLASS              value 47.
       78  78-INFO-is-OPERKEYS             value 48.
       78  78-INFO-is-OPID                 value 49.
       78  78-INFO-is-OPSECURITY           value 50.
       78  78-INFO-is-ORGABCODE            value 51.
       78  78-INFO-is-OUTLINE              value 52.
       78  78-INFO-is-PAGENUM              value 53.
       78  78-INFO-is-PARTNPAGE            value 54.
       78  78-INFO-is-PARTNS               value 55.
       78  78-INFO-is-PARTNSET             value 56.
       78  78-INFO-is-PRINSYSID            value 57.
       78  78-INFO-is-PROGRAM              value 58.
       78  78-INFO-is-PS                   value 59.
       78  78-INFO-is-QNAME                value 60.
       78  78-INFO-is-RESSEC               value 61.
       78  78-INFO-is-RESTART              value 62.
       78  78-INFO-is-SCRNHT               value 63.
       78  78-INFO-is-SCRNWD               value 64.
       78  78-INFO-is-SIGDATA              value 65.
       78  78-INFO-is-SOSI                 value 66.
       78  78-INFO-is-STARTCODE            value 67.
       78  78-INFO-is-STATIONID            value 68.
       78  78-INFO-is-SYSID                value 69.
       78  78-INFO-is-TASKPRIORITY         value 70.
       78  78-INFO-is-TCTUALENG            value 71.
       78  78-INFO-is-TELLERID             value 72.
       78  78-INFO-is-TERMCODE             value 73.
       78  78-INFO-is-TERMPRIORITY         value 74.
       78  78-INFO-is-TEXTKYBD             value 75.
       78  78-INFO-is-TEXTPRINT            value 76.
       78  78-INFO-is-TRANPRIORITY         value 77.
       78  78-INFO-is-TWALENG              value 78.
       78  78-INFO-is-UNATTEND             value 79.
       78  78-INFO-is-USERID               value 80.
       78  78-INFO-is-USERNAME             value 81.
       78  78-INFO-is-USERPRIORITY         value 82.
       78  78-INFO-is-VALIDATION           value 83.
200088 78  78-INFO-is-INVOKINGPROG         value 84.
peh452 78  78-INFO-is-BRIDGE               value 85.
peh462 78  78-INFO-is-ACTIVITY             value 86.
peh462 78  78-INFO-is-ACTIVITYID           value 87.
peh462 78  78-INFO-is-ASRAKEY              value 88.
peh462 78  78-INFO-is-ASRASPC              value 89.
peh462 78  78-INFO-is-ASRASTG              value 90.
peh462 78  78-INFO-is-LANGINUSE            value 91.
peh462 78  78-INFO-is-PROCESS              value 92.
peh462 78  78-INFO-is-PROCESSTYPE          value 93.
peh462 78  78-INFO-is-RETURNPROG           value 94.




      ***--------------------------------------------------------------*
      ***                                                              *
      ***    Emulation SYSTEMS PROGRAMMING Extended Argument Ids       *
      ***                                                              *
      ***--------------------------------------------------------------*

       78  78-SP-is-ACCESSMETHOD       value 001.
P25238*78  78-SP-is-ACQSTATUS          value 002.
P25238 78  78-SP-is-TERMSTATUS         value 002.
P25238 78  78-SP-is-ACQSTATUS          value 78-SP-is-TERMSTATUS.
       78  78-SP-is-ACTION             value 003.
       78  78-SP-is-ACTIVE             value 004.
       78  78-SP-is-ADD                value 005.
       78  78-SP-is-AKP                value 006.
       78  78-SP-is-ALTPAGEHT          value 007.
       78  78-SP-is-ALTPAGEWD          value 008.
       78  78-SP-is-ALTPRINTER         value 009.
       78  78-SP-is-ALTPRTCOPYST       value 010.
       78  78-SP-is-ALTSCRNHT          value 011.
       78  78-SP-is-ALTSCRNWD          value 012.
       78  78-SP-is-ALTSUFFIX          value 013.
       78  78-SP-is-AMAXTASKS          value 014.
       78  78-SP-is-APLKYBDST          value 016.
       78  78-SP-is-APLTEXTST          value 017.
       78  78-SP-is-ARCHSTATUS         value 018.
       78  78-SP-is-ATIFACILITY        value 019.
       78  78-SP-is-ATISTATUS          value 020.
       78  78-SP-is-ATITERMID          value 021.
       78  78-SP-is-ATITRANID          value 022.
       78  78-SP-is-AUDALARMST         value 023.
       78  78-SP-is-AUTINSTMODEL       value 024.
       78  78-SP-is-AUTOCONNECT        value 025.
       78  78-SP-is-AUXSTATUS          value 026.
       78  78-SP-is-AVAILABLE          value 027.
       78  78-SP-is-AVAILSTATUS        value 028.
       78  78-SP-is-BACKTRANSST        value 029.
       78  78-SP-is-BACKUPTYPE         value 030.
       78  78-SP-is-BASEDSNAME         value 031.
       78  78-SP-is-BKOUTSTATUS        value 032.
       78  78-SP-is-BLOCKFORMAT        value 033.
       78  78-SP-is-BLOCKKEYLEN        value 034.
       78  78-SP-is-BLOCKSIZE          value 035.
       78  78-SP-is-BROWSE             value 036.
       78  78-SP-is-BUSY               value 037.
       78  78-SP-is-CDSASIZE           value 038.
       78  78-SP-is-CEDFSTATUS         value 039.
       78  78-SP-is-CICSSTATUS         value 040.
       78  78-SP-is-CICSSYS            value 041.
       78  78-SP-is-CMDSEC             value 042.
       78  78-SP-is-COBOLTYPE          value 043.
       78  78-SP-is-COLORST            value 044.
       78  78-SP-is-CONNSTATUS         value 78-SP-is-ACQSTATUS.
       78  78-SP-is-COPY               value 045.
       78  78-SP-is-COPYST             value 046.
       78  78-SP-is-CREATESESS         value 047.
       78  78-SP-is-CSCS               value 048.
       78  78-SP-is-CURAUXDS           value 049.
       78  78-SP-is-CURRENT            value 050.
       78  78-SP-is-CURRENTDDS         value 051.
       78  78-SP-is-CURRENTVOL         value 052.
       78  78-SP-is-CURREQS            value 053.
       78  78-SP-is-DATALOCATION       value 054.
       78  78-SP-is-DATE               value 055.
       78  78-SP-is-DEFPAGEHT          value 056.
       78  78-SP-is-DEFPAGEWD          value 057.
       78  78-SP-is-DEFSCRNHT          value 058.
       78  78-SP-is-DEFSCRNWD          value 059.
       78  78-SP-is-DELETE             value 060.
       78  78-SP-is-DEVICE             value 061.
       78  78-SP-is-DISCREQST          value 062.
       78  78-SP-is-DISKASTATUS        value 063.
       78  78-SP-is-DISKBSTATUS        value 064.
       78  78-SP-is-DISKXSTATUS        value 065.
       78  78-SP-is-DISPOSITION        value 066.
       78  78-SP-is-DSNAME             value 067.
       78  78-SP-is-DTB                value 068.
       78  78-SP-is-DTIMEOUT           value 069.
       78  78-SP-is-DTRPROGRAM         value 070.
       78  78-SP-is-DUALCASEST         value 071.
       78  78-SP-is-DUMPING            value 072.
       78  78-SP-is-ECDSASIZE          value 073.
       78  78-SP-is-ECSCS              value 074.
       78  78-SP-is-ECUSHION           value 075.
       78  78-SP-is-EMPTYSTATUS        value 076.
       78  78-SP-is-ENABLESTATUS       value 077.
       78  78-SP-is-ENTRYPOINT         value 078.
       78  78-SP-is-ERDSASIZE          value 079.
       78  78-SP-is-ERSCS              value 080.
       78  78-SP-is-EUDSASIZE          value 081.
       78  78-SP-is-EUSCS              value 082.
       78  78-SP-is-EVENTCLASS         value 083.
       78  78-SP-is-EXCEPTCLASS        value 084.
       78  78-SP-is-EXCLUSIVE          value 085.
       78  78-SP-is-EXECKEY            value 086.
       78  78-SP-is-EXECUTIONSET       value 087.
       78  78-SP-is-EXITTRACING        value 088.
       78  78-SP-is-EXTENDEDDSST       value 089.
       78  78-SP-is-FACILITY           value 090.
       78  78-SP-is-FACILITYTYPE       value 091.
       78  78-SP-is-FILECOUNT          value 092.
       78  78-SP-is-FLENGTH            value 093.
       78  78-SP-is-FMHPARMST          value 094.
       78  78-SP-is-FORMFEEDST         value 095.
       78  78-SP-is-FWDRECOVLOG        value 096.
       78  78-SP-is-FWDRECSTATUS       value 097.
       78  78-SP-is-GCHARS             value 098.
       78  78-SP-is-GCODES             value 099.
       78  78-SP-is-GMMTRANID          value 100.
       78  78-SP-is-GTFSTATUS          value 101.
       78  78-SP-is-HFORMST            value 102.
       78  78-SP-is-HILIGHTST          value 103.
       78  78-SP-is-HOLDSTATUS         value 104.
       78  78-SP-is-INDIRECTNAME       value 105.
       78  78-SP-is-INITIALDDS         value 106.
       78  78-SP-is-INTSTATUS          value 107.
       78  78-SP-is-IOTYPE             value 108.
       78  78-SP-is-JOBNAME            value 109.
       78  78-SP-is-JOURNALNUM         value 110.
       78  78-SP-is-JTYPE              value 111.
       78  78-SP-is-KATAKANAST         value 112.
       78  78-SP-is-KEYLENGTH          value 113.
       78  78-SP-is-KEYPOSITION        value 114.
       78  78-SP-is-LANGUAGE           value 115.
       78  78-SP-is-LENGTH             value 116.
       78  78-SP-is-LIGHTPENST         value 117.
       78  78-SP-is-LOADPOINT          value 118.
       78  78-SP-is-LOCATION           value 119.
       78  78-SP-is-LPASTATUS          value 120.
       78  78-SP-is-LSRPOOL            value 121.
       78  78-SP-is-LSRPOOLID          value 78-SP-is-LSRPOOL.
       78  78-SP-is-MAXIMUM            value 122.
       78  78-SP-is-MAXITEMLEN         value 123.
       78  78-SP-is-MAXNUMRECS         value 124.
       78  78-SP-is-MAXREQS            value 125.
       78  78-SP-is-MAXTASKS           value 126.
       78  78-SP-is-MAXWINNERS         value 127.
       78  78-SP-is-MINITEMLEN         value 128.
       78  78-SP-is-MODENAME           value 129.
       78  78-SP-is-MROBATCH           value 130.
       78  78-SP-is-MSRCONTROLST       value 131.
       78  78-SP-is-NATLANG            value 132.
       78  78-SP-is-NATURE             value 133.
       78  78-SP-is-NETNAME            value 134.
       78  78-SP-is-NETWORK            value 135.
       78  78-SP-is-NEWMAXTASKS        value 136.
       78  78-SP-is-NEXTTRANSID        value 137.
       78  78-SP-is-NUMITEMS           value 138.
       78  78-SP-is-OBFORMATST         value 139.
       78  78-SP-is-OBJECT             value 140.
       78  78-SP-is-OBOPERIDST         value 141.
       78  78-SP-is-OLDESTPART         value 142.
       78  78-SP-is-OPENSTATUS         value 143.
       78  78-SP-is-OPERID             value 144.
       78  78-SP-is-OPREL              value 145.
       78  78-SP-is-OPSYS              value 146.
       78  78-SP-is-OUTLINEST          value 147.
       78  78-SP-is-PAGEHT             value 148.
       78  78-SP-is-PAGESTATUS         value 149.
       78  78-SP-is-PAGEWD             value 150.
       78  78-SP-is-PART               value 151.
       78  78-SP-is-PARTITIONSST       value 152.
       78  78-SP-is-PENDSTATUS         value 153.
       78  78-SP-is-PERFCLASS          value 154.
       78  78-SP-is-PRINTADAPTST       value 155.
       78  78-SP-is-PRINTCONTROL       value 156.
       78  78-SP-is-PRINTER            value 157.
       78  78-SP-is-PRIORITY           value 158.
       78  78-SP-is-PROFILE            value 159.
       78  78-SP-is-PROGRAM            value 160.
       78  78-SP-is-PROGSYMBOLST       value 161.
       78  78-SP-is-PROGTYPE           value 162.
       78  78-SP-is-PROTOCOL           value 163.
       78  78-SP-is-PRTCOPYST          value 164.
       78  78-SP-is-PRTYAGING          value 165.
       78  78-SP-is-PURGEABILITY       value 166.
       78  78-SP-is-PURGETYPE          value 167.
       78  78-SP-is-QUERYST            value 168.
       78  78-SP-is-READ               value 169.
       78  78-SP-is-RECORDFORMAT       value 170.
       78  78-SP-is-RECORDLENGTH       value 171.
       78  78-SP-is-RECORDSIZE         value 172.
       78  78-SP-is-RECOVSTATUS        value 173.
       78  78-SP-is-RECUNITID          value 174.
       78  78-SP-is-RELEASE            value 175.
       78  78-SP-is-RELREQST           value 176.
       78  78-SP-is-RELTYPE            value 177.
       78  78-SP-is-REMOTENAME         value 178.
       78  78-SP-is-REMOTESYSTEM       value 179.
       78  78-SP-is-RESCOUNT           value 180.
       78  78-SP-is-RESSEC             value 181.
       78  78-SP-is-ROUTING            value 182.
       78  78-SP-is-RTIMEOUT           value 183.
       78  78-SP-is-RUNAWAY            value 184.
       78  78-SP-is-RUNSTATUS          value 185.
       78  78-SP-is-SCANDELAY          value 186.
       78  78-SP-is-SCREENHEIGHT       value 187.
       78  78-SP-is-SCREENWIDTH        value 188.
       78  78-SP-is-SCRNHT             value 78-SP-is-SCREENHEIGHT.
       78  78-SP-is-SCRNSIZE           value 189.
       78  78-SP-is-SCRNWD             value 78-SP-is-SCREENWIDTH.
       78  78-SP-is-SECURITY           value 190.
       78  78-SP-is-SECURITYMGR        value 191.
       78  78-SP-is-SERVSTATUS         value 192.
       78  78-SP-is-SESSIONTYPE        value 193.
       78  78-SP-is-SHARESTATUS        value 194.
       78  78-SP-is-SHUTOPTION         value 195.
       78  78-SP-is-SIGNONSTATUS       value 196.
       78  78-SP-is-SINGLESTATUS       value 197.
       78  78-SP-is-SOSIST             value 198.
       78  78-SP-is-STARTCODE          value 199.
       78  78-SP-is-STARTUP            value 200.
       78  78-SP-is-STATUS             value 201.
       78  78-SP-is-STOREPROTECT       value 202.
       78  78-SP-is-STRINGS            value 203.
       78  78-SP-is-SUSPENDTIME        value 204.
       78  78-SP-is-SUSPENDTYPE        value 205.
       78  78-SP-is-SUSPENDVALUE       value 206.
       78  78-SP-is-SWITCHACTION       value 207.
       78  78-SP-is-SWITCHSTATUS       value 208.
       78  78-SP-is-SYSDUMPING         value 209.
       78  78-SP-is-SYSTEMSTATUS       value 210.
       78  78-SP-is-TABLE              value 211.
       78  78-SP-is-TABLESIZE          value 212.
       78  78-SP-is-TASKDATAKEY        value 213.
       78  78-SP-is-TASKDATALOC        value 214.
       78  78-SP-is-TASKID             value 215.
       78  78-SP-is-TCAMCONTROL        value 216.
       78  78-SP-is-TCEXITSTATUS       value 217.
       78  78-SP-is-TCLASS             value 218.
       78  78-SP-is-TERMMODEL          value 219.
       78  78-SP-is-TERMPRIORITY       value 220.
       78  78-SP-is-TEXTKYBDST         value 221.
       78  78-SP-is-TEXTPRINTST        value 222.
       78  78-SP-is-TIME               value 223.
       78  78-SP-is-TPNAME             value 224.
       78  78-SP-is-TPNAMELEN          value 225.
       78  78-SP-is-TRACING            value 226.
       78  78-SP-is-TRANDUMPING        value 227.
       78  78-SP-is-TRANSACTION        value 228.
       78  78-SP-is-TRANSID            value 229.
       78  78-SP-is-TRIGGERLEVEL       value 230.
       78  78-SP-is-TRPROF             value 231.
       78  78-SP-is-TTISTATUS          value 232.
       78  78-SP-is-TWASIZE            value 233.
       78  78-SP-is-TYPE               value 234.
       78  78-SP-is-UCTRANST           value 235.
       78  78-SP-is-UDSASIZE           value 236.
       78  78-SP-is-UPDATE             value 237.
       78  78-SP-is-USCS               value 238.
       78  78-SP-is-USECOUNT           value 239.
       78  78-SP-is-USERAREA           value 240.
       78  78-SP-is-USERAREALEN        value 241.
       78  78-SP-is-USERID             value 242.
       78  78-SP-is-USERNAME           value 243.
       78  78-SP-is-USERSTATUS         value 244.
       78  78-SP-is-VALIDATIONST       value 245.
       78  78-SP-is-VALIDITY           value 246.
       78  78-SP-is-VERSION            value 247.
       78  78-SP-is-VFORMST            value 248.
       78  78-SP-is-XLNSTATUS          value 249.
       78  78-SP-is-XRFSTATUS          value 250.
       78  78-SP-is-ZCPTRACING         value 251.
       78  78-SP-is-CUSHION            value 252.
P25238 78  78-SP-is-ASCII              value 253.
P25238 78  78-SP-is-DATASTREAM         value 254.
P25238 78  78-SP-is-DEVICEST           value 255.
pw-029 78  78-SP-is-ISOLATEST          value 256.
pw-029 78  78-SP-is-STORAGECLEAR       value 257.
pw-029 78  78-SP-is-TRANCLASS          value 258.
pw-029 78  78-SP-is-TRANPRIORITY       value 259.
516108 78  78-SP-is-LASTUSEDINT        value 260.
peh482 78  78-SP-is-BRIDGE             value 261.
peh482 78  78-SP-is-IDENTIFIER         value 262.
peh482 78  78-SP-is-BREXIT             value 263.
peh482 78  78-SP-is-FACILITYLIKE       value 264.
027958 78  78-SP-is-ACTIVITY           value 265.
027958 78  78-SP-is-ACTIVITYID         value 266.
027958 78  78-SP-is-ATTACHTIME         value 267.
027958 78  78-SP-is-DB2PLAN            value 268.
027958 78  78-SP-is-INDOUBT            value 269.
027958 78  78-SP-is-INDOUBTMINS        value 270.
027958 78  78-SP-is-INDOUBTWAIT        value 271.
027958 78  78-SP-is-PROCESS            value 272.
027958 78  78-SP-is-PROCESSTYPE        value 273.
027958 78  78-SP-is-TCB                value 274.
027958 78  78-SP-is-UOW                value 275.
027958 78  78-SP-is-CONCURRENCY        value 276.
027958 78  78-SP-is-DYNAMSTATUS        value 277.
027958 78  78-SP-is-JVMCLASS           value 278.
027958 78  78-SP-is-JVMDEBUG           value 279.
027958 78  78-SP-is-LANGDEDUCED        value 280.
027958 78  78-SP-is-RUNTIME            value 281.
027958 78  78-SP-is-ACTOPENTCBS        value 282.
027958 78  78-SP-is-CICSTSLEVEL        value 283.
027958 78  78-SP-is-CMDPROTECT         value 284.
027958 78  78-SP-is-COLDSTATUS         value 285.
027958 78  78-SP-is-DB2CONN            value 286.
027958 78  78-SP-is-DFLTUSER           value 287.
027958 78  78-SP-is-DSALIMIT           value 288.
027958 78  78-SP-is-DSRTPROGRAM        value 289.
027958 78  78-SP-is-EDSALIMIT          value 290.
027958 78  78-SP-is-ESDSASIZE          value 291.
027958 78  78-SP-is-FORCEQR            value 292.
027958 78  78-SP-is-GMMTEXT            value 293.
027958 78  78-SP-is-GMMLENGTH          value 294.
027958 78  78-SP-is-INITSTATUS         value 295.
027958 78  78-SP-is-LOGDEFER           value 296.
027958 78  78-SP-is-MAXOPENTCBS        value 297.
027958 78  78-SP-is-OSLEVEL            value 298.
027958 78  78-SP-is-PROGAUTOCTLG       value 299.
027958 78  78-SP-is-PROGAUTOEXIT       value 300.
027958 78  78-SP-is-PROGAUTOINST       value 301.
027958 78  78-SP-is-RDSASIZE           value 302.
027958 78  78-SP-is-REENTPROTECT       value 303.
027958 78  78-SP-is-RLSSTATUS          value 304.
027958 78  78-SP-is-SDSASIZE           value 305.
027958 78  78-SP-is-SDTRAN             value 306.
027958 78  78-SP-is-SHUTSTATUS         value 307.
027958 78  78-SP-is-SOSSTATUS          value 308.
027958 78  78-SP-is-STARTUPDATE        value 309.
027958 78  78-SP-is-TRANISOLATE        value 310.
027958 78  78-SP-is-UOWSTATE           value 311.
701473 78  78-SP-is-MAPNAME            value 312.
701473 78  78-SP-is-MAPSETNAME         value 313.

      ***    The following are CICS Components for Tracing Levels

       78  78-SP-is-AP                 value 3840.
       78  78-SP-is-APPLICATION        value 78-SP-is-AP.
       78  78-SP-is-BF                 value 3841.
       78  78-SP-is-BM                 value 3842.
       78  78-SP-is-CP                 value 3843.
       78  78-SP-is-CPI                value 78-SP-is-CP.
       78  78-SP-is-DC                 value 3844.
       78  78-SP-is-DI                 value 3845.
       78  78-SP-is-DM                 value 3846.
       78  78-SP-is-DOMAINMGR          value 78-SP-is-DM.
       78  78-SP-is-DS                 value 3847.
       78  78-SP-is-DISPATCHER         value 78-SP-is-DS.
       78  78-SP-is-DU                 value 3848.
       78  78-SP-is-DUMP               value 78-SP-is-DU.
       78  78-SP-is-EI                 value 3849.
       78  78-SP-is-FC                 value 3850.
       78  78-SP-is-GC                 value 3851.
       78  78-SP-is-GLOBALCATLG        value 78-SP-is-GC.
       78  78-SP-is-IC                 value 3852.
       78  78-SP-is-IS                 value 3853.
       78  78-SP-is-JC                 value 3854.
       78  78-SP-is-KC                 value 3855.
       78  78-SP-is-KE                 value 3856.
       78  78-SP-is-KERNEL             value 78-SP-is-KE.
       78  78-SP-is-LC                 value 3857.
       78  78-SP-is-LOCALCATLG         value 78-SP-is-LC.
       78  78-SP-is-LD                 value 3858.
       78  78-SP-is-LOADER             value 78-SP-is-LD.
       78  78-SP-is-LM                 value 3859.
       78  78-SP-is-LOCKMGR            value 78-SP-is-LM.
       78  78-SP-is-ME                 value 3860.
       78  78-SP-is-MESSAGE            value 78-SP-is-ME.
       78  78-SP-is-MN                 value 3861.
       78  78-SP-is-MONITOR            value 78-SP-is-MN.
       78  78-SP-is-PA                 value 3862.
       78  78-SP-is-PARAMGR            value 78-SP-is-PA.
       78  78-SP-is-PC                 value 3863.
       78  78-SP-is-SC                 value 3864.
       78  78-SP-is-SM                 value 3865.
       78  78-SP-is-STORAGE            value 78-SP-is-SM.
       78  78-SP-is-SP                 value 3866.
       78  78-SP-is-ST                 value 3867.
       78  78-SP-is-STATISTICS         value 78-SP-is-ST.
       78  78-SP-is-SZ                 value 3868.
       78  78-SP-is-TC                 value 3869.
       78  78-SP-is-TD                 value 3870.
       78  78-SP-is-TI                 value 3871.
       78  78-SP-is-TIMER              value 78-SP-is-TI.
       78  78-SP-is-TR                 value 3872.
       78  78-SP-is-TRACE              value 78-SP-is-TR.
       78  78-SP-is-TS                 value 3873.
       78  78-SP-is-UE                 value 3874.

sc-246 78  78-MQBACK-trace             value 'QBac'.
sc-246 78  78-MQCLOSE-trace            value 'QClo'.
sc-246 78  78-MQCMIT-trace             value 'QCmt'.
sc-246 78  78-MQCONN-trace             value 'QCon'.
sc-246 78  78-MQGET-trace              value 'QGet'.
sc-246 78  78-MQINQ-trace              value 'QInq'.
sc-246 78  78-MQOPEN-trace             value 'QOpn'.
sc-246 78  78-MQPUT-trace              value 'QPut'.
sc-246 78  78-MQPUT1-trace             value 'QPt1'.
sc-246 78  78-MQSET-trace              value 'QSet'.
nf-196 78  78-MQDISC-trace             value 'QDcn'.
nf-196 78  78-MQCONNX-trace            value 'QCnX'.

nf-196 78 78-MQSeries-native-interface value 'dfh0mqis'.
nf-196 78 78-MQCONN-Native             value 'mF_MQCONN'.
nf-196 78 78-MQCONNX-Native            value 'mF_MQCONNX'.
nf-196 78 78-MJRM                    value 'MVS_JOB_STEP_RESOURCE_MGR'.

050958***--------------------------------------------------------------*
050958***                                                              *
050958*** SNA/LU6.2 constants and helpers                              *
050958***                                                              *
050958***--------------------------------------------------------------*

050958 78  78-SNA-dealloc-abnd-prg     value x'08640000'.
050958 78  78-SNA-dealloc-abnd-svc     value x'08640001'.
050958 78  78-SNA-dealloc-abnd-tmr     value x'08640002'.
050958 78  78-SNA-user-notauth         value x'080f0000'.
pw-402 78  78-SNA-sec-invalid          value x'080f6051'.

050958 78  78-RC-dealloc-abnd-timer    value 16.
050958 78  78-RC-access-denied         value 17.

      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhc8srv.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.4  2004/04/07 03:32:40  sc
      ***  sc-b42 Correct SM corruption when SOS & trace rollover;
      ***         Switch trace write from EXTFH to CBL_ functions;
      ***         Add function to display free memory and SOS;
      ***         Correct duplicate trace IDs in XA interface;
      ***         Add trace formatting for XA and JCP;
      ***         Cosmetic and editing changes to esmac displays;
      ***    Mod: casxmast.htm casgate.cbl  dfheini1.cbl dfheserv.cbl
      ***         dfhexa.cbl   dfhgdump.cbl dfhgdup.cbl  dfhgfshr.cbl
      ***         dfhgglbl.cbl dfhgini2.cbl dfhginit.cbl dfhgjcp.cbl
      ***         cascpmon.cpy dfhc8dup.cpy dfhcbtmp.cpy dfhcfdu1.cpy
      ***         dfhcfdup.cpy dfhcpdup.cpy dfhcpenq.cpy dfhcpgrq.cpy
      ***         dfhcpscp.cpy dfhcptrf.cpy dfhcptrt.cpy dfhcwdup.cpy
      ***         dfhcwdus.cpy dfhcwgen.cpy dfhcwtrt.cpy dfhzctra.cbl
      ***         dfhzload.cbl casrdo11.cbl casrdo5.cbl  casrdo6.cbl
      ***         casrdo61.cbl messages
      ***
      ***  Revision 1.3  2004/02/16 17:29:23  sc
      ***  sc-b19 Word alignment - no dependant impact on anything
      ***
      ***  Revision 1.2  1995/12/14 12:04:34  DAJC
      ***  Branches:  1.1.1
      ***  P28597 - Allow the users to enter their own titles on the GUI
      ***           dfht3270 and dfhecics. Also added support for our
      ***           Titles to be used in Windows.
      ***  Modules: dfhcpcmd.cpy dfhcpt32.cpy dfhcpt3p.cpy dfhcptlb.cpy
      ***           dfhcsnam.cpy dfhcwt32.cpy dfhcwtlb.cpy dfhecics.cbl
      ***           dfhecicw.rc  dfheini1.cbl dfheserv.cbl dfht327w.rc
      ***           dfhtinit.cbl dfhcwgen.cpy
      ***
      ***
      ***     Rev 1.1   14 Dec 1995 12:04:34   DAJC
      ***  P28597 - Allow the users to enter their own titles on the GUI
      ***           dfht3270 and dfhecics. Also added support for our
      ***           Titles to be used in Windows.
      ***  Modules: dfhcpcmd.cpy dfhcpt32.cpy dfhcpt3p.cpy dfhcptlb.cpy
      ***           dfhcsnam.cpy dfhcwt32.cpy dfhcwtlb.cpy dfhecics.cbl
      ***           dfhecicw.rc  dfheini1.cbl dfheserv.cbl dfht327w.rc
      ***           dfhtinit.cbl dfhcwgen.cpy
      ***
      ***     Rev 1.0   10 Feb 1995 11:39:58   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*

        01 work-gen.
           02 ws-return-code    pic s9(9) comp-5.
P18389     02 ws-return-code-ptr
P18389         redefines ws-return-code   pointer.
           02 ws-xi             pic s9(9) comp-5.
sc-159     02 ws-xi-pptr redefines ws-xi procedure-pointer.
           02 ws-yi             pic s9(9) comp-5.
sc-159     02 ws-yi-pptr redefines ws-yi procedure-pointer.
           02 ws-zi             pic s9(9) comp-5.
sc-159     02 ws-zi-pptr redefines ws-zi procedure-pointer.
sc-b19     02 wd-yi             pic s9(9) comp-5.
sc-b19     02 wd-y              pic 9(4)  comp-5.
           02 ws-x              pic s9(4) comp-5.
P28597     02 ws-x-save         pic s9(4) comp-5.
           02 ws-y              pic 9(4)  comp-5.
           02 ws-z              pic 9(4)  comp-5.
           02 wd-x              pic s9(4) comp-5.
sc-b19*    02 wd-yi             pic s9(9) comp-5.
sc-b19*    02 wd-y              pic 9(4)  comp-5.
sc-b42 78  78-work-gen-end                value next.
sc-b42 78  78-work-gen-length             value
sc-b42         78-work-gen-end - start of work-gen.

      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcwgen.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.21  2005/01/21 15:16:22  CORPDOM\mag
      ***  mg-018    tidy up messages in dfht3270
      ***
      ***  Modules:  dfhtinit.cbl, dfhc8rc.cpy,
      ***            dfhcpcmd.cpy, dfhcpt3p.cpy,
      ***            dfhcwcmd.cpy
      ***
      ***  Revision 1.20  2005/01/20 22:20:04  CORPDOM\njf
      ***  nx-224 - provide facility to dump shared memory as a block
      ***           without a FAQE chain dump.
      ***  Modules: dfhgtrtd.cbl dfhgdump.cbl
      ***           dfhcbpca.cpy dfhcwcmd.cpy dfhcpcmd.cpy
      ***
      ***  Revision 1.19  2004/05/03 14:06:08  sc
      ***  jes-01 Add batch Job Entry Subsystem (JES) function.
      ***    Mod: See TXMAKE.CTL header for complete list
      ***
      ***  Revision 1.18  2003/02/07 16:27:46  NJF
      ***  nx-119 - Increase the length of cmd line options
      ***           to be > 24 chars for casstart /m processing
      ***           Fix trap in trace code if region initialisation
      ***           failed.
      ***  Modules: dfhcwcmd.cpy dfhcpcrp.cpy
      ***
      ***
      ***     Rev 1.17   07 Feb 2003 16:27:46   NJF
      ***  nx-119 - Increase the length of cmd line options
      ***           to be > 24 chars for casstart /m processing
      ***           Fix trap in trace code if region initialisation
      ***           failed.
      ***  Modules: dfhcwcmd.cpy dfhcpcrp.cpy
      ***
      ***     Rev 1.16   23 Jan 2003 12:20:18   PEH
      ***  lsn002 - long and spacey name support.
      ***  modules: dfhcpfnf.cpy dfhcpcmd.cpy dfhcbcmd.cpy dfhgdup.cbl
      ***           dfhrdtup.cbl dfhcwlds.cpy dfhcwcmd.cpy dfhrdtex.cbl
      ***           dfhcnvim.cbl gnfdata.cpy gnfproc.cpy
      ***  new:     dfhcpgcp.cpy
      ***
      ***     Rev 1.15   20 Aug 2002 21:06:10   SC
      ***  sc-924 Mods to allow access to UNIKIX RLIO file system
      ***   Mod: dfhecics.cbl dfhcpcmd.cpy dfhcwcmd.cpy dfhmd.cbl
      ***        messages     casexitv.cbl mtsgate.cbl
      ***
      ***     Rev 1.14   27 Mar 2002 11:15:34   NJF
      ***  asee01 - Initial port of MFE/CICS to NX as part of
      ***           SolCorp work. Subset of CICS functionality to
      ***           be delivered as a NX AddPack.
      ***           Includes work to support long/spacey filenames
      ***           on NX/MFE and in future SX. (not complete)
      ***           This work also forms part of Web Services engine
      ***           and has attempted to keep a common code base
      ***           across all products.
      ***  Modules: cicsecm.cbl  dfh0cfg.cbl  dfh0cfgp.cbl dfh0conf.cbl
      ***           dfhebms.cbl  dfhecics.cbl dfhefctl.cbl dfheini1.cbl
      ***           dfherdio.cbl dfhetrm1.cbl dfhginit.cbl dfhmd.cbl
      ***           dfhrem.cbl   dfhtxs.cbl   mvstrig.cbl
      ***           dfhc8rts.cpy dfhcpcds.cpy dfhcpcmd.cpy dfhcpdev.cpy
      ***           dfhcpdir.cpy dfhcpism.cpy dfhcpitb.cpy dfhcplds.cpy
      ***           dfhcpmrg.cpy dfhcprdt.cpy dfhcprel.cpy dfhcpscn.cpy
      ***           dfhctxcm.cpy dfhcwcmd.cpy dfhcwdir.cpy dfhcwfnf.cpy
      ***           dfhcwism.cpy dfhcwlds.cpy dfhcwmrg.cpy dfhcwscn.cpy
      ***           dfhc8srv.cpy
      ***           makegen.cbl + more!
      ***
      ***     Rev 1.13   23 Dec 1999 15:30:08   PMW
      ***  pw-103    Extend support to use CCITCP without the need for
      ***            a CCITCP2 daemon - gateway and .
      ***            eMerge project settings into shared memory.
      ***
      ***  Modules:  dfhcbtcs.cpy, dfhc8ppc.cpy, dfhcbcsa.cpy, dfhcpcmd.cpy,
      ***            dfhcpism.cpy, dfhcpppc.cpy, dfhcprdt.cpy, dfhcwcci.cpy,
      ***            dfhcwcmd.cpy, dfhcwmqx.cpy, dfhe32db.cbl, dfheini1.cbl,
      ***            dfhginit.cbl, dfhgreqc.cbl, dfhtcci.cbl,  dfhtinit.cbl,
      ***            dfhe3270.cbl
      ***
      ***     Rev 1.12   06 Dec 1999 10:29:36   PMW
      ***  pw-097    Support for the additional of an optional path
      ***            for the backup file specified on the dfhpcupg
      ***            command line.
      ***
      ***  Modules:  dfhc8srv.cpy, dfhcwcmd.cpy, DFHPCUPG.CBL
      ***
      ***     Rev 1.11   27 Oct 1999 10:55:12   NJF
      ***  nf-191 - add pause on exit to dfhrem to allow startup
      ***           from command line in MFE under MFECL utility.
      ***  Modules: dfhrem.cbl dfhcwcmd.cpy dfhcpcmd.cpy
      ***
      ***     Rev 1.10   27 Jun 1997 14:36:38   NJF
      ***  mvs011 - add auto console daemon startup to region init.
      ***           If region creation requested (dfhrem) and the
      ***           console daemon is not active then auto-start the
      ***           daemon. When the region count goes to zero the console
      ***           daemon will automatically shutdown.
      ***  Modules: dfhtxs.cbl dfhmd.cbl dfhrem.cbl dfhcwcmd.cpy
      ***           dfhcpcmd.cpy messages txcase.cmd
      ***  New Modules: dfhcwcds.cpy dfhcpcds.cpy
      ***
      ***     Rev 1.9   02 Oct 1996 14:40:54   HPS
      ***  p32149 - JPMorgan: txse0001e security violation after update mcov4017
      ***
      ***           Change hs-043 allowed through low-value PCT security keys
      ***           so that such transactions cause a correct security
      ***           violation. Unfortunately PCT entries migrated from MCO V2.5
      ***           may have zero PCT security-keys created as the default value.
      ***           Change dfhpcupg so that such entries are flagged by
      ***           TXRB0057I, and add /z option so that they can be reset to
      ***           the correct default value with 01 key set.
      ***
      ***  Module(s): dfhpcupg.cbl  dfhcwcmd.cpy  messages
      ***
      ***     Rev 1.8   18 Jul 1996 17:08:30   JTF
      ***  p31474 - Major changes to dfhpcupg.cbl - next login should
      ***           scrub commented-out code.
      ***         - Suppress updating/refreshing SNT defs
      ***         - Force /u{userid} /p{password} for toggling security
      ***         - Changed switches /pon /poff to /ss+ /ss-
      ***         - Reworked messaging to use messages file/routines
      ***         Test(s): pending
      ***         Modules: dfhpcupg.cbl dfhcwcmd.cpy messages
      ***
      ***     Rev 1.7   27 Nov 1995 18:24:56   NJF
      ***  n41364 - add pause facility to dfhecics/dfhtxs/dfhtxp
      ***           to stop messages 'disappearing' when running
      ***           from the command line.
      ***  Modules: dfhtxs.cbl dfhtxp.cbl dfhecics.cbl dfhcwcmd.cpy
      ***           dfhcpcmd.cpy messages txcase.cmd txcase.sh
      ***           txmake.ctl
      ***  New Module: dfhpause.cbl
      ***
      ***     Rev 1.6   12 Jul 1995 11:18:58   NJF
      ***  nf-022 - changed the default of dfhgrtrm such that /tCQIT
      ***           is assumed if no command line parameters are
      ***           specified. To force a region abend (old default)
      ***           a new parameter, /f, is required.
      ***  Modules: dfhgrtrm.cbl dfhmd.cbl dfhcwcmd.cpy dfhcpcmd.cpy
      ***
      ***     Rev 1.5   06 Jul 1995 05:12:48   TJC
      ***  tcmigr : Upgrade the migration utilities to accomodate a version
      ***           3.0 to version 3.3 as well as version 2.5 to 3.3 upgrade.
      ***           The functionality to upgrade ESDS files to the new format is
      ***           currently disabled.
      ***
      ***           modules: dfhmcoc.cbl  dfhmigr.cbl dfhcwcmd.cpy dfhcpcmd.cpy
      ***                    dfhc8rdm.cpy traceid.doc
      ***                    migsrn01.srn migsrn01.ss
      ***                    migsrn02.srn migsrn02.ss
      ***                    migsrn03.srn migsrn03.ss
      ***                    migsrn04.srn migsrn04.ss
      ***                    migsrn05.srn migsrn05.ss
      ***                    migsrn06.srn migsrn06.ss
      ***                    migsrn07.srn migsrn07.ss
      ***                    migsrn08.srn migsrn08.ss
      ***                    migsrn09.srn migsrn09.ss
      ***                    migsrn0A.srn migsrn0A.ss
      ***                    migsrn0B.srn migsrn0B.ss
      ***                    migsrn0C.srn migsrn0C.ss
      ***                    migsrn0D.srn migsrn0D.ss
      ***                    migsrn0E.srn migsrn0E.ss
      ***                    migsrn0F.srn migsrn0F.ss
      ***                    migsrn0G.srn migsrn0G.ss
      ***                    migsrn0H.srn migsrn0H.ss
      ***                    migsrn0I.srn migsrn0I.ss
      ***                    migsrn0J.srn migsrn0J.ss
      ***
      ***     Rev 1.4   03 Jul 1995 16:10:30   NJF
      ***  p27294 - changed cmd len parm from 10 -> 18
      ***
      ***     Rev 1.3   30 Jun 1995 15:04:24   NJF
      ***  p27294 - added auto-start region capability to console
      ***           daemon startup. The command lines takes the
      ***           form "/s<reg1>,<reg2>" with up to 5 regions.
      ***           The region names are validated and ignore if
      ***           incorrect. The console daemon will start the
      ***           regions in the order specified, waiting until
      ***           each region has completed it's initialisation
      ***           before starting the next to avoid CPU overload.
      ***  Modules: dfhtxs.cbl dfhmd.cbl dfhcwcmd.cpy dfhcpcmd.cpy
      ***           messages   traceid.doc
      ***
      ***     Rev 1.2   06 Jun 1995 22:10:06   TJC
      ***  n30012:  Added functionality to create a development configuration
      ***           file for new regions created via the /d (development region)
      ***           switch.  The switch '/cd' will create a development configuration
      ***           file for the new region with default input/otutput directories.
      ***           The '/cg' switch will create a development configuration file
      ***           for the new region using the global configuration file as
      ***           a template.
      ***
      ***
      ***  n34684:  An appropriate error message is now issued when an attempt
      ***           is made to create a regionbase region when regionbase is set
      ***           to a non-accessable network drive or read-only local drive.
      ***
      ***     Rev 1.1   23 May 1995 19:36:04   TJC
      ***  n38229: Added '/b' switch to backup rdo file.
      ***
      ***          modules: dfhpcupg.cbl dfhcwcmd.cpy dfhc8rts.cpy
      ***
      ***     Rev 1.0   10 Feb 1995 11:37:50   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
P18615$if 78-module-trace-identifier = x'44' *> -- dfheini1
P18615  78 78-server-command-line               value 1.
P18615$end
P18615$if 78-module-trace-identifier = x'50' *> -- dfhecics
P18615  78 78-server-command-line               value 1.
P18615$end
jes-01$if 78-module-trace-identifier = x'3e' *> -- casbati1
jes-01  78 78-server-command-line               value 1.
jes-01$end

p27294$if 78-module-trace-identifier = x'06' *> -- dfhgdup
lsn002*p27294     78 78-command-parameter-len          value 128.
lsn002     78 78-command-parameter-len          value 267.
p27294$else
p27294$if 78-module-trace-identifier = x'30' *> -- dfhpcbcu
p27294     78 78-command-parameter-len          value 128.
p27294$else
p27294$if 78-module-trace-identifier = x'34' *> -- dfhtxs
p27294     78 78-command-parameter-len          value 64.
p27294$else
nx-119*p27294$if 78-module-trace-identifier = x'35' *> -- dfhmd
nx-119*p27294     78 78-command-parameter-len          value 64.
nx-119*p27294$else
tcmigr$if 78-module-trace-identifier = x'37' *> -- dfhmesds
tcmigr     78 78-command-parameter-len          value 255.
tcmigr$else
pw-098$if 78-module-trace-identifier = x'18' *> -- dfhpcupg
pw-098     78 78-command-parameter-len          value 260.
pw-098$else
pw-103*p27294     78 78-command-parameter-len          value 18.
nx-119*pw-103     78 78-command-parameter-len          value 24.
nx-119     78 78-command-parameter-len          value 260.
pw-098$end
p27294$end
nx-119*p27294$end
p27294$end
p27294$end
tcmigr$end
        01 work-cmd.
           02 ws-command-line.
              03 ws-command-line-size           pic x(2) comp-x.
lsn002*       03 ws-command-line-data           pic x(254).
lsn002        03 ws-command-line-data           pic x(4096).
p27294*sc-159$if 78-module-trace-identifier = x'06' *> -- dfhgdup
p27294*sc-159     02 ws-command-parameter              pic x(130) value spaces.
p27294*sc-159$else
p27294*n26254$if 78-module-trace-identifier = x'30' *> -- dfhpcbcu
p27294*n26254     02 ws-command-parameter              pic x(128) value spaces.
p27294*n26254$else
sc-159*    02 ws-command-parameter              pic x(10) value spaces.
p27294*sc-159     02 ws-command-parameter              pic x(18) value spaces.
p27294*sc-159$end
p27294*n26254$end
p27294     02 ws-command-parameter     pic x(78-command-parameter-len).
              88 ws-command-CCI-88              value '-C' '/C'.
              88 ws-command-uctran-88           value '-U' '/U'.
              88 ws-command-warm-start-88       value '-W' '/W'.
              88 ws-command-help-88             value '-H' '/H'
                                                      '-?' '/?' '?'.
n25969*       88 ws-command-DBCS-88             value '-D' '/D'.
n25969        88 ws-command-DBCS-88             value '-J' '/J'.
              88 ws-command-s-proc-reg-88       value '-S' '/S'.
sc-159        88 ws-command-getgcf-88           value '-G' '/G'.
sc-159        88 ws-command-getenv-88           value '-E' '/E'.
P16442        88 ws-command-dump-faqe-88        value '-F' '/F'.
djcxxx        88 ws-command-dump-nolockmem-88   value '-D' '/D'.
nx-224        88 ws-command-dump-shm-block-88   value '-B' '/B'.
sc-159        88 ws-command-getall-88           value '-A' '/A'.
sc-159        88 ws-command-test-88             value '-T' '/T'.
sc-159        88 ws-command-create-prod-88      value '-P' '/P'.
sc-159        88 ws-command-create-dev-88       value '-D' '/D'.
sc-159        88 ws-command-shut-normal-88      value '-N' '/N'.
sc-159        88 ws-command-shut-immediate-88   value '-I' '/I'.
sc-159        88 ws-command-quiesce-88          value '-W' '/W'.
nf0000        88 ws-command-shut-nolockmem-88   value '-D' '/D'.
nf0000        88 ws-command-shut-silent-88      value '-S' '/S'.
nf-022        88 ws-command-force-shutdown-88   value '-F' '/F'.
N22759        88 ws-command-cmenu-invoked-88    value '-!' '/!'.
n26498        88 ws-command-gui-animator-88     value '-G' '/G'.
n26498        88 ws-command-animator-child-88   value '-L' '/L'.
asee01$if MTS-ASEE defined
asee01        88 ws-command-animator-ide-88     value '-D' '/D'.
asee01$end (MTS-ASEE defined)
P18175        88 ws-command-TDP-88              value '-T' '/T'.
N29493        88 ws-command-more-88             value '-(' '/('.
p21839        88 ws-cmd-export-all-88           value '/A' '-A'.
p21839        88 ws-cmd-export-fct-88           value '/F' '-F'.
p21839        88 ws-cmd-export-pct-88           value '/P' '-P'.
p21839        88 ws-cmd-export-dct-88           value '/D' '-D'.
p21839        88 ws-cmd-convert-files-88        value '/CF' '-CF'.
p21839        88 ws-cmd-export-file-88          value '/EF' '-EF'.
p21839        88 ws-cmd-export-direct-88        value '/ED' '-ED'.
p21839        88 ws-cmd-export-both-88          value '/EB' '-EB'.
p21839        88 ws-cmd-export-region-88        value '/R' '-R'.
p21839        88 ws-migr-invoked-88             value '/MIGR'.
n30956        88 ws-cmd-check-migrstat-88       value '/C' '-C'.
tjcx25        88 ws-cmd-start-open-no-88        value '/SN' '-SN'.
tjcx25        88 ws-cmd-start-open-yes-88       value '/SY' '-SY'.
p31474        88 ws-cmd-set-security-on-88      value '/SS+' '-SS+'.
p31474        88 ws-cmd-set-security-off-88     value '/SS-' '-SS-'.
p32149        88 ws-cmd-reset-PCT-seckey-88     value '/Z' '-Z'.
n38229        88 ws-cmd-bkup-file-88            value '/B' '-B'.
tcmigr        88 ws-cmd-create-esds-bfile-88    value '/B' '-B'.
n30012        88 ws-cmd-create-using-global-88  value '/CG' '-CG'.
n30012        88 ws-cmd-create-using-default-88 value '/CD' '-CD'.
tcmigr        88 ws-cmd-migr-from-V25-88        value '/M25' '-M25'.
tcmigr        88 ws-cmd-migr-from-V30-88        value '/M30' '-M30'.
tcmigr        88 ws-cmd-create-esds-cmdfile-88  value '/S' '-S'.
n41364        88 ws-cmd-pause-on-exit-88        value '/Q' '-Q'.
mvs011        88 ws-command-auto-shutdown-88    value '-A' '/A'.
sc-924        88 ws-cmd-unikix-recovery-88      value '/K' '-K'.
           02 ws-command-flag                   pic x.
              88 ws-command-error-88            value 'e'.
mg-018        88 ws-command-error-help-88       value 'h'.              
           02 ws-dbcs-flag                      pic x.
              88 ws-dbcs-request-88             value 'd'.
sc-159*    02 ws-command-lower                  pic x(8) value spaces.
p27294*sc-159$if 78-module-trace-identifier = x'06' *> -- dfhgdup
p27294*sc-159     02 ws-command-lower                  pic x(130).
p27294*sc-159$else
p27294*n26254$if 78-module-trace-identifier = x'30' *> -- dfhpcbcu
p27294*n26254     02 ws-command-lower                  pic x(128) value spaces.
p27294*n26254$else
p27294*sc-159     02 ws-command-lower                  pic x(18).
p27294*sc-159$end
p27294*n26254$end
p27294     02 ws-command-lower         pic x(78-command-parameter-len).
           02 ws-auto-install-model             pic x(8) value spaces.
           02 ws-cmd-dfhgreq-name               pic x(8).
              88 ws-cmd-dfhgreq-88              value 'dfhgreq'.
              88 ws-cmd-dfhgreqc-88             value 'dfhgreqc'.
           02 ws-SIT-overide                    pic x(8) value spaces.
              88 ws-SIT-default-88              value spaces.
           02 ws-warm-start-flag                pic x comp-x value 0.
              88 ws-warm-start-88               value 1.
sc-924$if MTS-ASEE defined
sc-924     02 ws-unikix-flag                    pic x comp-x value 0.
sc-924        88 ws-unikix-recovery-start-88    value 1.
sc-924$end (MTS-ASEE defined)
           02 ws-animate-flag                   pic x comp-x value 0.
n26498        88 ws-animate-none-88             value 0.
              88 ws-animate-term-88             value 1.
              88 ws-animate-tran-88             value 2.
n24512        88 ws-animate-any-88              value 3.
              88 ws-animate-serv-88m            value 1 2.
n24512     02 ws-animate-flag-2                 pic x comp-x value 0.
n24512        88 ws-animator-invoked-88         value 1.
n24512        88 ws-animator-child-88           value 2.
n26498     02 ws-animate-flag-3                 pic x comp-x value 0.
asee01$if MTS-ASEE defined
asee01        88 ws-animator-ide-88             value 1.
asee01$end (MTS-ASEE defined)
n26498        88 ws-gui-animator-88             value 1.
           02 ws-single-process-region-flag     pic x comp-x value 0.
              88 ws-single-process-region-88    value 1.
njfx92     02 ws-ds3270-session-id              pic x comp-x value 0.
njfx92     02 ws-ds3270-session-id-x            pic x.
njfx92        88 ws-ds3270-session-a-88         value 'A'.
njfx92        88 ws-ds3270-session-b-88         value 'B'.
njfx92        88 ws-ds3270-session-c-88         value 'C'.
njfx92        88 ws-ds3270-session-d-88         value 'D'.
njfx92        88 ws-valid-ds3270-session-id-88m value 'A'
njfx92                                                'B'
njfx92                                                'C'
njfx92                                                'D'.
sc-170*njfx91     02 ws-CCI-comms-protocol             pic x(8) value spaces.
sc-170*njfx91        88 ws-valid-CCI-protocol-88m      value 'CCITCP'
sc-170*njfx91$IF OSMCO = "OS2"
sc-170*njfx91                                                'CCINETB'
sc-170*njfx91                                                'CCIIPX'
sc-170*nf0000*njfx91                                                'CCINAMP'
sc-170*nf0000                                                'CCINAMP'.
sc-170*nf0000*njfx91                                                'CCIAPPC'.
sc-170*njfx91$END
sc-170*djgx01$IF OSMCO = "DOS"
sc-170*djgx01                                                'CCINETB'
sc-170*djgx01                                                'CCIIPX'
sc-170*nf0000*djgx01                                                'CCINAMP'
sc-170*nf0000                                                'CCINAMP'.
sc-170*nf0000*djgx01                                                'CCIAPPC'.
sc-170*djgx01$END
sc-170*njfx91$IF OSMCO = "UNIX"
sc-170*njfx91                                                'CCINAMPU'.
sc-170*njfx91$END
nf0000     02                           value 0 pic x comp-x.
nf0000        88 ws-close-region-88             value 1.
nf0000     02 ws-shutdown-password              pic x(8).
nf0000     02 ws-shutdown-userid                pic x(8).
nf0000     02 ws-shutdown-transaction           pic x(4).
nf0000     02                           value 0 pic x comp-x.
nf0000        88 ws-shutdown-no-lockmem-88      value 1.
nf0000     02                           value 0 pic x comp-x.
nf0000        88 ws-shutdown-silent-88          value 1.
nf-022     02                           value 0 pic x comp-x.
nf-022        88 ws-shutdown-forced-88          value 1.
N25083$IF 78-ws-invoked-from-cmenu-flg NOT DEFINED
N25083 78 78-ws-invoked-from-cmenu-flg  value 0.
N22759     02 ws-invoked-from-cmenu-flg value 0 pic x comp-x.
N22759*    02                           value 0 pic x comp-x.
N22759        88 ws-invoked-from-cmenu-88       value 1.
N25083$END
djcxxx     02                           value 0 pic x comp-x.
djcxxx        88 ws-dump-no-lockmem-88          value 1.
N29493     02 ws-command-other-opts             pic x(128).
n41364     02                           value 0 pic x comp-x.
n41364        88 ws-pause-on-exit-88            value 1.
njfx93*djgx03$IF OSMCO not = 'UNIX'
njfx93*djgx03    01 ws-TXDIR-lib                    pic x(132).
njfx93*djgx03$END
p27294$if 78-module-trace-identifier = x'34' *> -- dfhtxs
p27294     02 ws-start-region-count            pic x comp-x.
p27294     02 ws-start-region-list.
p27294        03 ws-start-region occurs 5 times
p27294                                         pic x(8).
p27294$end
p27294$if 78-module-trace-identifier = x'35' *> -- dfhmd
p27294     02 ws-start-region-count            pic x comp-x.
p27294     02 ws-start-region-list.
p27294        03 ws-start-region occurs 5 times
p27294                                         pic x(8).
p27294$end
nf-191$if 78-module-trace-identifier = x'0b' *> -- dfhrem
nf-191     02 ws-pause-interval                pic x(4) comp-5.
nf-191     02 wd-dy                            pic x(2) comp-5.
nf-191     02 ws-pause-char.
nf-191        03 ws-pause-char-x occurs 9 times.
nf-191           04 ws-pause-char-9            pic 9.
nf-191$end
      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcwcmd.cpy  $ end
      ***-------------------------------------------------------------*

       01 x91-result  pic x comp-x.
       01 x91-func-set-rts-switches   pic x comp-x  value 13.
       01 x91-func-read-rts-switches  pic x comp-x  value 14.
       01 x91-parms-rts-switches.
          03  x91-parms-rts-switch  occurs 26 pic x comp-x.
       01  error-message           pic x(60).
       01  error-ret-cde           redefines error-message.
           03  error-return        pic 9(9).
           03  filler              pic x(51).

      $IF OSMCO = 'UNIX'
       01  errno                       pic x(4) comp-5 is external.
      $ELSE
       01  errno                       pic x(4) comp-5.
      $END

       linkage section.
      ***-- config data area

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.14  2005/10/16 20:57:09  njf
      ***  nx-267 - Increase config buffer sizes to support longer
      ***           concatenated directories. Fix problem with debug
      ***           JES initiators not being deregistered at termination.
      ***           Add terminal definitions for 3270 bridge support in ES.
      ***           Various minor fixes/enhancements.
      ***  Modules: dfhecics.cbl dfheini1.cbl dfhgglbl.cbl dfh0cfg.cbl
      ***           dfhtex32.cbl
      ***           dfhc8rts.cpy dfhcbcfa.cpy dfhcpdup.cpy dfhcwenv.cpy
      ***           dfhcwlds.cpy dfhcwini.cpy
      ***
      ***  Revision 1.13  2002/11/04 17:46:54  PMW
      ***  aix018    Missing from aix017 work.
      ***  Modules:  dfhcbcfa.cpy
      ***
      ***  
      ***     Rev 1.12   Nov 04 2002 17:46:54   PMW
      ***  aix018    Missing from aix017 work.
      ***  Modules:  dfhcbcfa.cpy
      ***  
      ***     Rev 1.11   17 Oct 2002 14:42:14   NJF
      ***  nx-066 - Provide ability to dynamically generate IDTs for system
      ***           administration requests.
      ***           Updates to RTS interface based on latest spec.
      ***           Change TXRFDIR to be <work-dir>\<regname>.
      ***           Add support for environment variable specification within
      ***           Medusa, $TXRFDIR\<regname>.env contains env vars.
      ***           Update for latest Medusa/mfdsa interface.
      ***  Modules: dfhginit.cbl dfheini1.cbl dfheserv.cbl dfh0cfgp.cbl
      ***           casasrvc.cbl dfh0cfg.cbl  dfhmd.cbl
      ***           dfhcprdt.cpy dfhcwver.cpy cascwrdt.cpy dfhc8srv.cpy
      ***           cascbctl.cpy dfhcpism.cpy dfhcbcfa.cpy  dfhcbmgr.cpy
      ***           dfhcplck.cpy cascbcfg.cpy
      ***           txmake.ctl   messages 
      ***  New modules: casadmin.cbl cascbadm.cpy
      ***  
      ***     Rev 1.10   14 Sep 2002 18:49:00   SC
      ***  sc-927 UNIX semaphore work
      ***   Mods: dfhcbpca.cpy dfhcpgrq.cpy dfhcpipc.cpy dfhcpkcp.cpy
      ***         dfhcwkcp.cpy dfhginit.cbl dfhcwlds.cpy dfhcbcfa.cpy
      ***         dfhgreqi.cbl dfhgerr.cbl  dfhtcci.cbl  dfhcpkcw.cpy
      ***         dfhcpkci.cpy dfhgglbl.cbl dfhgerr2.cbl valerorh.cbl
      ***         dfhgrtrm.cbl dfheuser.cbl dfhcbcsa.cpy dfheserv.cbl
      ***         cashtsrv.cbl dfhetrm1.cbl dfhgterm.cbl dfhmd.cbl
      ***
      ***     Rev 1.9   11 Apr 2002 10:53:42   NJF
      ***  - remove leading underscore from
      ***  _mf_directory_to_internal RTS API
      ***  Modules: dfh0cfg.cbl dfhcbcfa.cpy
      ***
      ***     Rev 1.8   27 Mar 2002 14:40:02   NJF
      ***  asee01 - Initial port of MFE/CICS to NX as part of
      ***           SolCorp work. Subset of CICS functionality to
      ***           be delivered as a NX AddPack.
      ***           Includes work to support long/spacey filenames
      ***           on NX/MFE and in future SX. (not complete)
      ***           This work also forms part of Web Services engine
      ***           and has attempted to keep a common code base
      ***           across all products.
      ***  Modules: cicsecm.cbl  dfh0cfg.cbl  dfh0cfgp.cbl dfh0conf.cbl
      ***           dfhebms.cbl  dfhecics.cbl dfhefctl.cbl dfheini1.cbl
      ***           dfherdio.cbl dfhetrm1.cbl dfhginit.cbl dfhmd.cbl
      ***           dfhrem.cbl   dfhtxs.cbl   mvstrig.cbl
      ***           dfhc8rts.cpy dfhcpcds.cpy dfhcpcmd.cpy dfhcpdev.cpy
      ***           dfhcpdir.cpy dfhcpism.cpy dfhcpitb.cpy dfhcplds.cpy
      ***           dfhcpmrg.cpy dfhcprdt.cpy dfhcprel.cpy dfhcpscn.cpy
      ***           dfhctxcm.cpy dfhcwcmd.cpy dfhcwdir.cpy dfhcwfnf.cpy
      ***           dfhcwism.cpy dfhcwlds.cpy dfhcwmrg.cpy dfhcwscn.cpy
      ***           dfhc8srv.cpy
      ***           makegen.cbl + more!
      ***
      ***     Rev 1.7   16 Nov 1998 15:57:56   NJF
      ***  mvs089 - location of PL/I product has moved again.
      ***           Now determine location from MFPLI component
      ***           rather than registry.
      ***           Also added start of LE support in MFE.
      ***           Made makegen self-resident on new painter.
      ***  Modules: dfh0cfg.cbl  dfh0cfgp.cbl dfheini1.cbl dfheibmq.cbl
      ***           dfhcwitb.cpy dfhcpitb.cpy dfhcbitb.cpy dfhc8rts.cpy
      ***           dfhcbcfa.cpy
      ***           makegen.cbl
      ***
      ***
      ***     Rev 1.6   18 Sep 1996 09:44:42   NJF
      ***  nf-136 - Enablement of exception popup diagnostic
      ***           information (incomplete). Current implementation
      ***           only works in single tasking on non-UNIX platforms.
      ***           Can be enabled/disabled by config item, EXPOPUP.
      ***  Modules: dfheapup.cbl dfheuser.cbl dfheini1.cbl dfh0cfg.cbl
      ***           dfhcwtrf.cpy dfhcbcfa.cpy txmake.ctl
      ***
      ***     Rev 1.5   14 Dec 1995 11:38:28   NJF
      ***  p25259 - Added config item to control addition of TRANPATH
      ***           directories to COBDIR in preparation for MJW's work.
      ***           TRANCOBDIR has values P,A and N for prepend TRANPATH
      ***           to COBDIR, append TRANPATH to COBDIR and do not
      ***           place TRANPATH on COBDIR respectively.
      ***  Modules: dfh0cfg.cbl dfhcbcfa.cpy dfh0cfgp.cbl
      ***
      ***     Rev 1.4   13 Oct 1995 17:03:20   NJF
      ***  p29091 - First time processing in the system (no gcf.bin)
      ***           causes Cfg-Reg-Rescan to be false until an InitGCA
      ***           call. Changed default to true and reset it to false
      ***           just before InitGCA processing.
      ***  Modules: dfh0cfg.cbl dfh0cfgp.cbl dfhcbcfa.cpy
      ***
      ***     Rev 1.3   02 Oct 1995 09:51:36   NJF
      ***  nf-050 - made the region name case conversions conditional
      ***           on a new, internal, config item REGCASE. Changed
      ***           console daemon to be case insensitive on region names
      ***           on non-UNIX platforms.
      ***  Modules: dfh0cfg.cbl  dfh0cfgp.cbl dfhtxs.cbl  dfhmd.cbl
      ***           dfhcbcfa.cpy
      ***
      ***     Rev 1.2   27 Sep 1995 13:37:32   CHJB
      ***  cjbebc - add a not specified state for codeset default
      ***
      ***     Rev 1.1   21 Sep 1995 17:15:36   CHJB
      ***  cjbebc Add flag to DFHTXDEV.CFG dfltcset to indicate whether
      ***         development system shoud default to ASCII or EBCDIC
      ***         modules dfh0cfgp.cbl dfh0cfg.cbl dfhcbcfa.cpy
      ***
      ***     Rev 1.0   10 Feb 1995 11:28:38   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
      *** Define constants for default configuration values
      $IF OSMCO = "UNIX"
         78 78-lib              value '/lib'.
         78 78-tran-usr         value '/tran/usr'.
         78 78-tran-sys         value '/tran/sys'.
         78 78-map-usr          value '/map/usr'.
         78 78-map-sys          value '/map/sys'.
         78 78-files-usr        value '/files/usr'.
         78 78-files-sys        value '/files/sys'.
         78 78-files-reg        value '/files/reg'.
      $ELSE
         78 78-lib              value '\lib'.
         78 78-tran-usr         value '\tran\usr'.
         78 78-tran-sys         value '\tran\sys'.
         78 78-map-usr          value '\map\usr'.
         78 78-map-sys          value '\map\sys'.
         78 78-files-usr        value '\files\usr'.
         78 78-files-sys        value '\files\sys'.
         78 78-files-reg        value '\files\reg'.
      $END
      ***-- Region Transaction Path
         78 78-dflt-RTRANPATH   value 78-TXRDIR-env-path
                                    & 78-tran-usr.
      ***-- Region Map Path
         78 78-dflt-RMAPPATH    value 78-TXRDIR-env-path
                                    & 78-map-usr.
      ***-- Region User File Path
         78 78-dflt-RFILEPATH   value 78-TXRDIR-env-path
                                    & 78-files-usr.
      ***-- Global Transaction Path
         78 78-dflt-TRANPATH    value 78-TXDIR-env-path
                                    & 78-tran-usr.
      ***-- Global Map Path
         78 78-dflt-MAPPATH     value 78-TXDIR-env-path
                                    & 78-map-usr.
      ***-- Global User File Path
         78 78-dflt-FILEPATH    value 78-TXDIR-env-path
                                    & 78-files-usr.
         78 78-dflt-LOGDIR      value 78-TXDIR-env-path
                                    & 78-files-sys.
         78 78-dflt-UGRPID      value 50001.
         78 78-dflt-DGRPID      value 50002.
         78 78-dflt-AGRPID      value 50003.
         78 78-dflt-OGRPID      value 50004.
aix018   78 78-cobdir-etc-cas   value '$COBDIR/etc/cas'.
sc-927$if UNIX defined
sc-927   78 78-dflt-CONFLAG     value 1.
sc-927$else (UNIX defined)
         78 78-dflt-CONFLAG     value 0.
sc-927$end not (UNIX defined)
         78 78-TRANPATH-index   value 1.
         78 78-MAPPATH-index    value 2.
         78 78-FILEPATH-index   value 3.
         78 78-LOGDIR-index     value 4.
         78 78-FHREDIR-index    value 5.
         78 78-RDTDIR-index     value 6.
         78 78-RGBASE-index     value 7.
         78 78-TXCBLSRC-index   value 1.
         78 78-TXBMSSRC-index   value 2.
         78 78-TXCPYSRC-index   value 3.
n30454*  78 78-TXMFSSRC-index   value 4.
n30454*  78 78-TXCBLGNT-index   value 5.
n30454*  78 78-TXBMSMST-index   value 6.
n30454*  78 78-TXBMSCPY-index   value 7.
n30454   78 78-TXCBLGNT-index   value 4.
n30454   78 78-TXBMSMST-index   value 5.
n30454   78 78-TXBMSCPY-index   value 6.
      ***
      *** Define layout of configuration area.
      ***
asee01   *> ---------------------------------------------------------
asee01   *> --  NOTE: to support long + spacey paths the CfgArea   --
asee01   *> --  variables are now stored in internal format.       --
asee01   *> --  This means that the paths are null terminated.     --
asee01   *> --  CBL_ routines expect paths to be specified in      --
asee01   *> --  external format, that is quoted for spacey paths.  --
asee01   *> --                                                     --
asee01   *> --  CBL_FILENAME_CONVERT can be used to convert        --
asee01   *> --  between internal and external format               --
asee01   *> --                                                     --
asee01   *> --  mF_directory_to_internal can be used to convert    --
asee01   *> --  a path into internal format (ie null terminate)    --
asee01   *> --                                                     --
asee01   *> ---------------------------------------------------------
         01 CfgArea.
            02 Cfg-System-Area.
               03 Cfg-Path-Vars.
nx-267*           05 Cfg-TRANPATH  pic x(78-max-line-length).
nx-267*           05 Cfg-MAPPATH   pic x(78-max-line-length).
nx-267*           05 Cfg-FILEPATH  pic x(78-max-line-length).
nx-267*           05 Cfg-LOGDIR    pic x(78-max-line-length).
nx-267*           05 Cfg-FHREDIR   pic x(78-max-line-length).
nx-267*           05 Cfg-RDTDIR    pic x(78-max-line-length).
nx-267*           05 Cfg-RGBASE    pic x(78-max-line-length).
nx-267*P18262            05 Cfg-TXRFDIR   pic x(78-max-line-length).
nx-267            05 Cfg-TRANPATH  pic x(78-max-mpath-length).
nx-267            05 Cfg-MAPPATH   pic x(78-max-mpath-length).
nx-267            05 Cfg-FILEPATH  pic x(78-max-mpath-length).
nx-267            05 Cfg-LOGDIR    pic x(78-max-mpath-length).
nx-267            05 Cfg-FHREDIR   pic x(78-max-mpath-length).
nx-267            05 Cfg-RDTDIR    pic x(78-max-mpath-length).
nx-267            05 Cfg-RGBASE    pic x(78-max-mpath-length).
nx-267            05 Cfg-TXRFDIR   pic x(78-max-mpath-length).
               03  redefines Cfg-Path-Vars.
nx-267*            05 Cfg-Path      pic x(78-max-line-length)
nx-267             05 Cfg-Path      pic x(78-max-mpath-length)
P18262*               occurs 7 times.
P18262                occurs 8 times.
               03 Cfg-MQKEY        pic x(4) comp-5.
               03 Cfg-CDPID        pic x(4) comp-5.
               03 Cfg-CONFLAG      pic x comp-x.
                  88 Cfg-CONFLAG-Y-88 value 0.
                  88 Cfg-CONFLAG-N-88 value 1.
               03 Cfg-REG-rescan-f pic x comp-x.
p29091*           88 Cfg-REG-rescan-88 value 1.
p29091            88 Cfg-REG-rescan-88 value 1
p29091                                 false 0.
P18262*        03                  pic x(2).
P18262         03 Cfg-TXRFDIR-offset pic x(2) comp-5.
               03 Cfg-USERGRPID    pic x(4) comp-5.
               03 Cfg-DEVGRPID     pic x(4) comp-5.
               03 Cfg-ADMINGRPID   pic x(4) comp-5.
               03 Cfg-OPERGRPID    pic x(4) comp-5.
               03 Cfg-REGION       pic x(8).
               03 Cfg-DBNAME       pic x(32).
               03 Cfg-DBPASSWD     pic x(32).
            02 Cfg-Region-Area.
               03 Cfg-SIT          pic x(8).
               03 Cfg-Shm-Sem-Key  pic x(4) comp-5.
nfd016         03 Cfg-Shm-Handle   pic x(4) comp-5.
p18656         03 Cfg-Single-Tasking-flag      pic x comp-x.
p18656            88 Cfg-Single-Tasking-88     value 0
p18656                                         false 1.
p18656         03                              pic x comp-x.
p18656            88 Cfg-region-log-active-88  value 0
p18656                                         false 1.
n33079*p18656         03                  pic x(2).
n33079         03                              pic x comp-x.
n33079            88 Cfg-SYSDEFAULT-88         value 0
n33079                                         false 1.
nf-050*n33079         03                  pic x.
nf-050         03                          pic x comp-x.
nf-050            88 Cfg-REGCASE-88        value 0
nf-050                                     false 1.
p25259         03                              pic x comp-x.
p25259            88 Cfg-TRANCOBDIR-off-88     value 0.
p25259            88 Cfg-TRANCOBDIR-append-88  value 1.
p25259            88 Cfg-TRANCOBDIR-prepend-88 value 2.
nf-136*p25259         03                          pic x(3).
nf-136         03                          pic x comp-x.
nf-136            88 Cfg-EXPOPUP-unhandled-88  value 0.
nf-136            88 Cfg-EXPOPUP-off-88        value 1.
nf-136            88 Cfg-EXPOPUP-all-88        value 2.
mvs089*nf-136         03                          pic x(2).
mvs089         03 Cfg-LE-Active-Flag       pic x comp-x.
mvs089            88 Cfg-LE-Active-88      value 1
mvs089                                     false 0.
mvs089         03                          pic x.
aix018   78 78-Cfg-Area-end        value next.
aix018      *> -- Not interested in saving these!
nx-066      02 Cfg-Env-Area.
nx-066         03 Cfg-Env-ptr              pointer.
nx-066         03 Cfg-Env-len              pic x(4) comp-5.
aix018*  78 78-Cfg-Area-end        value next.
            02 Cfg-Dev-Area.
               03 Cfg-Dev-Path-Vars.
                  05 Cfg-TXCBLSRC  pic x(78-max-line-length).
                  05 Cfg-TXBMSSRC  pic x(78-max-line-length).
                  05 Cfg-TXCPYSRC  pic x(78-max-line-length).
n30454*           05 Cfg-TXMFSSRC  pic x(78-max-line-length).
                  05 Cfg-TXCBLGNT  pic x(78-max-line-length).
                  05 Cfg-TXBMSMST  pic x(78-max-line-length).
                  05 Cfg-TXBMSCPY  pic x(78-max-line-length).
                  05 Cfg-TXCURDIR  pic x(78-max-line-length).
               03  redefines Cfg-Dev-Path-Vars.
                  05 Cfg-Dev-Path  pic x(78-max-line-length)
N30454*               occurs 8 times.
N30454                occurs 7 times.
               03 Cfg-Dev-Region   pic x(8).
               03 Cfg-Dev-SIT      pic x(8).
               03 Cfg-Dev-Group    pic x(8).
cjbebc         03 Cfg-Dev-EBC-flag pic x.
cjbebc            88 Cfg-default-is-ebc-88     value 'E'.
cjbebc            88 Cfg-default-is-asc-88     value 'A'.
cjbebc            88 Cfg-default-cset-not-set-88
cjbebc                                         value ' '.
         78 78-Cfg-DevArea-end     value next.
         78 78-Cfg-Area-Length     value
                          78-Cfg-Area-End - start of CfgArea.
         78 78-Cfg-DevArea-Length     value
                          78-Cfg-DevArea-End - start of Cfg-Dev-Area.

         78 78-CfgGetAddr          value 'dfh0cfgp'.
      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcbcfa.cpy  $ end
      ***-------------------------------------------------------------*

      ***-------------------------------------------------------------*
      *** Revision History                                            *
      ***-------------------------------------------------------------*
      ***  $Log: mfmemqlist.cbl,v $
      ***  Revision 1.1  2006/03/22 10:28:31  lb
      ***  Added call to mfmemqlist for message queue verification and removal.
      ***
      ***  Revision 1.2  2003/01/23 12:18:56  PEH
      ***  lsn002 - long and spacey name support.
      ***  modules: dfhcpfnf.cpy dfhcpcmd.cpy dfhcbcmd.cpy dfhgdup.cbl
      ***           dfhrdtup.cbl dfhcwlds.cpy dfhcwcmd.cpy dfhrdtex.cbl
      ***           dfhcnvim.cbl gnfdata.cpy gnfproc.cpy
      ***  new:     dfhcpgcp.cpy
      ***
      ***  
      ***     Rev 1.1   23 Jan 2003 12:18:56   PEH
      ***  lsn002 - long and spacey name support.
      ***  modules: dfhcpfnf.cpy dfhcpcmd.cpy dfhcbcmd.cpy dfhgdup.cbl
      ***           dfhrdtup.cbl dfhcwlds.cpy dfhcwcmd.cpy dfhrdtex.cbl
      ***           dfhcnvim.cbl gnfdata.cpy gnfproc.cpy
      ***  new:     dfhcpgcp.cpy
      ***  
      ***     Rev 1.0   10 Feb 1995 11:28:48   AJD
      ***  New MCO source stream Feb 1995 - Initial Revision
      ***-------------------------------------------------------------*
        01 ls-pass-param.
           03 ls-pass-size   pic x(2) comp-x.
           03 ls-pass-data.
lsn002*       04 pic x occurs 0 to 256 times
lsn002        04 ls-pass-char pic x occurs 0 to 4096 times
                   depending on ls-pass-size.
      ***-------------------------------------------------------------*
      ***  $Workfile:   dfhcbcmd.cpy  $ end
      ***-------------------------------------------------------------*

       PROCEDURE DIVISION.

           call x'91' using
             x91-result
             x91-func-read-rts-switches
             x91-parms-rts-switches
           end-call
           move 32 to x91-parms-rts-switch (19)
           call x'91' using
             x91-result
             x91-func-set-rts-switches
             x91-parms-rts-switches
           end-call

          call '$TXDIR/lib/dfh0cfg' using
              CfgRB

      *   process-command-line.
              accept ws-command-line-data from command-line

      *    Get memory queue address.
           set address of CfgArea      to CfgRB-CfgArea-ptr
      
           move 0                      to MsgRB-Number
      

           move ws-command-line-data
                                   to Cfg-REGION

           move 78-MsgIB-NumInserts   to MsgRB-NumInserts
           perform test after varying MsgRB-index from 1 by 1
            until MsgRB-index = 78-MsgIB-NumInserts
              set MsgIB-Index         to MsgRB-Index
              set MsgRB-Insert-ptr(MsgRB-index)
                                      to address of
                                         MsgIB-Buffer(MsgIB-index)
           end-perform
           move 0                     to MsgRB-NumInserts
           set MsgRB-Clear-Dests-88      to true
           set MsgRB-Send-to-StdErr-88   to true
           .

           call 78-CfgInitGCA
               using CfgRB
           end-call

               call 78-CfgInitRCA
                   using CfgRB
               end-call
               call 78-CfgGetGCA
                   using CfgRB

      *    display 'Message queue key'
           display Cfg-MQKEY

