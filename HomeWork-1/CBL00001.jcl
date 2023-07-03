//CBL0001J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
//COBRUN   EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(CBL0001),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(CBL0001),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//DELET100  EXEC PGM=IEFBR14
//FILE01    DD DSN=&SYSUID..DATA.RPT,
//             DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//RUN      EXEC PGM=CBL0001
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//ACCTREC   DD DSN=&SYSUID..DATA,DISP=SHR
//PRTLINE   DD DSN=&SYSUID..DATA.NEW,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(20,5),RLSE),
//             DCB=(RECFM=FB,LRECL=119,BLKSIZE=0),UNIT=3390
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
