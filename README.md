# L-NUX_PROJE_ps-aux


***Projenin genel olarak yaptığı iş şu şekildedir:

.Bu proje bash dilinde yazılmıştır ve GUI olarak zenıty kullanılmıştır.

.Kullanıcıdan bir süreç seçmesi için bir menü penceresi açılır. Bu menü, ps aux komutu ile sistemde çalışan tüm süreçlerin listesi oluşturulur. awk komutu ile süreçlerin .PID numaraları ve isimleri ayıklanır ve zenity komutu ile bir liste penceresi açılır.

.Eğer kullanıcı seçimi iptal ederse (hiçbir süreci seçmezse), döngüden çıkılır. Aksi halde, kullanıcının seçtiği sürecin PID numarası ve ismi ayıklanır.

.Kullanıcıdan seçilen süreci öldürmeyi onaylaması için bir kutu penceresi açılır. Eğer kullanıcı "Evet" seçeneğini seçerse, süreci öldürmeyi onaylamaya tekrar davet edilir. Aksi halde, süreci öldürme işlemi iptal edilir.

.Eğer kullanıcı hala süreci öldürmeyi onaylarsa, seçilen süreci öldürür ve bir bilgi penceresi açılarak, sürecin öldürüldüğü bildirilir. Aksi halde, süreci öldürme işlemi iptal edilir ve bu durum kullanıcıya bildirilir.

.Döngü, kullanıcı seçimi iptal edene kadar devam eder.


***Projede kullanılan önemli komutlar ve fonksiyonları şu şekilde açıklayabiliriz :

ps aux: Bu komut, sistemde çalışan tüm süreçlerin bir listesi oluşturur. aux argümanları, aşağıdaki anlamlara sahiptir:

a: Tüm süreçleri listeler, yani sadece kendi süreçlerinizi değil, tüm kullanıcıların süreçlerini de listeler.
u: Süreçlerin sahibi olan kullanıcının ismini de listelemeyi sağlar.
x: Çalışmayan süreçleri de listelemeyi sağlar.
awk: Bu komut, veri dosyalarını düzenleyerek verileri işlemeyi ve çıktı oluşturmayı sağlar. Bu kod satırında, awk komutu ile ps aux çıktısından süreçlerin PID numaralarını ve isimlerini ayıklanıp, yeni bir liste oluşturulur.

zenity --list: Bu zenity komutu, bir liste penceresi açar. --title argümanı ile pencerenin başlığı belirtilir, --column argümanları ile sütunların isimleri belirtilir ve --width ve --height argümanları ile pencerenin genişliği ve yüksekliği belirtilir.

if [ -z "$selected_process" ]; then: Bu koşul ifadesi, $selected_process değişkeninin boş olup olmadığını kontrol eder. Eğer değişken boşsa (-z), koşul doğru olur ve koşulun içinde yer alan komutlar çalıştırılır.

zenity --question: Bu zenity komutu, bir soru penceresi açar. --title argümanı ile pencerenin başlığı belirtilir, --text argümanı ile pencerede gösterilecek metin belirtilir, --ok-label ve --cancel-label argümanları ile "Evet" ve "Hayır" seçeneklerinin etiketleri belirtilir ve --width ve --height argümanları ile pencerenin genişliği ve yüksekliği belirtilir.

kill: Bu komut, belirtilen PID numarasına sahip süreci öldürür.
zenity --info: Bu zenity komutu, bir bilgi penceresi açar. --title argümanı ile pencerenin başlığı belirtilir, --text argümanı ile pencerede gösterilecek metin belirtilir ve --width ve --height argümanları ile pencerenin genişliği ve yüksekliği belirtilir.
break: Bu komut, en içteki döngüden çıkar. Bu kod satırında, eğer kullanıcı seçimi iptal ederse (hiçbir süreci seçmezse) döngüden çıkılır.

***Şimdi projeyi ekran görüntüleriyle inceleyelim :


* süreç seçme ekranımız : Burada kullanıcıya öldürmek istediği sürecin ismi ve PİD numarasını gösteriyoruz ve kullanıcı süreci seçip işleme başlıyor .

![sürec sec](https://user-images.githubusercontent.com/56317180/210853947-6b0106f2-bd86-448d-bd60-182382c81c2e.png)

* daha sonra kullanıcıya bir uyarı mesajı veriyoruz "seçilen süreci öldürmek istediğinizden emin misiniz " şeklinde 

![süreç öldürme ekranı](https://user-images.githubusercontent.com/56317180/210854224-510cd975-7f12-4f77-b642-68e2e3560afe.png)

* kullanıcı "evet" seçeneğini seçerse kullanıcıya yeni bir pencerede bir uyarı mesajı daha gönderiyoruz :"bu işlem kötü sonuçlar doğurabilir ,yine de öldürmek istiyor musunuz" şeklinde.

![2 uyarımesajı](https://user-images.githubusercontent.com/56317180/210854465-bfa88f00-b725-4cc9-adb7-4f064038378a.png)

* kullanıcı yine de evet derse süreç ölüyor ve açılan pencerede "süreç öldürüldü " mesajını gösteriyor .

![süreç öldürüldü ](https://user-images.githubusercontent.com/56317180/210854635-daf8eba7-5a45-47df-8181-5d5ccad6ff42.png)

* eğer kullanıcı işlemden vazgeçerse " süreç öldürme iptal edildi" mesajını alıyor 

![süreç öldürme iptal edildi](https://user-images.githubusercontent.com/56317180/210854767-666b0def-3f5e-4e81-b532-7c1d68414429.png)


 * daha sonra kullanıcıyı süreç seçme penceresine geri atıyor.




*** YOUTUBE LİNKİ : 



HAZIRLAYAN: SEYFETTİN GÖK 

Bursa Teknik üniversitesi 














