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

class CPMK4Materi extends StatefulWidget {
  const CPMK4Materi({Key? key}) : super(key: key);

  @override
  State<CPMK4Materi> createState() => _CPMK4MateriState();
}

class _CPMK4MateriState extends State<CPMK4Materi> {
  final String title = 'CPMK 4 : Filsafat Nilai dan Moral';

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
                    child: const YoutubeWidget(youtubeID: 'l6QRY3yQtSE'),
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
        totalPage: 6,
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
                      '   Filsafat moral merupakan kajian ilmu yang secara garis besar membahas tentang macam macam teori etika. Dalam teori etika terdapat dua pembagian diantaranya teleologis dan deontologis. Teori teleologis menentukan baik buruknya suatu tindakan dari baik buruknya akibat yang menjadi tujuannya. Berbeda dengan etika teleologis, etika deontologis berpandangan bahwa moralitas suatu tindakan melekat pada tindakan itu sendiri bukan finalitasnya. Pada pembahasan kali ini membahas tentang pengertian filsafat dan perbedaan dengan moral, signifikansi filsafat moral, tiga macam pendekatan etika, pusparagam aliran etika, dan konklusi. Filsafat etika atau moral yaitu ilmu yang dipakai dalam nilai norma moral yang menjadi pegangan seseorang dalam mengatur tingkah lakunya.',
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
                  subtitle: 'B. Pengertian Etika dan Perbedaannya dengan Moral',
                ),
                TextMateri(
                  text:
                      '   Etika dalam bahasa yunani yaitu ethikos yang berarti adat atau kebiasaan. Sedangkan secara istilah adalah ilmu tentang apa yang biasa dilakukan atau tentang adat kebiasaan. Ada beberapa ilmuan ilmuan yang mengemukakan pendapatnya tentang etika diantaranya: (1) Ensiklopedi winkler prins, mengemukakan teori tentang Tindakan; (2) New American encyklopedia, mengemukakan tentang teori filsafat moral tidak mengenal fakta tetapi nilai nilai; (3) Hornby dictionary, mengemukakan tentang tindakan dan kelakuan. Dari beberapa ilmuan menyimpulkan bahwa etika merupakan teori tentang perbuatan manusia yang dapat ditentukan oleh akal, jadi etika adalah ilmu sistematik mengenai pendapat, norma, dan moral. Contoh gambar dibawah ini merupakan salah satu penyimpangan dalam norma dan moral saat ini.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk4/materi_cpmk4_1.png',
                ),
                TextMateri(
                  text:
                      '   Membicarakan tentang etika tidak lepas dari kata budi yang berarti tahu. Orang yang berpengetahuan dengan sendirinya berbudi baik, begitupun sebaliknya. Oleh karena itu, maka siapa yang tau akan kebaikan dengan sendirinya terpaksa berbuat baik. Untuk itu perlulah orang pandai menguasai diri dalam segala keadaan. Dan apa yang pada hakikatnya baik adalah juga baik pada kita sendiri, Perbedaan etika dan moral dalam filsafat dilihat dari secara aplikatifnya etika tidak mau mengajarkan apa yang wajib dilakukan orang tetapi dituntut untuk berfikir secara rasional, dan bertanggung jawab. Sedangkan moral merupakan alat untuk menyelesaikan sesuatu menuju yang lebih konteks. Jadi ajaran etika hanya menyampaikan suatu kecakapan teoritis dan ajaran moral bersifat formatif bagi manusia. ',
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
                  subtitle: 'C. Signifikasi Filsafat Moral',
                ),
                TextMateri(
                  text:
                      '   Signifikansi etika membantu mahasiswa untuk mengintegrasikan secara intelektual pengalaman pengalaman baru yang didapatinya sebagai mahasiswa ke dalam kepribadiannya. Tercapainya sebuah signifikansi dikarenakan adanya sifat kritis dari mahasiswa.  Signifikansi etika merupakan suatu cara dalam mengintegrasi suatu pengalaman baru dari mahasiswa baik secara intelektual maupun non intelektual. Sedangkan tujuan materi etika diperguruan tinggi adalah membuat mahasiswa itu lebih kritis. Oleh sebab itu kritis berarti aktif dari berbagai segala macam lembaga normatif.  Dengan adanya lembaga lembaga normatif seseorang mahasiswa akan menjadi mahasiswa yang memiliki jiwa kepribadian yang baik. Lembaga lembaga tersebut diantaranya adalah: (1) diri kita sendiri artinya seseorang itu akan mencapai tingat kedewasaan dan otonominya; (2) lembaga lingkungan masyarakat artinya seorang mahasiswa mendapatkan kecakapan intelektualnya agar tidak monoton; dan (3) lembaga ideologi yang melibatkan manusia pada zaman sekarang artinya dengan adanya sifat ideologis mahasiswa dapat berfikir kritis dan menolak anggapan anggapan yang tidak sesuai dengan nilai nilai dalam kesejatian dirinya ',
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
                  subtitle: 'D.	Macam-Macam Pendekatan Nilai',
                ),
                TextMateri(
                  text:
                      'Ada 3 (tiga) macam dalam pendekatan nilai dalam filsafat moral yaitu:',
                ),
                UnorderedListItem(
                  text:
                      'Nilai deskriptif, yaitu nilai yang menggambarkan tingkah laku moral seseorang dan hanya melukiskan diri seseorang bukan menilai seseorang;',
                ),
                UnorderedListItem(
                  text:
                      'Nilai normative, yaitu nilai yang merupakan bagian terpenting karena adanya diskusi pemecahan masalah norma. Dalam nilai normatif ini yang menjadi subyek adalah diri sendiri. Teori egoisme berpendapat bahwa orang yang betul betul hidup sesuai dengan kepentingannya sendiri adalah seseorang yang matang dan tahu tanggung jawab. Maka kesimpulannya adalah nilai normatif hanya memberi alasan alasan tidak melukiskan. Tujuannya agar dapat merumuskan prinsip prinsip etis yang dapat dipertanggung jawabkan dengan cara rasional dan dapat digunakan dalam praktik;',
                ),
                UnorderedListItem(
                  text:
                      'Metavalue, merupakan kajian yang membahas tentang bahasa etis atau disebut dengan bahasa yang baik, dimana dengan nilai normatif tidak dapat disatukan karena membahas ucapan ucapan etis yang khusus sedangkan nilai normative mengkaji tentang alasan alas an.',
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
                  subtitle: 'E. Aliran-Aliran Filsafat Moral',
                ),
                UnorderedListItem(
                  text:
                      'Hedonisme, sesuatu yang dapat memberikan rasa nikamat kepada seseorang dengan kaidah dasarnya;',
                ),
                UnorderedListItem(
                  text:
                      'Eudemonisme, kaidah dasar etikanya ialah bertindaklah engkau sedemikian rupa sehingga engkau mencapai suatu kebahagiaan. Artinya bahwa segala tindakan manusia itu pasti ada tujuannya. Apbila ingin menuju tujuan tersebut Aristoteles membaginya menjadi 3 (tiga) bagian yaitu: theori, praxis, phronesis. Dengan 3 (tiga) komponen tersebut, etika bukanlah episteme, bukanlah pengetahuan. Tujuan etika bukan pengetahuan lebih tajam (meskipun unsur pengetahuan tentu terdapat juga), melainkan praxis, bukan yang mengetahui apa itu hidup yang baik, melainkan membuat orang hidup dengan baik.;',
                ),
                UnorderedListItem(
                  text:
                      'Utilitrisme, merupakan teori teleologi yang bersifat universal yang hanya menilai betul dan salahnya tindakan manusia dari segi akibatnya;',
                ),
                UnorderedListItem(
                  text:
                      'Deontologia, menurut Immnuel Kant menyatakan moralitas menyangkut hal baik dan buruk, tetapi bukan sembarang hal yang baik dan buruk, melainkan apa yang baik pada dirinya sendiri, yang baik tanpa pembataasan sama sekali. Seseorang akan melakuan kewajibannya itu di pengaruhi oleh 3 (tiga) faktor, pertama, karena hal itu menguntungkan. Kedua, karena adanya dorongan dalam hati. Ketiga, melakukannya dikarenakan memenuhi kewajiban tersebut. Melakukan kewajiban merupakan suatu hal yang memiliki nilai baik yang tidak ada batasannya, akan inti moralitas bukanlah kesediaan memenuhi kewajiaban, melainkan kesediaan untuk merealisasikan apa yang bernilai',
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
                  subtitle: 'F. Konklusi Filsafat Moral',
                ),
                TextMateri(
                  text:
                      '   Konklusi filsafat moral adalah salah satu dari keistimewaan filsafat moral sebab, filsafat moral inilah yang mengkaji atau berhubungan dengan suatu kebijakan.Jik makna dari filsafat itu sendiri adalah mencintai kebijaksanaan, maka filsafat moral berupaya untuk menggapai kebijakan tersebut dengan menghubungkan persoalan moral. Dalam wacana filsafat moral ini kita dapat mengerti argumen moral sekaligus mengerti mengambil kebijakan terbaik dalam hidup ini.',
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
