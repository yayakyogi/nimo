import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/provotion_content.dart';

class Provision extends StatelessWidget {
  const Provision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'Ketentuan',
          style:
              TextStyle(fontSize: 24, fontWeight: semibold, color: whiteColor),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  Icons.navigate_before,
                  size: 40,
                  color: whiteColor,
                ),
              ),
            ),
            Flexible(
              child: PageView(
                controller: controller,
                children: const [
                  ProvotionContent(
                    text: '1. Buka Aplikasi & Masuk Menu Login',
                    image: 'ketentuan_1.jpg',
                  ),
                  ProvotionContent(
                    text: '2. Login (Username & Password)',
                    image: 'ketentuan_2.png',
                  ),
                  ProvotionContent(
                    text:
                        '3. Baca Aturan Permainan dan Ketentuan Sebelum Mulai',
                    image: 'ketentuan_3.png',
                  ),
                  ProvotionContent(
                    text:
                        '4. Selanjutnya Memilih Karakter NimO dari Kiri Menuju Kanan',
                    image: 'ketentuan_4.jpg',
                  ),
                  ProvotionContent(
                    text: '5. Masuk Pada Level (CPMK)',
                    image: 'ketentuan_5.png',
                  ),
                  ProvotionContent(
                    text: '6. Pelajari dan Baca Materi',
                    image: 'ketentuan_6.png',
                  ),
                  ProvotionContent(
                    text: '7. Putar dan Pelajari Video ',
                    image: 'ketentuan_7.png',
                  ),
                  ProvotionContent(
                    text: '8. Pilih salah satu jawaban dari soal',
                    image: 'ketentuan_8.png',
                  ),
                  ProvotionContent(
                    text:
                        '9.	Akan Muncul Pop-Up Emoticon dan Deskripsi Sesuai Jawaban',
                    image: 'ketentuan_9.png',
                  ),
                  ProvotionContent(
                    text: '10. Selesaikan Tahapan Dalam Satu Level',
                    image: 'ketentuan_10.png',
                  ),
                  ProvotionContent(
                    text:
                        '11.	Jika Masih Ragu Bisa Reset Data Jawaban & Kembali Dari Awal',
                    image: 'ketentuan_11.png',
                  ),
                  ProvotionContent(
                    text:
                        '12.	Jika Sudah Yakin Tekan Lihat Skor (Pop-Up Bagde) Melanjutkan Level (CPMK) Berikutnya',
                    image: 'ketentuan_12.png',
                  ),
                  ProvotionContent(
                    text: '13. Jika Menghendaki Keluar dari Menu Exit',
                    image: 'ketentuan_13.png',
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
