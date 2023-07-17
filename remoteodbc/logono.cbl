       IDENTIFICATION DIVISION.
       PROGRAM-ID. logono

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DB-NAME PIC X(30) VALUE 'Myorcl'.
       01 WS-DB-USER PIC X(30) VALUE 'mfuser'.
       01 WS-DB-PASS PIC X(30) VALUE 'Welcome01'.
      *01 WS-DB-HANDLE    USAGE IS SQL-HANDLE.
       01 SQLCODE PIC S9(9) USAGE COMP.

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
           END-IF
           DISPLAY "DB connection successful."

           EXEC SQL
               DISCONNECT :WS-DB-NAME
           END-EXEC

           MOVE SQLCODE TO SQLCODE
           IF SQLCODE NOT EQUAL ZERO
               DISPLAY "DB disconnect failed with SQLCODE: " SQLCODE
           END-IF
           DISPLAY "DB disconnect successful."

           GOBACK
           .
