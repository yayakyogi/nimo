import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/image_materi.dart';
import 'package:nimo/widgets/materi/appbar.dart';
import 'package:nimo/widgets/materi/materi-content.dart';
import 'package:nimo/widgets/subtitle_materi.dart';
import 'package:nimo/widgets/text_materi.dart';
import 'package:nimo/widgets/unorderlist.dart';
import 'package:nimo/widgets/youtube_player.dart';

class CPMK2Materi extends StatefulWidget {
  const CPMK2Materi({Key? key}) : super(key: key);

  @override
  State<CPMK2Materi> createState() => _CPMK2MateriState();
}

class _CPMK2MateriState extends State<CPMK2Materi> {
  final String title = 'CPMK 2 : Keterkaitan Nilai, Moral dan Karakter';

  Future watchVideo() {
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black26,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Video Penjelasan $title',
                    style: fontPoppins.copyWith(
                      fontSize: 18,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 250,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: const YoutubeWidget(youtubeID: '-asUQs7V6kg'),
                  ),
                  const SizedBox(height: 10),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Tutup',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onEnd() {
    Navigator.pop(context);
    context.read<CpmkBloc>().add(CpmkAction(scoreSoal: 0, indexTes: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: appBar(title: title, onVideoOpen: () => watchVideo()),
      body: MateriContent(
        totalPage: 5,
        onEnd: () => onEnd(),
        onFinish: () => onEnd(),
        onSkip: () => onEnd(),
        background: [
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
        pageBodies: [
          // Page 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'A. Latar Belakang',
                ),
                TextMateri(
                  text:
                      '     Masa remaja merupakan masa penjajakan seseorang untuk menemukan jati dirinya. Pada masa ini seseorang mulai mempelajari segala sesuatu tanpa menginginkan adanya campur tangan orang tua, mereka ingin dirinya berperan dan dianggap mampu dalam segala hal. Remaja tidak takut mencoba segala sesuatu dan mereka tidak berpikir apakah akibatnya dalam jangka panjang. Ironinya, masa remaja merupakan masa yang mudah untuk dihasut oleh orang-orang baru. Akibatnya, banyak remaja yang terjebak dalam halam hal-hal yang tidak semestinya. Padahal, peran remaja di berbagai bidang sangat dibutuhkan. Pada masa remaja, seseorang memiliki tugas perkembangan diantaranya adalah mencapai hubungan baru yang lebih matang dengan teman sebaya, mencapai peran sosial pria dan wanita, mencapai kemandirian emosional dari orang tua dan orang dewasa lainnya, mencapai perilaku sosial yang bertanggung jawab, serta memperoleh perangkat nilai dan sistem etis sebagai pegangan untuk berperilaku mengembangkan ideologi. Berikut di bawah ini ditampilkan perilaku menyimpang secara nilai yang bias akita temui.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk2/materi_cpmk2_1.jpg',
                ),
                TextMateri(
                  text:
                      '     Mengingat betapa pentingnya masa remaja, maka diperlukan sebuah pegangan untuk “peghuni” masa tersebut. Dengan memanfaatkan emosi remaja yang mudah dimasuki hal-hal baru, maka peran orang tua dan lingkungan sangat penting untuk dapat memasukkan nilai-nilai positif yang dapat dijadikan pegangan seorang remaja. Nilai-nilai tersebut penting untuk membentuk perkembangan moral dan sikap remaja menjadi lebih baik.',
                ),
                SizedBox(height: 50),
              ],
            ),
          ),

          // Page 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'B. Hubungan antara Nilai, Moral, dan Karakter',
                ),
                TextMateri(
                  text:
                      '     Nilai merupakan dasar pertimbangan bagi individu untuk sesuatu, moral merupakan perilaku yang seharusnya dilakukan atau dihindari, sedangkan sikap merupakan predikposisi atau kecenderungan individu untuk merespon terhadap suatu objek atau sekumpulan objek debagai perwujudan dari sistem nilai dan moral yang ada di dalam dirinya.  Sistem nilai mengarahkan pada pembentukan nilai-nilai moral tertentu yang selanjutnya akan menentukan sikap individu sehubungan dengan objek nilai dan moral tersebut. Dengan sistem nilai yang dimiliki individu akan menentukan perilaku mana yang harus dilakukan dan yang harus dihindarkan, ini akan tampak dalam sikap dan perilaku nyata sebagai perwujudan dari sistem nilai dan moral yang mendasarinya. Salah satu tugas perkembangan yang harus dilakukan remaja adalah mempelajari apa yang diharapkan oleh kelompok dari masyarakatnya. ',
                ),
                SizedBox(height: 50),
              ],
            ),
          ),

          // Page 3
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle:
                      'C. Faktor-Faktor yang Memengaruhi Perkembangan Nilai, Moral, dan Karakter',
                ),
                TextMateri(
                  text:
                      '     Nilai merupakan dasar pertimbangan bagi individu untuk sesuatu, moral merupakan perilaku yang seharusnya dilakukan atau dihindari, sedangkan sikap merupakan predikposisi atau kecenderungan individu untuk merespon terhadap suatu objek atau sekumpulan objek debagai perwujudan dari sistem nilai dan moral yang ada di dalam dirinya.  Sistem nilai mengarahkan pada pembentukan nilai-nilai moral tertentu yang selanjutnya akan menentukan sikap individu sehubungan dengan objek nilai dan moral tersebut. Dengan sistem nilai yang dimiliki individu akan menentukan perilaku mana yang harus dilakukan dan yang harus dihindarkan, ini akan tampak dalam sikap dan perilaku nyata sebagai perwujudan dari sistem nilai dan moral yang mendasarinya. Salah satu tugas perkembangan yang harus dilakukan remaja adalah mempelajari apa yang diharapkan oleh kelompok dari masyarakatnya. ',
                ),
                UnorderedListItem(
                  text:
                      'Faktor Keluarga, perkembanagan internalisasi nilai-nilai terjadi melalui identifikasi dengan orang-orang yang dianggapnya sebagai model. Bagi anak-anak usia 12 dan 16 tahun, gambaran ideal yang berwibawa atau simpatik, orang-orang terkenal, dan hal-hal yang ideal yang diciptakan sendiri;',
                ),
                UnorderedListItem(
                  text:
                      'Faktor Masyarakat, teori-teori yang non-psikoanalisis beranggapan bahwa hubungan anak-orangtua bukan satu-satunya sarana pembentuk moral. Para sosiolog beranggapan bahwa masyarakat mempunyai peran penting dalam pembentukan moral. Tigkah laku yang terkendali disebabkan oleh adanya kontrol dari masyarakat itu sendiri yang mempunyai sanksi-sanksi tersendiri;',
                ),
                UnorderedListItem(
                  text:
                      'Faktor Lingkungan, dalam usaha membentuk perilaku sebagai pencerminan nilai-nilai hidup tertentu, jelas bahwa lingkungan memegang peran penting. Di antara segala unsur lingkungan sosial yang berpengaruh adalah manusia-manusia yang langsung dikenal oleh seseorang sebagai perwujudan dari nilai-nilai tertentu.',
                ),
                UnorderedListItem(
                  text:
                      'Faktor Kebiasaan yang Berhubungan dengan Nilai Kebudayaan, sikap moral bukan hasil sosialisasi yang diperoleh dari kebiasaan dan hal-hal lain yang berhubungan dengan nilai kebiasaan dan hal-hal lain yang behubungan dengan nilai kebudayaan. Tahap perkembangan moral terjadi dari aktivitas spontan yang berkembang melalui interaksi sosial.',
                ),
                SizedBox(height: 50),
              ],
            ),
          ),

          // Page 4
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle:
                      'D. Perbedaan Individu dalam Nilai, Moral, dan Karakter',
                ),
                TextMateri(
                  text:
                      '   Sesuatu yang dipandang bernilai dan bermoral serta dinilai positif oleh suatu kelompok masyarakat sosial tertentu belum tentu dinilai positif oleh kelompok masyarakat lain. Sama halnya, sesuatu yang dipandang bernilai dan bermoral serta dinilai positif oleh suatu keluarga tertentu belum tentu dinilai positif oleh keluarga lain. Ada suatu keluarga yang mengharuskan para anggota berpakaian muslimah dan sopan karena cara berpakaian seperti itulah dipandang bernilai dan bermoral. Akan tetapi, ada keluarga lain yang lebih senang dan memandang lebih bernilai jika anggotanya berpakaian modis, trendi, dan mengikuti tren mode yang sedang merak dikalangan selebritis. Oleh sebab itu, hal yang wajar jika terjadi perbedaan individual dalam suatu keluarga atau kelompok masyarakat tentang sistem nilai, moral, maupun sikap yang dianutnya. Perbedaan individual didukung oleh fase, tempo, dan irama perkembangan masing-masing individu. Seperti pada gambar di bawah ini yang menghargai perbedaan atau keberagaman.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk2/materi_cpmk2_2.png',
                ),
                TextMateri(
                  text:
                      '    Dalam teori perkembangan pemikiran moral dari Kohlberg juga dikatakan bahwa setiap individu dapat mencapai tingkat perkembangan moral yang paling tinggi, tetapi kecepatan pencapaiannya juga ada perbedaan antara individu satu dengan lainnya meskipun dalam suatu kelompok sosial tertentu. Dengan demikian, sangat dimungkinkan individu yang lahir pada waktu yang relatif bersamaan, sudah lebih tinggi dan lebih maju tingkat pemikirannya.',
                ),
                SizedBox(height: 50),
              ],
            ),
          ),

          // Page 5
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'E. Kesimpulan',
                ),
                TextMateri(
                  text:
                      '     Nilai merupakan hal yang perlu dikenal terlebih dahulu, kemudian dihayati dan didorong oleh moral, baru akan terbentuk sikap tertentu dan akhirnya terwujud perilaku sesuai dengan nilai-nilai yang dimaksud. Dalam konteksnya, hubungan antara nilai, moral, dan sikap adalah jika ketiganya sudah menyatu. Seseorang yang telah mampu mengembangkan dengan baik, sikapnya akan cenderung didasarkan atas nilai-nilai luhur dan aturan moral tertentu sehingga akan terwujud dalam perilaku yang bermoral. Nilai, moral, dan sikap pada remaja memiliki beberapa karakteristik yang berbeda-beda pada tingkatannya. Tingkatan tersebut yaitu, tingkat prakonvensional, konvensional, dan paskakonvensional. Dalam perkembangannya, nilai, moral, dan sikap dipengaruhi oleh faktor keluarga, masyarakat, lingkungan, dan kebiasaan yang berhubungan dengan nilai kebudayaan.',
                ),
                SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}
