       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGON.
       ENVIRONMENT DIVISION.
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
       
       01 DISPLAY-VARIABLES.
         05 D-EMP-NAME PIC X(10).
         05 D-SALARY PIC Z(4)9.99.
         05 D-COMMISSION PIC Z(4)9.99.

       01 D-TOTAL-QUERIED PIC 9(4) VALUE ZERO.

       01 ws-flags pic x(4) comp-5 value 1.
       01 ws-timeout pic s9(18) comp-5 value 0.
       01 ws-identifier PIC x(4) VALUE "HELP".
       01 ws-status-code pic x(4) comp-5 value zero.

       PROCEDURE DIVISION.
       BEGIN-PGM SECTION.

           CALL"CBL_DEBUG_START" using  by value ws-flags
                                               ws-timeout
                              by reference     ws-identifier
                              returning        ws-status-code

           ACCEPT EMP-NUMBER
           EXEC SQL
               WHENEVER SQLERROR DO PERFORM SQL-ERROR
           END-EXEC
           .
           PERFORM LOGON
           .
           PERFORM QUERY-LOOP
           .
           perform SIGN-OFF
           .
           goback
           .

       LOGON SECTION.

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
           .
           perform DISPLAY-INFO

           DISPLAY " "
           .
           DISPLAY "EMPLOYEE    SALARY    COMMISSION" upon console
           .
           DISPLAY "--------    ------    ----------" upon console
           .

       LOGON-EXIT.
           EXIT
           .

       QUERY-LOOP SECTION.
           DISPLAY " "  upon console
           .
           DISPLAY "ENTER EMP NUMBER (0 TO QUIT): "  upon console       
           .
           
           ACCEPT EMP-NUMBER
           IF (EMP-NUMBER = 0)
               PERFORM SIGN-OFF
           END-IF
           .
           
           perform until EMP-NUMBER = 0
            
               perform get-employee-info
               DISPLAY " "  upon console
               DISPLAY "ENTER EMP NUMBER (0 TO QUIT): "   upon console
               ACCEPT EMP-NUMBER
               
           end-perform.
           
       QUERY-LOOP-exit.  
             exit.
           .
           
       get-employee-info section.
           
           MOVE SPACES TO EMP-NAME-ARR
           .
 
           .

            EXEC SQL
               SELECT ENAME, SAL, COMM
               INTO :EMP-NAME, :SALARY, :COMMISSION:COMM-IND
               FROM EMP
               WHERE EMPNO = :EMP-NUMBER
            END-EXEC
           .
           if sqlcode = 0 
               PERFORM DISPLAY-LINE
           else
               DISPLAY "NOT A VALID EMPLOYEE NUMBER - TRY AGAIN."
           end-if
           .
           ADD 1 TO D-TOTAL-QUERIED.

       get-employee-info-EXIT.
           EXIT
           .

       SIGN-OFF SECTION.
           DISPLAY " "
           .

           DISPLAY "TOTAL NUMBER QUERIED WAS ", D-TOTAL-QUERIED, "."
           .
           DISPLAY "HAVE A GOOD DAY."
           .
           DISPLAY " "
           .
           EXEC SQL
               COMMIT WORK RELEASE
           END-EXEC
           .
           GOBACK.
           .

       SQL-ERROR SECTION.
           EXEC SQL
               WHENEVER SQLERROR CONTINUE
           END-EXEC
           .
           DISPLAY " "
           .
           DISPLAY "ORACLE ERROR DETECTED:"
           .
           DISPLAY " "
           .
           DISPLAY SQLERRMC
           .
           EXEC SQL
               ROLLBACK WORK RELEASE
           END-EXEC
           .
           STOP RUN
           .

       DISPLAY-INFO SECTION.

           DISPLAY " " upon console
           .
           DISPLAY "CONNECTED TO ORACLE AS USER    = " USERNAME upon
             console
           .
           DISPLAY "CONNECTED TO ORACLE AS PASSWORD=" PASSWD upon
             console
           .
           Display "SQLCODE = " SQLCODE
           .
       DISPLAY-INFO-EXIT.
           EXIT
           .

       DISPLAY-LINE SECTION.

           MOVE EMP-NAME-ARR TO D-EMP-NAME
           .
           MOVE SALARY TO D-SALARY
           .
           IF COMM-IND = -1
               DISPLAY D-EMP-NAME, D-SALARY, "          NULL"
           ELSE
               MOVE COMMISSION TO D-COMMISSION
               DISPLAY D-EMP-NAME, D-SALARY, "      ", D-COMMISSION
           END-IF
           .
           .
       DISPLAY-LINE-EXIT.
           EXIT
           .
