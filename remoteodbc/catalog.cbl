      $SET SQL(dbman=ODBC, db2)
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
       01  type-catalog.
           03  typ-name        pic x(32).
           03  typ-datatype    pic s9(4) comp-5.
           03  typ-precision   pic s9(9) comp-5.
           03  typ-lit-prefix  pic x(10).
           03  typ-lit-suffix  pic x(10).
           03  typ-create-pars pic x(32).
           03  typ-nullable    pic s9(4) comp-5.
           03  typ-case-sens   pic s9(4) comp-5.
           03  typ-searchable  pic s9(4) comp-5.
           03  typ-unsigned    pic s9(4) comp-5.
           03  typ-money       pic s9(4) comp-5.
           03  typ-auto-inc    pic s9(4) comp-5.
           03  typ-local-name  pic x(32).
           03  typ-min-scale   pic s9(4) comp-5.
           03  typ-max-scale   pic s9(4) comp-5.
       01  type-indicators.
           03  typ-inds        pic s9(4) comp-5 occurs 15.

       01  table-catalog.
           03  tab-qualifier   pic x(32).
           03  tab-owner       pic x(32).
           03  tab-name        pic x(32).
           03  tab-type        pic x(32).
       01  table-indicators.
           03  tab-inds        pic s9(4) comp-5 occurs 4.

       01  column-catalog.
           03  col-qualifier   pic x(32).
           03  col-owner       pic x(32).
           03  col-table-name  pic x(32).
           03  col-name        pic x(32).
           03  col-data-type   pic s9(4) comp-5.
           03  col-type-name   pic x(32).
           03  col-precision   pic s9(9) comp-5.
           03  col-length      pic s9(9) comp-5.
           03  col-scale       pic s9(4) comp-5.
           03  col-radix       pic s9(4) comp-5.
           03  col-nullable    pic s9(4) comp-5.
           03  col-remarks     pic x(254).
       01  column-indicators.
           03  col-inds        pic s9(4) comp-5 occurs 12.

       01 Svr                    pic x(32).
       01 Usr                    pic x(32).
       01 Pass                   pic x(32).
       01 Usr-Pass               pic x(64).

       EXEC SQL END DECLARE SECTION END-EXEC

       01  c                   pic x.

       procedure division.
       main-proc.
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

           if sqlcode not = 0
               display "Error: not connected to database"
               display "sqlcode = " sqlcode
               display "sqlerrmc = " sqlerrmc
               stop run
           end-if

           display "List of all ODBC datatypes for current session"

           exec sql
               declare dcurs cursor for
                   query odbc datatypes
           end-exec

           exec sql open dcurs end-exec

           if sqlcode not = 0
               display "Error: querying datatype catalog"
               display "sqlcode = " sqlcode
               display "sqlerrmc = " sqlerrmc
               stop run
           end-if

           exec sql fetch dcurs into :type-catalog:typ-inds end-exec

           perform until sqlcode < 0 or sqlcode = 100
               if typ-inds(6) = 0
                    display typ-name "(" typ-create-pars ")"
               else
                    display typ-name
               end-if
               exec sql fetch dcurs into :type-catalog:typ-inds end-exec
           end-perform

           exec sql close dcurs end-exec


           display "List of all tables in ODBC catalog"

           exec sql
               declare tcurs cursor for
                   query odbc tables
           end-exec

           exec sql open tcurs end-exec

           if sqlcode not = 0
               display "Error: querying table catalog"
               display "sqlcode = " sqlcode
               display "sqlerrmc = " sqlerrmc
               stop run
           end-if

           exec sql fetch tcurs into :table-catalog:tab-inds end-exec

           perform until sqlcode < 0 or sqlcode = 100
               display tab-name tab-type tab-owner
               exec sql fetch tcurs into
                   :table-catalog:tab-inds
               end-exec
           end-perform

           exec sql close tcurs end-exec


           display "List of columns for table staff"

           exec sql
               declare ccurs cursor for
                   query odbc columns tablename 'STAFF'
           end-exec

           exec sql open ccurs end-exec

           if sqlcode not = 0
               display "Error: querying table column catalog"
               display "sqlcode = " sqlcode
               display "sqlerrmc = " sqlerrmc
               stop run
           end-if

           exec sql fetch ccurs into :column-catalog:col-inds end-exec

           perform until sqlcode < 0 or sqlcode = 100
               display col-name col-type-name
               exec sql fetch ccurs into
                   :column-catalog:col-inds
               end-exec
           end-perform

           exec sql close ccurs end-exec

           exec sql disconnect current end-exec

           stop run.

