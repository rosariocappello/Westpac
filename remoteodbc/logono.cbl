       IDENTIFICATION DIVISION.
       PROGRAM-ID. logono

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DB-NAME PIC X(30) VALUE 'OracleODBC-19'.
       01 WS-DB-USER PIC X(30) VALUE 'mfuser'.
       01 WS-DB-PASS PIC X(30) VALUE 'Welcome01'.
      *01 WS-DB-HANDLE    USAGE IS SQL-HANDLE.
       01 SQLCODE PIC S9(9) USAGE COMP.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           EXEC SQL
              CONNECT TO :WS-DB-NAME USER :WS-DB-USER 
                                     USING :WS-DB-PASS
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
