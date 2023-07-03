//FILTERJ JOB ' ',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//* FILTERJ adında bir iş tanımlanır.
//* CLASS=A parametresi, işin sınıfını belirtir.
//* MSGCLASS=X parametresi, işin mesaj sınıfını belirtir.
//* NOTIFY=&SYSUID, iş tamamlandığında SYSUID'ye bildirim gönderilir.
//DELET000 EXEC PGM=IEFBR14
//* DELET000 adında bir program çalıştırılır.
//THEFILE   DD DSN=&SYSUID..QSAM.BB,
// DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//* THEFILE adında bir veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.BB, SYSUID'ye ait QSAM.BB veri setine işaret eder.
//* DISP=(MOD,DELETE,DELETE), veri setinin silineceğini belirtir.
//* SPACE=(TRK,0), veri seti için izin verilen alanı belirtir.
//DELET100 EXEC PGM=IEFBR14
//* DELET100 adında bir program çalıştırılır.
//THEFILE   DD DSN=&SYSUID..QSAM.DD,
// DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//* THEFILE adında bir veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.DD, SYSUID'ye ait QSAM.DD veri setine işaret eder.
//* DISP=(MOD,DELETE,DELETE), veri setinin silineceğini belirtir.
//* SPACE=(TRK,0), veri seti için izin verilen alanı belirtir.
//DELET200 EXEC PGM=IEFBR14
//* DELET200 adında bir program çalıştırılır.
//THEFILE   DD DSN=&SYSUID..QSAM.EE,
// DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//* THEFILE adında bir veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.EE, SYSUID'ye ait QSAM.EE veri setine işaret eder.
//* DISP=(MOD,DELETE,DELETE), veri setinin silineceğini belirtir.
//* SPACE=(TRK,0), veri seti için izin verilen alanı belirtir.
//SORT0300 EXEC PGM=SORT
//* SORT0300 adında bir program çalıştırılır.
//SYSOUT    DD SYSOUT=*
//* SYSOUT adında bir sistem çıkışı tanımlanır ve standart çıktıyı belirtir.
//SORTIN    DD *
//* SORTIN adında bir giriş veri seti tanımlanır.
10002949MAHMUT         ACAR         20230601
10003840MUSTAFA        YILMAZ         20230601
10004978MUSTAFA        YILMAZ         20230601
10011949MEHMET         AYDIN          19740918
10021840MEHMET         AYDIN          19740918
10021840MEHMET         AYDIN          19740918
19021840MEHMET         AYDIN          19740918
12021840MEHMET         AYDIN          19740918
//* Giriş veri seti için örnek veriler sağlanmıştır.
//SORTOUT   DD DSN=&SYSUID..QSAM.DD,
// DISP=(NEW,CATLG,DELETE),
// SPACE=(TRK,(5,5),RLSE),
// DCB=(RECFM=FB,LRECL=60)
//* SORTOUT adında bir çıkış veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.DD, SYSUID'ye ait QSAM.DD veri setine işaret eder.
//* DISP=(NEW,CATLG,DELETE), yeni bir veri seti oluşturulmasını ve kalıcı olması
//* SPACE=(TRK,(5,5),RLSE), 5 silindirlik bir alana ihtiyaç olduğunu belirtir ve
//*    işlem tamamlandıktan sonra alanın serbest bırakılacağını belirtir.
//* DCB=(RECFM=FB,LRECL=60), veri setinin kayıt biçimini ve uzunluğunu belirtir.
//SYSIN DD *
//* SYSIN adında bir sistem girişi tanımlanır.
  SORT FIELDS=(1,7,CH,A)
  OUTREC FIELDS=(1,38,39,8,Y4T,TOJUL=Y4T,15C'0')
//* SORT işlemi için gerekli parametreler belirtilmiştir.
//SORT0400  EXEC PGM=SORT
//* SORT0400 adında bir program çalıştırılır.
//SYSOUT    DD  SYSOUT=*
//* SYSOUT adında bir sistem çıkışı tanımlanır ve standart çıktıyı belirtir.
//SORTIN    DD  DSN=&SYSUID..QSAM.DD,DISP=SHR
//* SORTIN adında bir giriş veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.DD, SYSUID'ye ait QSAM.DD veri setine işaret eder.
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//SORTOUT   DD  DSN=&SYSUID..QSAM.EE,
// DISP=(NEW,CATLG,DELETE),
// SPACE=(TRK,(5,5),RLSE),
// DCB=(RECFM=FB,LRECL=47)
//* SORTOUT adında bir çıkış veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.EE, SYSUID'ye ait QSAM.EE veri setine işaret eder.
//* DISP=(NEW,CATLG,DELETE), yeni bir veri seti oluşturulmasını ve kalıcı olması
//* SPACE=(TRK,(5,5),RLSE), 5 silindirlik bir alana ihtiyaç olduğunu belirtir ve
//*    işlem tamamlandıktan sonra alanın serbest bırakılacağını belirtir.
//* DCB=(RECFM=FB,LRECL=47), veri setinin kayıt biçimini ve uzunluğunu belirtir.
//SYSIN     DD  *
//* SYSIN adında bir sistem girişi tanımlanır.
  SORT FIELDS=COPY
  OUTREC FIELDS=(1,5,ZD,TO=PD,LENGTH=3,
  6,3,ZD,TO=BI,LENGTH=2,
  9,30,
  39,7,ZD,TO=PD,LENGTH=4,
  46,15,ZD,TO=PD,LENGTH=8)
//* SORT işlemi için gerekli parametreler belirtilmiştir.
//DELET500 EXEC PGM=IDCAMS
//* DELET500 adında bir program çalıştırılır.
//SYSPRINT DD SYSOUT=*
//* SYSPRINT adında bir sistem çıkışı tanımlanır ve standart çıktıyı belirtir.
//SYSIN DD *
//* SYSIN adında bir sistem girişi tanımlanır.
  DELETE Z95635.VSAM.AA CLUSTER PURGE
  IF LASTCC LE 08 THEN SET MAXCC = 00
  DEF CL ( NAME(Z95635.VSAM.AA)      -
           FREESPACE( 20 20 )        -
           SHR( 2,3 )                -
           KEYS(5 0)                 -
           INDEXED SPEED             -
           RECSZ(47 47)              -
           TRK (10 10)               -
           LOG(NONE)                 -
           VOLUME (VPWRKB)           -
           UNIQUE )                  -
   DATA (NAME(Z95635.VSAM.AA.DATA))  -
   INDEX ( NAME(Z95635.VSAM.AA.INDEX))
//* VSAM veri kümesi tanımları ve silme işlemi gerçekleştirilmiştir.
//REPRO600 EXEC PGM=IDCAMS
//* REPRO600 adında bir program çalıştırılır.
//SYSPRINT DD SYSOUT=*
//* SYSPRINT adında bir sistem çıkışı tanımlanır ve standart çıktıyı belirtir.
//INN001   DD DSN=Z95635.QSAM.EE,DISP=SHR
//* INN001 adında bir giriş veri seti tanımlanır.
//* DSN=Z95635.QSAM.EE, Z95635 kütüphanesindeki QSAM.EE veri setine işaret eder.
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//OUT001   DD DSN=Z95635.VSAM.AA,DISP=SHR
//* OUT001 adında bir çıkış veri seti tanımlanır.
//* DSN=Z95635.VSAM.AA, Z95635 kütüphanesindeki VSAM.AA veri setine işaret eder.
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//SYSIN    DD *
//* SYSIN adında bir sistem girişi tanımlanır.
  REPRO INFILE(INN001) OUTFILE(OUT001)
//* Veri kopyalama işlemi gerçekleştirilmiştir.
//SORT0700 EXEC PGM=SORT
//* SORT0700 adında bir program çalıştırılır.
//SYSOUT    DD SYSOUT=*
//* SYSOUT adında bir sistem çıkışı tanımlanır ve standart çıktıyı belirtir.
//SORTIN    DD *
10003840
10011949
10021840
//* SORTIN adında bir giriş veri seti tanımlanır.
//* Örnek veriler sağlanmıştır.
//SORTOUT   DD DSN=&SYSUID..QSAM.BB,
// DISP=(NEW,CATLG,DELETE),
// SPACE=(TRK,(5,5),RLSE),
// DCB=(RECFM=FB,LRECL=10,BLKSIZE=0)
//* SORTOUT adında bir çıkış veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.BB, SYSUID'ye ait QSAM.BB veri setine işaret eder.
//* DISP=(NEW,CATLG,DELETE), yeni bir veri seti oluşturulmasını ve kalıcı olması
//* SPACE=(TRK,(5,5),RLSE), 5 silindirlik bir alana ihtiyaç olduğunu belirtir ve
//*    işlem tamamlandıktan sonra alanın serbest bırakılacağını belirtir.
//* DCB=(RECFM=FB,LRECL=10,BLKSIZE=0), veri setinin kayıt biçimini, uzunluğunu v
//SYSIN     DD *
//* SYSIN adında bir sistem girişi tanımlanır.
  SORT FIELDS=(1,8,CH,A)
  OUTREC FIELDS=(1,8)
//* SORT işlemi için gerekli parametreler belirtilmiştir.