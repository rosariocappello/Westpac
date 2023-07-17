      $set sql(dbman=odbc)
      ****************************************************************
      * Copyright (C) Micro Focus 1988-2019. All rights reserved.
      *
      * This sample code is supplied for demonstration purposes only
      * on an "as is" basis and is for use at your own risk.
      * 
      ****************************************************************
      *
      *  This program is a primitive database query tool. It
      *  basically loops until the user enters "quit".
      *  When it receives an SQL statement from the user, it 
      *  prepares it. If the statement will return results, a
      *  cursor is used to retrieve the results, otherwise
      *  the statement is simply executed.
      *
      *  The program handles a limited number of data types, so
      *  it will not handle all SQL statements.
      *
      *  This program provides a detailed example of how to use
      *  the SQLDA data structure, in conjunction with Dynamic
      *  SQL statements.
      *
      ************************************************************

       working-storage section.

      *  Include the SQLCA structure
       exec sql include sqlca end-exec.

      *  Include the SQLDA structure
       exec sql include sqlda78 end-exec.

       01 Dyn-Vars occurs 255 times.
        03 Dyn-Null              pic s9(4) comp-5.
        03 Tinyint-Var           pic s9(2) comp-5.
        03 Smallint-Var          pic s9(4) comp-5.
        03 Integer-Var           pic s9(9) comp-5.
        03 Decimal-Var           pic s9(13)v9(5) comp-3.
        03 Float-Var             comp-2.
        03 Char-Var              pic x(100).
        03 Col-Len               pic s9(4) comp-5.

       01 Disp-Dec               pic +(13).z(5).
       01 Sql-Type               pic s9(4) comp-5.
       01 Remain-1               pic 9(4) value 0.
       01 Index1                 pic 9(4) value 0.
       01 Stmt                   pic x(20).
       01 Precision-and-Scale    pic s9(4) comp-5.
       01 filler redefines Precision-and-Scale.
        03 Precision             pic s9(2) comp-5.
        03 Scale                 pic s9(2) comp-5.

       exec sql begin declare section end-exec.

       01 Stmtbuf                pic x(80).

       01 Svr                    pic x(32).
       01 Usr                    pic x(32).
       01 Pass                   pic x(32).
       01 Usr-Pass               pic x(64).

       exec sql end declare section end-exec.

       01 Meta-data.
        03 FILLER                pic x.
        03 Colno                 pic z(3)9.
        03 FILLER                pic x(3) value spaces.
        03 Coltype               pic 9(3).
        03 FILLER                pic x(1) value spaces.
        03 Collen                pic z(4)9.
        03 Colpoint              pic x.
        03 Colscale              pic 9.
        03 FILLER                pic x(2) value spaces.
        03 Colname               pic x(30).

       01 Meta-data-title.
        03 FILLER                pic x(6) value "Column".
        03 FILLER                pic x(1) value spaces.
        03 FILLER                pic x(4) value "Type".
        03 FILLER                pic x(1) value spaces.
        03 FILLER                pic x(6) value "Length".
        03 FILLER                pic x(3) value spaces.
        03 FILLER                pic x(30) value "Name".

       01 Meta-data-title-2      pic x(51) value all "-".

       procedure division.
      *    Find out which database we are using and connect to it
           display "Enter data source name :"
                   with no advancing
           accept Svr
           display "Enter username :"
                    with no advancing
           accept Usr
           display "Enter password :"
                    with no advancing
           accept Pass
           string
               Usr delimited space
               "." delimited size
               Pass delimited space
           into Usr-Pass
           exec sql
               connect to :Svr user :Usr-Pass
           end-exec
           if Sqlcode not = 0
               perform Display-Sqlca
               stop run
           end-if
      *    Now loop, processing SQL statements until the user
      *    enters 'quit'
           perform until Stmtbuf equal "quit"
           display "Enter SQL statement to be executed or "
               with no advancing
           display "'quit' to terminate: "
               accept Stmtbuf
           if Stmtbuf not = "quit"
               move spaces to Sqlerrmc
      *        Issuing a PREPARE INTO with sqln = 1 and Sqld = 0
      *        will return the number of columns in the result set
      *        in sqld.
               move 1 to Sqln
               move 0 to Sqld
               exec sql
                  prepare st into :Sqlda from :Stmtbuf
               end-exec
               move "Prepare Statement" to Stmt
               perform Display-Sqlca
               if Sqld not = 0
      *            If there are columns in the result set, it must
      *            be a select statement
                   perform Select-Statement
               else
      *            If there is not a result set, simply execute
      *            the statement
                   exec sql
                       execute st
                   end-exec
                   if Sqlcode = 0
                       display "Rows Affected = " Sqlerrd(3)
                       move "Non-Select statement" to Stmt
                   end-if
                   perform Display-Sqlca
               end-if
           end-if
       end-perform
      *    Disconnect from the server  
       exec sql disconnect all end-exec
       stop run.

       Select-Statement section.
      *    Sqld was set by the PREPARE above. It contains the number
      *    of columns in the result set created by the SELECT statement
           move Sqld to Sqln

      *    Declare a cursor to retrieve the results
           exec sql
               declare cur cursor for st2
           end-exec
      *    Now PREPARE the statement and get details of each column
      *    in the Sqlvar structures in Sqlda.
      *
      *    Calculate the size of the Sqlda
      $IF P64 SET
           compute Sqldabc = 16 + 56 * Sqln
      $ELSE
           compute Sqldabc = 16 + 44 * Sqln
      $END
           exec sql
               prepare st2 into :Sqlda from :Stmtbuf
           end-exec

      *    Display the meta data, the information on each
      *    column such as name, type and size. Also, initialize
      *    a sqlvar stucture for each column
           display " "
           display Meta-Data-Title
           display Meta-Data-Title-2
           move 0 to Index1
           perform Display-Info-And-Initialize
               varying Index1 from 1 by 1
               until Index1 > Sqld

      *    Open the cursor to retrieve the results
           exec sql
               open cur
           end-exec
           if Sqlcode not = 0
               perform Display-Sqlca
           else
               move 'Fetch row' to Stmt
               perform until Sqlcode < 0 or Sqlcode = 100
      *            Retrieve one row of data from the database
                   exec sql
                       fetch cur using descriptor :Sqlda
                   end-exec
                   if Sqlcode not < 0 and Sqlcode not = 100
                       move 0 to Index1
                       display " "
                       perform Display-Data Sqld times
                   end-if
                   if Sqlcode not = 100
                       perform Display-Sqlca
                   end-if
               end-perform
           end-if
      *    Close the cursor
           exec sql
               close cur
           end-exec.

       Display-Info-And-Initialize section.
           divide Sqltype(Index1) by 2 giving Sql-type
               remainder Remain-1
           move Sqltype(Index1) to Sql-Type
           move 0 to Dyn-Null(Index1)
           if Remain-1 not = 0
      *        If the type is an odd number, null values are
      *        allowed in the column. We need to set the
      *        address of the associated indicator variable
               subtract 1 from Sql-Type
               set Sqlind(Index1) to address of Dyn-Null(Index1)
           end-if
      *    Display the name, type and length of the column
           move spaces to Meta-Data
           move Index1 to Colno
           move Sqlnamec(Index1) to Colname
           move Sqltype(Index1) to Coltype
           if Sql-Type not = ESQL-DECIMAL
               move Sqllen(Index1) to Collen
           else
      *        If the type is decimal, the sqllen field
      *        is split into two parts. The first byte
      *        gives the precision (i.e. the total number
      *        of digits) and the second byte gives the
      *        scale (i.e. the number of digits after the
      *        decimal point).
               move Sqllen(Index1) to Precision-and-Scale
               move Precision to Collen
               move "." to Colpoint
               move Scale to Colscale
           end-if
           display Meta-Data
      *    Now set up the address of the appropriate variable
      *    to retrieve the data into.
           evaluate Sql-Type

               when ESQL-TINYINT
      *            1-byte integer     
                   set Sqldata(Index1) to
                       address of Tinyint-Var(Index1)

               when ESQL-SMALLINT
      *            2-byte integer     
                   set Sqldata(Index1) to
                       address of Smallint-Var(Index1)

               when ESQL-INTEGER
      *            4-byte integer     
                   set Sqldata(Index1) to
                       address of Integer-Var(Index1)

               when ESQL-DECIMAL
      *            Decimal
                   set Sqldata(Index1) to
                       address of Decimal-Var(Index1)
      *            Change the precision and scale to
      *            say that we are returning into a 18
      *            digit (x"12") field with 5 decimal
      *            places
                   move 18                   to  precision
                   move 5                    to  scale
                   move Precision-and-Scale  to  Sqllen(Index1)

               when ESQL-CHAR
      *            Char or varchar 
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)

               when ESQL-LONGVARCHAR
      *            Char or varchar 
                   move ESQL-CHAR to Sqltype(Index1)
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)
                   move 18 to Sqllen(Index1)

               when ESQL-TIMESTAMP-REC
      *            Change the type to indicate that the
      *            data should be returned in character
      *            format
                   move ESQL-TIMESTAMP-CHAR to Sqltype(Index1)
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)
                   move 100 to Sqllen(Index1)

               when ESQL-DATE-REC
                   move ESQL-DATE-CHAR to Sqltype(Index1)
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)
                   move 100 to Sqllen(Index1)

               when ESQL-TIME-REC
                   move ESQL-TIME-CHAR to Sqltype(Index1)
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)
                   move 100 to Sqllen(Index1)

               when ESQL-TIMESTAMP-CHAR
               when ESQL-DATE-CHAR
               when ESQL-TIME-CHAR
                   set Sqldata(Index1) to
                       address of Char-Var(Index1)

               when ESQL-DOUBLE
      *            8-byte floating point
                   set Sqldata(Index1) to
                       address of Float-Var(Index1)

               when other
      *            Data-type not handled
                   display "Unable to handle data-type " Sql-Type
                   exec sql disconnect all end-exec
                   stop run

           end-evaluate
      *    Save the length so that it can be restored
      *    after each Fetch. The sqllen field can be
      *    affected by a Fetch statement
           move Sqllen(Index1) to Col-Len(Index1).

       Display-Data section.
           add 1 to Index1
           move Sqlnamec(Index1) to Colname
           display Colname(1:20) " : " with no advancing
           if Dyn-Null(Index1) < 0
               display "* * * NULL * * * "
           else 
               evaluate Sqltype(Index1)
                   when ESQL-TINYINT
                   when ESQL-TINYINT-NULL
                       display Tinyint-Var(Index1)

                   when ESQL-SMALLINT
                   when ESQL-SMALLINT-NULL
                       display Smallint-Var(Index1)

                   when ESQL-INTEGER
                   when ESQL-INTEGER-NULL
                       display Integer-Var(Index1)

                   when ESQL-DECIMAL
                   when ESQL-DECIMAL-NULL
                       move Decimal-Var(Index1) to Disp-Dec
                       display Disp-Dec

                   when ESQL-DOUBLE
                   when ESQL-DOUBLE-NULL
                       move Float-Var(Index1) to Disp-Dec
                       display Disp-Dec

                   when ESQL-LONGVARCHAR
                   when ESQL-LONGVARCHAR-NULL
                   when ESQL-CHAR
                   when ESQL-CHAR-NULL
                   when ESQL-TIMESTAMP-CHAR
                   when ESQL-TIMESTAMP-CHAR-NULL
                   when ESQL-TIMESTAMP-REC
                   when ESQL-TIMESTAMP-REC-NULL
                   when ESQL-DATE-CHAR
                   when ESQL-DATE-CHAR-NULL
                   when ESQL-DATE-REC
                   when ESQL-DATE-REC-NULL
                   when ESQL-TIME-CHAR
                   when ESQL-TIME-CHAR-NULL
                   when ESQL-TIME-REC
                   when ESQL-TIME-REC-NULL
                       display Char-Var(Index1)
                       move " " to Char-Var(Index1)

               end-evaluate
           end-if.
      *    Reset the length field
           move Col-len(index1) to Sqllen(Index1).

       Display-Sqlca section.
           if Sqlcode not = 0
               display Stmt ":"
               display "  Sqlcode  = " Sqlcode
           end-if
           if Sqlstate not = "00000"
               display "  Sqlstate = " Sqlstate
           end-if
           if Sqlcode < 0
               display "  Sqlerrmc = " Sqlerrmc
           end-if
           if Sqlcode = 1
               display "  Sqlwarn  = " Sqlwarn
           end-if.

