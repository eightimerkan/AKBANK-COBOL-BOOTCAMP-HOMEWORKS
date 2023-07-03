//DAYCALC JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(DAYCALC1),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(DAYCALC1),DISP=SHR
//***************************************************/
// IF RC <= 04 THEN  // RC, Return Code (Dönüş Kodu) anlamına gelir
//***************************************************/
//RUN     EXEC PGM=DAYCALC1
//*DAYCALC1 programını çalıştır
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//*Programın çalıştığı kütüphane
//DATEREC   DD DSN=&SYSUID..QSAM.BB,DISP=SHR
//*Giriş dosyasının adı ve konumu
//PRTLINE   DD DSN=&SYSUID..QSAM,
//             DISP=(NEW,CATLG,DELETE),
//*Çıktı dosyasının adı ve konumu
//             UNIT=SYSDA,
//*Çıktı dosyasının kaynak birimi
//             SPACE=(TRK,(10,10),RLSE),
//*Çıktı dosyasının alan gereksinimleri
//             DCB=(RECFM=FB,LRECL=58,BLKSIZE=0)
//*Dosya kontrol bloğu özellikleri
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//*Sistem çıktısı için çıktı ayarları
//CEEDUMP   DD DUMMY
//*Hata durumunda üretebilecek hata raporu için kullanılan çıktı
//SYSUDUMP  DD DUMMY
//*Sistem çökmeleri için kullanılan çıktı
//***************************************************/
// ELSE
// ENDIF
