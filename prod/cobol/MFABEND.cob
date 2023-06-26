       IDENTIFICATION DIVISION.
       PROGRAM-ID. MFABEND.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  C                             pic 9.
       01  flags                         pic x(4) comp-5 value 0. 
       01  status-code                   pic x(4) comp-5 value 0. 
       01  process                       pic x(4) comp-5 value 0. 
       01  ws-process                    pic x(4) comp-5 value 0. 
       01  filename                      pic x(256). 
       01  stackdump-name                pic x(256). 
       01  ABDCODE                       PIC S9(9) BINARY.       
       01  RESCODE                       PIC S9(9) BINARY.            
       01  TIMING                        PIC S9(9) BINARY.   
       01  WS-LOGNAME                    pic x(256).
       01  ws-return-code                pic x(4) comp-5 value 0. 

       PROCEDURE DIVISION.          
 
            display 'LOGDIR'
                 upon environment-name
            accept WS-LOGNAME
                 from environment-value

            move space to filename
            string  ws-logname  delimited by space
                    "/" delimited by size 
                    "MFABEND.%d.%f.%p.%t"  delimited by size 
                     x"00"delimited by size 
              into filename
            end-string.

            move space to stackdump-name
            string  ws-logname  delimited by space
                    "/" delimited by size 
                    "MFABEND_Stack.%d.%f.%p.%t"  delimited by size      
                     x"00"delimited by size 
              into stackdump-name
            end-string.


           call "CBL_CREATE_CORE" using by value flags 
                                       by value process    
                                       by reference filename
                             returning status-code


            call "CBL_CREATE_STACKDUMP" using by value flags
                                              by value process
                                            by reference stackdump-name
                                 returning status-code

                MOVE 0001 TO ABDCODE.
                MOVE 0 TO TIMING.
                CALL "CEE3ABD" USING ABDCODE , TIMING.

           stop run.