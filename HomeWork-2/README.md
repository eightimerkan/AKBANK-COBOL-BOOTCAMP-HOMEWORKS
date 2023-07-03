# AKBANK-COBOL-BOOTCAMP-HOMEWORKS - 2

DAYCALC.CBL

IDENTIFICATION DIVISION: Bu bölüm, programın kimlik bilgilerini içerir.
PROGRAM-ID: Programın adı "DAYCALC" olarak belirlenmiştir.
AUTHOR: Programın yazarı "Erkan Zafer Dolgun" olarak belirtilmiştir.
ENVIRONMENT DIVISION: Bu bölüm, programın çalışacağı ortamı tanımlar.
INPUT-OUTPUT SECTION: Bu bölüm, dosya işlemleriyle ilgili bilgileri içerir.
FILE-CONTROL: Bu bölüm, kullanılacak dosyaların tanımlamalarını içerir.
DATA DIVISION: Bu bölüm, veri tanımlamalarını içerir.
FILE SECTION: Bu bölüm, kullanılacak dosyaların alan tanımlamalarını içerir.
WORKING-STORAGE SECTION: Bu bölüm, programın çalışması için kullanılacak geçici veri alanlarını içerir.
PROCEDURE DIVISION: Programın işlevsel kodunun bulunduğu bölümdür.
a. 0000-MAIN: Ana işlem döngüsünün başladığı noktadır.
b. H100-OPEN-FILES: Dosyaları açan bir alt programdır.
c. H200-READ-NEXT-RECORD: Bir sonraki kaydı okuyan bir alt programdır.
d. CALC-RECORD: Kayıtları hesaplayan bir alt programdır.
e. WRITE-RECORD: Hesaplanan kayıtları çıktı dosyasına yazan bir alt programdır.
f. H999-PROGRAM-EXIT: Programı sonlandıran bir alt programdır.
H100-END: H100-OPEN-FILES alt programının sonlandığı noktadır.
H200-END: H200-READ-NEXT-RECORD alt programının sonlandığı noktadır.
CALC-END: CALC-RECORD alt programının sonlandığı noktadır.
WRITE-END: WRITE-RECORD alt programının sonlandığı noktadır.
H999-PROGRAM-EXIT: H999-PROGRAM-EXIT alt programının sonlandığı noktadır.
Bu program, "DATE-REC" adlı bir giriş dosyasını okur ve her bir kayıt için başlangıç tarihini (REC-DATE), bitiş tarihini (REC-NDATE) ve aradaki gün sayısını (REC-LDAY) hesaplar. Hesaplanan sonuçlar, "PRINT-LINE" adlı bir çıktı dosyasına yazılır.

Programın işleyişi aşağıdaki adımlarla gerçekleştirilir:

H100-OPEN-FILES alt programı, giriş ve çıktı dosyalarını açar.
H200-READ-NEXT-RECORD alt programı, giriş dosyasından bir sonraki kaydı okur.
CALC-RECORD alt programı, okunan kaydın tarih bilgilerini alır ve aralarındaki gün sayısını hesaplar.
WRITE-RECORD alt programı, hesaplanan sonuçları çıktı dosyasına yazmak için uygun alanlara taşır ve yazma işlemini gerçekleştirir.
H999-PROGRAM-EXIT alt programı, dosyaları kapatır ve programı sonlandırır.
Bu şekilde, giriş dosyasındaki her bir kayıt için tarihler arasındaki gün sayısı hesaplanır ve sonuçlar çıktı dosyasına yazılır. Programın çalışması, tüm kayıtların işlenmesiyle tamamlanır ve program sonlanır.




JSL DOSYALARI

## DAYCALC JCL Dosyası Açıklaması

1. `//DAYCALC JOB 1,NOTIFY=&SYSUID`: Bu satır, bir JOB tanımıdır ve bu jobun bir kullanıcıya bildirim yapmasını sağlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir.

2. `//***************************************************/`: Bu satır, yorum satırı olarak kullanılır ve herhangi bir işlevi yoktur.

3. `//* Copyright Contributors to the COBOL Programming Course`: Bu satır, COBOL Programlama Kursuna katkıda bulunan kişileri ve telif hakkını belirtir.

4. `//* SPDX-License-Identifier: CC-BY-4.0`: Bu satır, kullanılan lisansın türünü belirtir.

5. `//COBRUN  EXEC IGYWCL`: Bu satır, IGYWCL adlı bir programı çalıştırmak için EXEC tanımıdır. Bu program, COBOL kaynak kodunu derleyen bir derleyicidir.

6. `//COBOL.SYSIN  DD DSN=&SYSUID..CBL(DAYCALC1),DISP=SHR`: Bu satır, COBOL kaynak kodunun bulunduğu veri setini tanımlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir.

7. `//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(DAYCALC1),DISP=SHR`: Bu satır, derlenmiş COBOL programının yer aldığı yükleme modülü veri setini tanımlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir.

8. `//***************************************************/`: Bu satır, yorum satırı olarak kullanılır ve herhangi bir işlevi yoktur.

9. `// IF RC <= 04 THEN`: Bu satır, bir koşul ifadesi belirtir. RC (Return Code) 04 veya daha küçükse, içindeki adımlar çalıştırılır.

10. `//RUN     EXEC PGM=DAYCALC1`: Bu satır, DAYCALC1 programını çalıştırmak için EXEC tanımıdır.

11. `//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR`: Bu satır, programın çalışması için kullanılacak kütüphane veri setini tanımlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir.

12. `//DATEREC   DD DSN=&SYSUID..QSAM.BB,DISP=SHR`: Bu satır, giriş veri setinin adını ve konumunu tanımlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir.

13. `//PRTLINE   DD DSN=&SYSUID..QSAM, DISP=(NEW,CATLG,DELETE), UNIT=SYSDA, SPACE=(TRK,(10,10),RLSE), DCB=(RECFM=FB,LRECL=58,BLKSIZE=0)`: Bu satır, çıktı veri setinin adını, konumunu ve özelliklerini tanımlar. `&SYSUID` sembolü, kullanıcının sistem kimliğiyle değiştirilir. Bu satırda ayrıca dosya alan gereksinimleri ve dosya kontrol bloğu (DCB) özellikleri de belirtilir.

14. `//SYSOUT    DD SYSOUT=*,OUTLIM=15000`: Bu satır, sistem çıktısının yönlendirildiği yerin tanımıdır. Çıktı sınırı da belirtilmiştir.

15. `//CEEDUMP   DD DUMMY`: Bu satır, hata durumunda olası hata raporlarının yerine yönlendirileceği çıktı tanımıdır.

16. `//SYSUDUMP  DD DUMMY`: Bu satır, sistem çökmeleri durumunda olası hata raporlarının yerine yönlendirileceği çıktı tanımıdır.

17. `//***************************************************/`: Bu satır, yorum satırı olarak kullanılır ve herhangi bir işlevi yoktur.

18. `// ELSE`: Bu satır, bir ELSE bloğunun başlangıcını belirtir. Koşul sağlanmazsa, ELSE bloğu çalıştırılır.

19. `// ENDIF`: Bu satır, bir koşul ifadesinin sonunu belirtir.


SORTING JCL

SORTREPR adında bir JOB tanımlaması başlatır. CLASS=A ve MSGLEVEL=(1,1) gibi parametreler, JOB'un sınıfını ve mesaj düzeyini belirler. MSGCLASS=X,NOTIFY=&SYSUID ise çıktıların nereye gönderileceğini ve kimin bilgilendirileceğini belirler.

IDCAMS programıyla bir veri kümesini silmek için kullanılır. &SYSUID..QSAM.AA veri kümesi NONVSAM olarak belirtilir ve silinir. Ardından, eğer son komut kodu (LASTCC) 08'den küçükse, MAXCC değişkenine 00 atanır.
SORT programı çalıştırılır. SORTIN veri kümesine girilen kayıtlar sıralanır ve SORTOUT veri kümesine yazılır. Bu örnekte, SORTIN veri kümesi elle girilen verileri içerir. SORTOUT veri kümesi tanımlanır ve &SYSUID..QSAM.AA olarak adlandırılır. DISP=(NEW,CATLG,DELETE) seçenekleriyle oluşturulur ve SPACE=(TRK,(5,5),RLSE) ile 5 silindir (track) alan ayrılır. DCB parametreleri ise kayıt formatını (RECFM) ve kayıt uzunluğunu (LRECL) belirtir. SYSIN bölümünde ise "SORT FIELDS=COPY" komutu verilir.

IEFBR14 programı kullanılarak bir veri kümesinin silindiği bölümdür. &SYSUID..QSAM.BB veri kümesi DISP=(MOD,DELETE,DELETE) seçenekleriyle silinir. SPACE=(TRK,0) ile alan ayrılmaz.

SORT programı yeniden çalıştırılır. SORTIN veri kümesi &SYSUID..QSAM.AA olarak belirtilir ve DISP=SHR ile paylaşılır. SORTOUT veri kümesi ise &SYSUID..QSAM.BB olarak adlandırılır ve DISP=(NEW,CATLG,DELETE) seçenekleriyle oluşturulur. SPACE=(TRK,(5,5),RLSE) ile 5 silindir (track) alan ayrılır. DCB parametreleri kayıt formatını (RECFM) ve kayıt uzunluğunu (LRECL) belirtir. SYSIN bölümünde ise sıralama işlemi için SORT FIELDS=(1,4,CH,A) komutu verilir. INCLUDE COND=(1,1,CH,EQ,C'0') ise 1. sütunda değeri '0' olan kayıtları dahil eder. OUTREC FIELDS=(1,42,DATE1) ise sıralama sonrası çıktıda 1-42 arası alanları ve tarih bilgisini ekler.

