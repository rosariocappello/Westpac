
      ****************************************************************
      * Copyright (C) Micro Focus 1988-2019. All rights reserved.
      *
      * This sample code is supplied for demonstration purposes only
      * on an "as is" basis and is for use at your own risk.
      *
      ****************************************************************
       working-storage section.

      *  Include the SQL Communications Area. This includes the
      *  definitions of SQLCODE, etc
           EXEC SQL INCLUDE SQLCA END-EXEC

           EXEC SQL BEGIN DECLARE SECTION END-EXEC
       01 svr pic x(32) varying.
       01 usr pic x(32)  varying.
       01 pass pic x(32) varying.
       01 usr-pass pic x(64).
           EXEC SQL END DECLARE SECTION END-EXEC.

       procedure division.
      *        Connect to a database
           display "Connect statement tests"
           display " "
           display "Enter data source name "
             with no advancing
      *  	   accept svr

           display "Enter username "
             with no advancing
      *  	   accept usr

           display "Enter password "
             with no advancing
      *  	   accept pass
           move "orcl1" to svr
           move 5 to svr-len
           move "mfuser" to usr
           move 6 to  usr-len
           move "Welcome01" to pass
           move 8 to  pass-len

      *        Test 1 - Basic OpenESQL style connect

           move space to usr-pass
           string
             usr delimited space
             "." delimited size
             pass delimited space
             into usr-pass
           end-string
           display "Test 1:" usr-pass

               EXEC SQL
                    CONNECT :USR IDENTIFIED BY :PASS
                    AT :svr
                END-EXEC.
           if sqlcode not = 0
               display "Error: cannot connect "
               display sqlcode
               display sqlerrmc
      *           stop run
           end-if
           display "Test 1: OK"

      *  	   EXEC SQL
      *  	       DISCONNECT CURRENT
      *  	   END-EXEC

           if sqlcode not = 0
               display "Error: cannot disconnect "
               display sqlcode
               display sqlerrmc
      *                 stop run
           end-if

      *        Test 2 - OpenESQL style connect with no prompt and slash .
      *                 WITH PROMPT is an option only supported on PC
      *                platforms.

           move space to usr-pass
           string
             usr delimited space
             "/" delimited size
             pass delimited space
             into usr-pass
           end-string

           display "Test 2:" usr-pass
      *       EXEC SQL
      *  	       CONNECT TO :svr USER :usr-pass WITH NO PROMPT
      *  	  END-EXEC

           if sqlcode not = 0
               display "Error: cannot connect "
               display sqlcode
               display sqlerrmc
      *                 stop run
           end-if

           display "Test 2: OK"

      *  	   EXEC SQL
      *  	       DISCONNECT DEFAULT
      *  	   END-EXEC

           if sqlcode not = 0
               display "Error: cannot disconnect "
               display sqlcode
               display sqlerrmc
      *                 stop run
           end-if

      *    Test 3 - Oracle style connect with combined user and password

           move space to usr-pass
           string
             usr delimited space
             "/" delimited size
             pass delimited space
             into usr-pass
           end-string

           display "Test 3:" usr-pass
      *  	   EXEC SQL
      *  	       CONNECT :usr-pass USING :svr
      *  	   END-EXEC

           if sqlcode not = 0
               display "Error: cannot connect "
               display sqlcode
               display sqlerrmc
      *                 stop run
           end-if
           display "Test 3: OK"

      *  	   EXEC SQL
      *  	       DISCONNECT
      *  	   END-EXEC
           if sqlcode not = 0
               display "Error: cannot disconnect "
               display sqlcode
               display sqlerrmc
      *            stop run
           end-if

      * Test 4 - Oracle style connect with separate user and password
           display "Test 4:"
           EXEC SQL
               CONNECT :usr IDENTIFIED BY :pass USING :svr
           END-EXEC
           if sqlcode not = 0
               display "Error: cannot connect "
               display sqlcode
               display sqlerrmc
      *          stop run
           end-if
           display "Test 4: OK"

      *  	   EXEC SQL
      *  	       DISCONNECT ALL
      *  	   END-EXEC

           if sqlcode not = 0
               display "Error: cannot disconnect "
               display sqlcode
               display sqlerrmc
      *                stop run
           end-if

           stop run
           .
