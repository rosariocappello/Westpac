       IDENTIFICATION DIVISION.
       PROGRAM-ID. logonw.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 USERNAME PIC X(10) varying.
       01 PASSWD PIC X(10) varying.
       01 EMP-REC-VARS.
         05 EMP-NAME PIC X(10) VARYING.
         05 EMP-NUMBER PIC S9(4) COMP VALUE ZERO.
         05 SALARY PIC S9(5)V99 COMP-3 VALUE ZERO.
         05 COMMISSION PIC S9(5)V99 COMP-3 VALUE ZERO.
         05 COMM-IND PIC S9(4) COMP VALUE ZERO.
           EXEC SQL END DECLARE SECTION END-EXEC.
           EXEC SQL INCLUDE SQLCA END-EXEC.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE "mfuser" TO USERNAME-ARR
           .
           MOVE 6 TO USERNAME-LEN
           .
           MOVE "Welcome01" TO PASSWD-ARR

           MOVE 9 TO PASSWD-LEN
           .

           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD
           END-EXEC

           MOVE SQLCODE TO SQLCODE
           IF SQLCODE NOT EQUAL ZERO
               DISPLAY "DB connection failed with SQLCODE: " SQLCODE
           else
               DISPLAY "DB connection successful."
           END-IF
 
           GOBACK
      
 
