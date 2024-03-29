//SORTREPR JOB ' ',CLASS=A,MSGLEVEL=(1,1),
//         MSGCLASS=X,NOTIFY=&SYSUID

//* Yorum satırlarında problem oluyor diye tüm satırları buraya yazdım.
//*Bu satır, SORTREPR adında bir JOB tanımlaması başlatır. CLASS=A, MSGLEVEL=
//*çıktıların nereye gönderileceğini ve kimin bilgilendirileceğini belirler.
//* Bu bölüm, IDCAMS programıyla bir veri kümesini silmek için kullanılır. &SYSU
//* Ardından, eğer son komut kodu (LASTCC) 08'den küçükse, MAXCC değişkenine 00 
//*Bu bölümde, SORT programı çalıştırılır. SORTIN veri kümesine girilen kayıtlar
//*Bu örnekte, SORTIN veri kümesi elle girilen verileri içerir.
//*Bu bölümde, SORTOUT veri kümesi tanımlanır. &SYSUID..QSAM.AA veri kümesi olar
//* Veri kümesinin alanı (space) 5 silindir (track) olarak belirlenir. DCB param
//*SYSIN bölümünde ise "SORT FIELDS=COPY" komutu verilir

//DELET100 EXEC PGM=IDCAMS 
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
   DELETE &SYSUID..QSAM.AA NONVSAM
   IF LASTCC LE 08 THEN SET MAXCC = 00
//SORT0200 EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD *
0003ERKANZAFER     DOLGUN         20010529
0001MEHMET         AYDIN          19621010
0002MUZEYYEN       KIBAR          19621010
0004AYSE           YILMAZ         19851203
0005ALI            DEMIR          19901117
0006SEMA           AKTAŞ          19780422
0007CENGIZ         OZTURK         19890615
0008NURAN          KARA           19730129
0009EMRE           YILMAZ         19821008
0010GUL            KARADAG        19940214
0011FATIH          KAYA           19871101
0012SIBEL          AKBULUT        19950809
0013BURAK          SAHIN          19860427
//SORTOUT  DD DSN=&SYSUID..QSAM.AA,
//             DISP=(NEW,CATLG,DELETE), 
//             SPACE=(TRK,(5,5),RLSE), 
//             DCB=(RECFM=FB,LRECL=42)
//SYSIN    DD *
    SORT FIELDS=COPY
//DELET300  EXEC PGM=IEFBR14
//FILE01    DD DSN=&SYSUID..QSAM.BB,
//             DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//SORT0400  EXEC PGM=SORT
//SYSOUT    DD SYSOUT=*
//SORTIN    DD DSN=&SYSUID..QSAM.AA,DISP=SHR
//SORTOUT   DD DSN=&SYSUID..QSAM.BB,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(5,5),RLSE),
//             DCB=(RECFM=FB,LRECL=50)
//SYSIN     DD *
    SORT FIELDS=(1,4,CH,A)
    INCLUDE COND=(1,1,CH,EQ,C'0') 
    OUTREC FIELDS=(1,42,DATE1)