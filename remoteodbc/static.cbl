      $SET SQL(dbman=ODBC)
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
       01 svr          pic x(32).
       01 usr          pic x(32).
       01 char-col     pic x(10).
       01 int-col      pic S9(4) comp-5.
           EXEC SQL END DECLARE SECTION END-EXEC

      *
       procedure division.
       loop-point.
           display "Create/insert/update/drop test"
           display " "
      *    Connect to an SQL Server.
           display "Enter data source (e.g. odbcdemo) "
		   with no advancing
	   accept svr
         display "Enter username[('.'|'/')password] (e.g. scott/tiger) "
		    with no advancing
           accept usr

      *    Connect to the specified database
	   EXEC SQL
               CONNECT TO :svr USER :usr WITH NO PROMPT
	   END-EXEC
	   if sqlcode not = 0
		display "Error: cannot connect "
		display sqlcode
		display sqlerrmc
		stop run
	   end-if

           display 'Drop table'
           EXEC SQL
               drop table mfesqltest
           END-EXEC
           if sqlcode not = 0
                display "Error(anticipated) : cannot drop table "
                display sqlcode
                display sqlerrmc
           end-if

           display 'Create table'
           EXEC SQL
               create table mfesqltest (
                   char_col char(10),
                   int_col  integer)
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot create table "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
	   
           display 'Insert row'
           move "ORIGINAL" to char-col
           move 9999 to int-col
           EXEC SQL
               insert into mfesqltest
                   (char_col,int_col) values
                   (:char-col, :int-col)
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot insert row "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Commit'
           EXEC SQL
               commit transaction
           END-EXEC
           if sqlcode not = 0
                display "Error: commit "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Update row'
           move "UPDATED" to char-col
           move 9999 to int-col
           EXEC SQL
               update mfesqltest set char_col = :CHAR-COL
                   where int_col = :INT-COL
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot update row "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Verify data before rollback'
           move 9999 to int-col
           EXEC SQL
               declare vcurs cursor for
                   select char_col from mfesqltest
                       where int_col = :INT-COL
           END-EXEC
           EXEC SQL
               open vcurs
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot open cursor "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
           move spaces to char-col
           EXEC SQL
               fetch vcurs into :char-col
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot read row "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
           if char-col <> "UPDATED"
               display "Data has wrong value(" char-col ")"
               stop run
           end-if
           EXEC SQL
               fetch vcurs into :char-col
           END-EXEC
           if sqlcode not = 100
                display "SQLCODE <> 100 reading second row"
                display sqlcode
                display sqlerrmc
                display char-col
                stop run
           end-if
           EXEC SQL
               close vcurs
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot close cursor "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Rollback'
           EXEC SQL
               rollback
           END-EXEC
           if sqlcode not = 0
                display "Error: rollback "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Verify data after rollback'
           move 9999 to int-col
           EXEC SQL
               open vcurs
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot open cursor "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
           move spaces to char-col
           EXEC SQL
               fetch vcurs into :char-col
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot read row "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
           if char-col <> "ORIGINAL"
               display "Data has wrong value(" char-col ")"
               stop run
           end-if
           EXEC SQL
               fetch vcurs into :char-col
           END-EXEC
           if sqlcode not = 100
                display "SQLCODE <> 100 reading second row"
                display sqlcode
                display sqlerrmc
                display char-col
                stop run
           end-if
           EXEC SQL
               close vcurs
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot close cursor "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

      *    Start a new transaction to avoid mixing DML and DDL
      *    as this will upset some data sources
           EXEC SQL commit END-EXEC
           if sqlcode not = 0
                display "Error: on commit before drop "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Drop table'
           EXEC SQL
               drop table mfesqltest
           END-EXEC
           if sqlcode not = 0
                display "Error: cannot drop table "
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display 'Disconnect'
	   EXEC SQL
               commit work release
	   END-EXEC
	   if sqlcode not = 0
                display "Error: commit release "
		display sqlcode
		display sqlerrmc
	   end-if

           display 'Create table after commit release'
           EXEC SQL
               create table mfesqltest (
                   char_col char(10),
                   int_col  integer)
           END-EXEC
           if sqlcode not = 0
                display "Cannot create table as expected"
                display sqlcode
                display sqlerrmc
           else
                display "Error: create table was OK"
                display sqlcode
                display sqlerrmc
                stop run
           end-if

           display "Test completed without error"

	   stop run.

