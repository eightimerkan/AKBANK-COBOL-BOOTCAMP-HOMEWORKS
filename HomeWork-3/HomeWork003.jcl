//HomeWork003 JOB 1,NOTIFY=&SYSUID
//* HomeWork003 adında bir iş başlatılır. NOTIFY parametresi kullanıcıya bildiri
//COBRUN  EXEC IGYWCL
//* COBRUN adında bir adım başlatılır ve IGYWCL programı çalıştırılır.
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(HomeWork003),DISP=SHR
//* COBOL.SYSIN adında bir giriş veri seti tanımlanır.
//* DSN=&SYSUID..CBL(HomeWork003), SYSUID'ye ait CBL(HomeWork003) veri setine iş
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(HomeWork003),DISP=SHR
//* LKED.SYSLMOD adında bir çıkış veri seti tanımlanır.
//* DSN=&SYSUID..LOAD(HomeWork003), SYSUID'ye ait LOAD(HomeWork003) veri setine 
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
// IF RC < 5 THEN
//* RC değişkeninin 5'ten küçük olduğu durumda
//DELET100 EXEC PGM=IEFBR14
//* DELET100 adında bir adım başlatılır ve IEFBR14 programı çalıştırılır.
//THEFILE   DD DSN=&SYSUID..QSAM.GG,
//* THEFILE adında bir veri kümesi tanımlanır.
//* DSN=&SYSUID..QSAM.GG, SYSUID'ye ait QSAM.GG veri setine işaret eder.
// DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//* DISP=(MOD,DELETE,DELETE), veri setini güncelleme modunda açar ve içeriğini s
//* SPACE=(TRK,0), veri setinin boyutunu tanımlar (0 iz sürücüsü izleyicisi).
//RUN     EXEC PGM=HomeWork003
//* RUN adında bir adım başlatılır ve HomeWork003 programı çalıştırılır.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//* STEPLIB adında bir kitaplık tanımlanır.
//* DSN=&SYSUID..LOAD, SYSUID'ye ait LOAD kitaplığına işaret eder.
//* DISP=SHR, kitaplığın paylaşılabilir olduğunu belirtir.
//IDXFILE  DD DSN=&SYSUID..VSAM.AA,DISP=SHR
//* IDXFILE adında bir veri kümesi tanımlanır.
//* DSN=&SYSUID..VSAM.AA, SYSUID'ye ait VSAM.AA veri setine işaret eder.
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//OUTFILE   DD DSN=&SYSUID..QSAM.GG,DISP=(NEW,CATLG,DELETE),
//          SPACE=(TRK,(150,10))
//* OUTFILE adında bir çıkış veri seti tanımlanır.
//* DSN=&SYSUID..QSAM.GG, SYSUID'ye ait QSAM.GG veri setine işaret eder.
//* DISP=(NEW,CATLG,DELETE), yeni bir veri seti oluşturulmasını ve kalıcı olması
//* SPACE=(TRK,(150,10)), 150 silindirlik bir alana ihtiyaç olduğunu belirtir.
//ACCFILE DD DSN=&SYSUID..QSAM.BB,DISP=SHR
//* ACCFILE adında bir veri kümesi tanımlanır.
//* DSN=&SYSUID..QSAM.BB, SYSUID'ye ait QSAM.BB veri setine işaret eder.
//* DISP=SHR, veri setinin paylaşılabilir olduğunu belirtir.
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//* SYSOUT adında bir çıkış veri seti tanımlanır.
//* SYSOUT=*, çıktının standart çıktıya yönlendirileceğini belirtir.
//* OUTLIM=15000, çıktının maksimum uzunluğunu belirler.
//CEEDUMP   DD DUMMY
//* CEEDUMP adında bir çıkış veri seti tanımlanır.
//* DUMMY, çıktının atılacağını belirtir.
//SYSUDUMP  DD DUMMY
//* SYSUDUMP adında bir çıkış veri seti tanımlanır.
//* DUMMY, çıktının atılacağını belirtir.
// ELSE
//* RC değişkeni 5'ten küçük değilse
// ENDIF
//* IF bloğunun sonu
