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

class CPMK5Materi extends StatefulWidget {
  const CPMK5Materi({Key? key}) : super(key: key);

  @override
  State<CPMK5Materi> createState() => _CPMK5MateriState();
}

class _CPMK5MateriState extends State<CPMK5Materi> {
  final String title = 'CPMK 5 : Pendidikan Nilai di Sekolah';

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
                    child: const YoutubeWidget(youtubeID: 'qJIGGgks57M'),
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
        totalPage: 10,
        onEnd: () => onEnd(),
        onFinish: () => onEnd(),
        onSkip: () => onEnd(),
        background: [
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
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
                  subtitle: 'A. Pelaksanaan Pendidikan Nilai di Sekolah',
                ),
                TextMateri(
                  text:
                      '   Sekolah sebagai tempat warga sekolah berinteraksi antara satu dengan lainnya dipastikan melibatkan beragam nilai kehidupan. Nilai-nilai kehidupan di sekolah dapat berupa nilai yang secara sengaja dilembagakan melalui ketentuan formal dalam tatatertib sekolah atau diatur dalam kurikulum tertulis. Selain itu juga terdapat nilai-nilai yang lahir secara pribadi dan ditampilkan dalam bentuk pikiran, ucapan, dan tindakan seseorang. Nilai yang direfleksikan melalui tampilan seseorang tersebut berperan untuk membentuk iklim budaya sekolah yang penuh makna. Sekolah sebagai salah satu tempat pelaksanaan kegiatan pendidikan tidak terlepas dari nilai-nilai sehingga sekolah mempunyai peran dalam pendidikan nilai. Pendidikan nilai dapat diberikan dengan cara langsung dengan penentuan perilaku yang dinilai baik, sedangkan cara tidak langsung diberikan dengan menentukan perilaku yang diinginkan dengan menciptakan situasi yang memungkinkan perilaku yang baik dapat diterapkan. Pendidikan nilai menggunakan pendekatan komprehansif yang harapannya mampu membuat keputusan moral dan memiliki perilaku yang baik berkat adanya pembiasaan dalam proses pendidikan.',
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
                  subtitle: 'B. Inkulkasi Nilai',
                ),
                TextMateri(
                  text:
                      '    Inkulkasi merupakan metode pendidikan nilai dengan penanaman nilai. Inkulkasi berbeda dengan indoktrinasi, sebab keduanya memiliki ciri-ciri yang sangat bertolak belakang, dengan ciri-ciri inkulkasi sebagai berikut: (1) mengomunikasikan kepercayaan, adil, dan menghargai pandangan orang lain; (2) menciptakan pengalaman sosial dan emosional mengenai nilai-nilai; (3) membuat aturan, penghargaan, dan memberikan konsekuensi disertai alasan. Pada gambar di bawah ini contoh inkulkasi yang baik di kelas pembelajaran.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk5/materi_cpmk5_1.jpg',
                ),
                TextMateri(
                  text:
                      '   Inkulkasi dilakukan untuk mendemontrasikan kepada subyek didik mengenai cara terbaik untuk mengatasi berbagai masalah. Inkulkasi (penanaman) nilai memberikan penekanan pada penanaman nilai-nilai sosial dalam diri siswa. Inkulkasi merupakan metode penyampaian pendidikan nilai secara langsung, sebab dimulai dengan penentuan perilaku yang dinilai baik kemudian ditanamkan ke dalam diri.',
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
                  subtitle: 'C. Keteladanan',
                ),
                TextMateri(
                  text:
                      '    Keteladanan atau modeling merupakan metode yang biasa digunakan dalam pendidikan nilai dan spiritualitas. Untuk dapat menggunakan metode ini terdapat dua syarat yang harus dipenuhi yaitu guru atau orang tua harus berperan sebagai model yang baik, dan meneladani orang-orang terkenal yang berakhlak mulia. Perilaku yang secara alami dijadikan model oleh anak-anak adalah cara guru dan orang tua menyelesaikan masalah secara adil, menghargai pendapat anak, dan mengkritik orang lain secara santun. Keteladanan atau pemberian contoh di sekolah misalnya berpakaian rapi, dapat tepat pada waktunya, bekerja keras, bertutur kata yang sopan, jujur, menjaga kebersihan lingkungan.',
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
                  subtitle: 'D.	Fasilitasi',
                ),
                TextMateri(
                  text:
                      '     Fasilitasi ini lebih melatih subyek didik dalam mengatasi masalah-masalah dengan pemberian kesempatan kepada subyek didik..Fasilitasi memberikan kesempatan untuk melakukan perbuatan moral dalam mengatasi masalah-masalah. Fasilitasi di sekolah akan membantu dalam menjalin hubungan baik antara guru dan siswa, menolong siswa memahami nilai, membantu siswa bertindak sesuai nilai secara konsisten, dan terus termotivasi mengatasi permasalahan yang berkaitan dengan nilai. Kegiatan fasilitasi akan memberikan dorongan siswa dalam pemahaman, kesadaran, dan tindakan nilai sehingga akan menjadi suatu semangat untuk selalu menjunjung tinggi nilai dalam kehidupannya.',
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
                  subtitle: 'E. Pengembangan Keterampilan Akademik dan Sosial',
                ),
                TextMateri(
                  text:
                      '    Keterampilan yang diperlukan agar seseorang dapat mengamalkan nilai-nilai yang dianut sehingga berperilaku konstruktif dan bermoral dalam masyarakat. Ketermpilan tersebut antara lain adalah berpikir kritis, berpikir kreatif, berkomunikasi secara jelas, meyimak, bertindak asertif, dan menemukan resolusi konflik yang secara ringkas disebut keterampilan akademik dan keterampilan sosial. Keterampilan akademik dan sosial dalam pendekatan pendidikan diperlukan untuk mengenal dan memahami nilai dengan kemampuan berpikir anak dalam mengatasi suatu permasalahan dengan baik. ',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Page 6
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'F. Pendekatan Penamaan Nilai',
                ),
                TextMateri(
                  text:
                      '   Pendekatan penanaman nilai (inculcation approach) merupakan suatu pendekatan pedidikan nilai yang lebih memberi penekanan pada penanaman nilai-nilai sosial ke dalam diri siswa. Tujuan pendekatan ini adalah agar diterimanya nilai sosial tertentu oleh siswa dan berubahnya nilai-nilai siswa yang tidak sesuai dengan nilai-nilai-nilai-nilai sosial yang diinginkan. Dengan ditanamkannya nilai-nilai ke dalam diri siswa, harapannya siswa dapat menerima dan selanjutnya dapat merubah nilai-nilai yang tidak sesuai agar sesuai berdasarkan nilai-nilai yang telah diterimanya.',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Page 7
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'G. Pendekatan Perkembangan Moral Kognitif',
                ),
                TextMateri(
                  text:
                      '    Pendekatan perkembangan moral kognitif merupakan pendekatan yang mempunyai karakteristik penekanan pada aspek kognitif dan perkembangannya, mendorong siswa untuk berpikir aktif menganai masalah-masalah moral dan dalam membuat keputusan-keputusan moral. Tujuan utama pendekatan ini ada dua yaitu membantu siswa membuat pertimbangan moral yang lebih kompleks berdasarkan pada nilai yang lebih tinggi dan mendorong siswa untuk mendiskusikan alasan-alasannya memilih nilai dan posisinya dalam suatu masalah moral. Proses pengajaran nilai menurut pendekatan ini didasarkan pada dilema moral, yaitu dengan menggunakan metode diskusi kelompok.',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Page 8
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'H. Pendekatan Analisis Nilai',
                ),
                TextMateri(
                  text:
                      '   Pendekatan analisis nilai merupakan pendekatan yang memberikan penekanan kepada perkembangan kemampuan dalam berpikir secara logis melalui cara dalam menganalisis permasalahan yang berkaitan dengan nilai-nilai sosial. Tujuan utama pendidikan nilai-nilai menurut pendekatan ini ada dua yaitu membantu siswa menggunakan kemampuan berpikir logis dan penemuan ilmiah dalam menganalisis masalah sosial yang berkaitan dengan nilai tertentu, dan membantu siswa menggunakan proses berpikir rasional dan analitik dalam menghubungkan dan merumuskan konsep tentang nilai mereka. ',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Page 9
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'I. Pendekatan Klarifikasi Nilai',
                ),
                TextMateri(
                  text:
                      '     Pendekatan klarifikasi nilai menekankan pada usaha untuk membantu siswa dalam mengkaji perasaan dan perbutannya sendiri sebagai upaya untuk meningkatkan kesadaran akan nilai-nilai mereka sendiri.Menurut pendekatan ini, tujuan pendidikan nilai ada tiga yaitu: (1) membantu menyadari dan mengidentifikasi nilai-nilai diri sendiri dan orang lain; (2) membantu berkomunikasi secara terbuka dan jujur dengan orang lain yang berhubungan dengan nilai-nilainya sendiri; dan(3) membantu menggunakan secara bersama-sama kemampuan berpikir rasional dan kesadaran emosional, memahami perasaan, nilai, dan pola tingkah laku mereka sendiri. Dengan pendekatan ini, proses pengajaran dilakukan dengan metode dialog, menulis, diskusi dalam kelompok besar atau kecil, dan lain sebagainya.',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Page 10
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                SubtitleMateri(
                  subtitle: 'J. Pendekatan Pembelajaran Berbuat',
                ),
                TextMateri(
                  text:
                      '   Pendekatan pembelajaran berbuat merupakan pendekatan pendidikan nilai yang menekankan kepada usaha untuk memberikan kesempatan untuk melakukan perbuatan-perbuatan moral, yang yang dilakukan secara individual maupun secara berkelompok. Terdapat dua tujuan utama pendidikan nilai menurut pendekatan ini yaitu memberi kesempatan siswa untuk melakukan perbuatan moral baik secara individu atau kelompok, dan mendorong siswa untuk melihat diri sendiri sebagai makhluk individu dan makhluk sosial dalam pergaulan dengan sesama. Metode pengajaran dalam pendekatan ini yaitu pembelajaran secara individu atau kelompok, penyelidikan kepustakaan, penyelidikan lapangan, diskusi kelas, projek-projek tertentu di sekolah atau masyarakat, praktik keterampilan dalam berorganisasi.',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
