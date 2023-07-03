//CBL0001J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
//COBRUN   EXEC IGYWCL
//* Data setimize işaret eder shr paylaşımlı olduğunu temsil eder.
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(CBL0001),DISP=SHR
//*Data seti ortaya çıkartır ve programı çalıştırır.
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(CBL0001),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//* Aşağıda ki kod çalışması için rc nin 0 olması lazım.
//***************************************************/
//*Delet100 IEFBR14 programını çalıştırır bu ise data set oluşturup silmeye yara
//DELET100  EXEC PGM=IEFBR14
//* Silmek istediğimiz datasetin ismi
//FILE01    DD DSN=&SYSUID..DATA.NEW,
//*Data seti düzenlememiz için gerekli yeteri kadar yer açıyoruz.
//             DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//RUN      EXEC PGM=CBL0001
//* aşağıda ki kodlar data seti görmesi yüklemesi ve de yazdırması için kullanıyoruz.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//ACCTREC   DD DSN=&SYSUID..DATA,DISP=SHR
//PRTLINE   DD DSN=&SYSUID..DATA.NEW,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(20,5),RLSE),
//             DCB=(RECFM=FB,LRECL=119,BLKSIZE=0),UNIT=3390
//* yukarıda yer açıp oluşturuyoruz işimiz bittiğinde de siliyoruz.
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
