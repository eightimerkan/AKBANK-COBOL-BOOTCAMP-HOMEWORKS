           IDENTIFICATION DIVISION.
           PROGRAM-ID.    HomeWork003
           AUTHOR.        Erkan Zafer Dolgun
           ENVIRONMENT DIVISION.
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 CUSTOMER-RECORD.
              05 CUSTOMER-ID           PIC 9(5).
              05 CURRENCY-KEY          PIC 9(3).
              05 FIRST-NAME            PIC X(15).
              05 LAST-NAME             PIC X(15).
              05 LAST-ORDER-DATE       PIC 9(7).
              05 BALANCE               PIC S9(15)V99.
           01 TOTAL-BALANCE            PIC S9(15)V99 VALUE 0.
           01 FILE-STATUS              PIC XX.
           01 EOF-FLAG                 PIC X VALUE 'N'.
           01 INVALID-RECORD-COUNT     PIC 9(5) VALUE 0.
           
           PROCEDURE DIVISION.
              PERFORM OPEN-FILES
              PERFORM PROCESS-FILE
              PERFORM CLOSE-FILES
              PERFORM DISPLAY-REPORT
              STOP RUN.
           
           OPEN-FILES.
              OPEN INPUT IDX-FILE
              OPEN OUTPUT OUT-FILE.
           
           PROCESS-FILE.
              PERFORM UNTIL EOF-FLAG = 'Y'
                 READ IDX-FILE
                    AT END MOVE 'Y' TO EOF-FLAG
                    NOT AT END PERFORM PROCESS-CUSTOMER
                 END-READ
              END-PERFORM.
           
           PROCESS-CUSTOMER.
              IF CUSTOMER-ID NOT NUMERIC OR CURRENCY-KEY NOT NUMERIC THEN
                 ADD 1 TO INVALID-RECORD-COUNT
              ELSE
                 MOVE CUSTOMER-ID TO IDX-ID-O
                 MOVE CURRENCY-KEY TO IDX-CURR-O
                 MOVE FIRST-NAME TO FIRST-NAME-O
                 MOVE LAST-NAME TO LAST-NAME-O
                 MOVE LAST-ORDER-DATE TO LAST-ORDER-O
                 MOVE BALANCE TO BALANCE-O
                 ADD BALANCE-O TO TOTAL-BALANCE
                 WRITE OUT-REC
              END-IF.
           
           CLOSE-FILES.
              CLOSE IDX-FILE
              CLOSE OUT-FILE.
           
           DISPLAY-REPORT.
              DISPLAY 'Total Balance: ' TOTAL-BALANCE
              DISPLAY 'Invalid Record Count: ' INVALID-RECORD-COUNT.