# AKBANK-COBOL-BOOTCAMP-HOMEWORKS - 3



FILTER JCL

DELET000 adında bir adım başlatılır ve IEFBR14 programı çalıştırılır. Bu adımda, THEFILE adında bir veri kümesi silinir.
DELET100 adında bir adım başlatılır ve yine IEFBR14 programı çalıştırılır. Bu adımda, başka bir THEFILE veri kümesi silinir.
DELET200 adında bir adım başlatılır ve IEFBR14 programı çalıştırılır. Bu adımda, bir başka THEFILE veri kümesi silinir.
SORT0300 adında bir adım başlatılır ve SORT programı çalıştırılır. Bu adımda, veriler belirli bir sıralamaya göre sıralanır ve yeni bir çıkış veri kümesi oluşturulur.
SORT0400 adında bir adım başlatılır ve yine SORT programı çalıştırılır. Bu adımda, veriler belirli bir şekilde dönüştürülerek başka bir çıkış veri kümesi oluşturulur.
DELET500 adında bir adım başlatılır ve IDCAMS programı çalıştırılır. Bu adımda, Z95635.VSAM.AA adlı bir VSAM veri kümesi silinir.
REPRO600 adında bir adım başlatılır ve yine IDCAMS programı çalıştırılır. Bu adımda, bir QSAM veri kümesi INN001den bir VSAM veri kümesine OUT001 kopyalanır.
SORT0700 adında bir adım başlatılır ve SORT programı çalıştırılır. Bu adımda, veriler belirli bir şekilde sıralanarak başka bir çıkış veri kümesi oluşturulur.


HomeWork003 JCL

COBRUN adında bir adım başlatılır ve IGYWCL programı çalıştırılır. Bu adım, COBOL derlemesini gerçekleştirir.
COBOL.SYSIN adında bir giriş veri seti tanımlanır. Bu veri seti, COBOL kaynak kodunu içerir.
LKED.SYSLMOD adında bir çıkış veri seti tanımlanır. Bu veri seti, bağlantı (link) aşamasında oluşturulan yürütülebilir modülü içerir.
Kodun devamında, bir dizi adım ve veri seti tanımlanır. Bu adımlar arasında IF kontrol yapısı kullanılır.
DELET100 adında bir adım başlatılır ve IEFBR14 programı çalıştırılır. Bu adımda, THEFILE adındaki veri kümesi silinir.
Ardından, RUN adında bir adım başlatılır ve HomeWork003 programı çalıştırılır. Bu adımda, COBOL programı çalıştırılır ve çeşitli veri kümesi tanımları yapılır.
Son olarak, ACCFILE ve OUTFILE gibi çıkış veri setleri tanımlanır.


HomeWork003 CBL

IDENTIFICATION DIVISION bölümünde program bilgileri ve adı belirtilmiştir.
ENVIRONMENT DIVISION bölümünde programın çalışacağı ortam ayarları tanımlanır.
DATA DIVISION bölümünde programın kullanacağı veri yapısı tanımlanır.
WORKING-STORAGE SECTION bölümünde programın çalışma alanı ve değişkenleri tanımlanır.
PROCEDURE DIVISION bölümünde programın iş mantığı yer alır.
Programın iş mantığı aşağıdaki adımlardan oluşur:

OPEN-FILES adında bir işlev (perform) tanımlanmıştır. Bu işlev, giriş ve çıkış veri setlerini açar.
PROCESS-FILE adında bir işlev tanımlanmıştır. Bu işlev, veri setini işleyen bir döngü içerir.
PROCESS-CUSTOMER adında bir işlev tanımlanmıştır. Bu işlev, her müşteri kaydını işler ve geçerlilik kontrolü yapar.
CLOSE-FILES adında bir işlev tanımlanmıştır. Bu işlev, giriş ve çıkış veri setlerini kapatır.
DISPLAY-REPORT adında bir işlev tanımlanmıştır. Bu işlev, raporu ekrana yazdırır.