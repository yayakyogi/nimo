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

class CPMK3Materi extends StatefulWidget {
  const CPMK3Materi({Key? key}) : super(key: key);

  @override
  State<CPMK3Materi> createState() => _CPMK3MateriState();
}

class _CPMK3MateriState extends State<CPMK3Materi> {
  final String title = 'CPMK 3 : Kawasan Moral';

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
                    child: const YoutubeWidget(youtubeID: 'B4VGztBlTe8'),
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
                  subtitle: 'A. Pembagian Kawasan Moral',
                ),
                TextMateri(
                  text:
                      '     Komponen utama moralitas, berdasarkan dari beberapa hasil penelitian mengenai moralitas pada umumnya terbagi dalam 3 (tiga) kawasan, yaitu adalah: (1) pemikiran tentang moral; (2) perasaan moral; dan (3) perilaku moral, dengan melibatkan perhatian 3 (tiga) golongan, antara lain adalah: (1) kaum behavioris yang mengkaji masalah perilaku; (2) para pengamat perkembangan kognisi mempelajari masalah kognisi; dan (3) kaum psikoanalisis mengkaji masalah afeksi. Mekanisme psikologis mempradugakan bahwa aspek moralitas mencakup ketiga kawasan tadi. Dari mekanisme psikologis itu selanjutnya memandang bahwa kondisionisasi dan model perilaku menentukan perilaku, konflik kognisis dan ekuilibriasi mempengaruhi berfikir, dan gerak-gerik libido serta superego menguasai perasaan',
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
                  subtitle: 'B. Penalaran Moral',
                ),
                TextMateri(
                  text:
                      '    Penalaran moral merupakan suatu proses pertimbangan moral sebelum suatu tindakan moral dilakukan seseorang. Penalaran ini terjadi ketika seseorang dihadapkan pada dilema perbuatan moral, sehingga ia diminta melakukan pemilihan keputusan moralnya berdasarkan penalaran moral itu. Dalam penalaran moral ini, suatu prinsip moral tidak sekadar merupakan aturan bagi suatu tindakan, melainkan sekaligus merupakan alasan orang bertindak. Penalaran moral tentu saja tidak sekadar melibatkan aktivitas intelektualitas (rasionalitas), tetapi juga melibatkan suara hati nurani sebagai upaya pertimbangan moral. Hati nurani berkaitan erat dengan kenyataan bahwa manusia mempunyai kesadaran, karena hanya manusia yang mempunyai kesadaran. Suara hati nurani merupakan judgement atas pilihan moral berdasarkan pertimbangan atau penalaran moral itu sendiri dan penalaran ini lebih ke arah sisi kognitif.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk3/materi_cpmk3_1.png',
                ),
                TextMateri(
                  text:
                      '     Dalam wacana keagamaan (Islam), suatu perbuatan dianggap bermoral atau memiliki makna ketika ia dilakukan dengan kesadaran atau akal sehat. Dimana suatu tindakan pertama-tama akan dilihat dari ada atau tidak adanya pengetahuan terhadap tindakan yang harus dijalani atau bahkan larangan yang harus dijauhi, sebelum diputuskan untuk melakukan suatu perbuatan. Dari sini, maka penalaran (rasio atau akal) dan hati nurani (qalb) menjadi aspek penting untuk menilai apakah keputusan moral atas suatu perbuatan (amal) itu bermakna (ibadah) ataukah tidak. Orang yang tidak memiliki penalaran sehat akan tidak dikenai sanksi ketika tidak melakukan kebajikan (tuntutan moral atau kewajiban agama). ',
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
                  subtitle: 'C. Perasaan Moral',
                ),
                TextMateri(
                  text:
                      '     Dalam pandangan psikoanalisis, perasaan moral melibatkan orientasinya pada sentimen harga-diri. Sentimen harga-diri itu, pertama-tama ialah suatu sistem emosi dan kecenderungan yang terorganisasi, suatu kelompok perasaan dan impuls yang berpusat di sekitar objek, yaitu ide tentang diri sendiri. Perasaan moral akan terkait dengan masalah penilaian moral yang tidak dapat disebut salah dan benar, apabila menuntut pertanggungjawaban tindakan moral itu sendiri. Oleh karena itu dianggap sebagai emotivisme. Menurut emotivisme penilaian hanya mengungkapkan perasaan seseorang atau kelompok orang. Penilaian menurut emotivisme dalam hal suara hati nurani dan penilaian moral pada umumnya tidak benar atau salah, karena tidak menuntut pertanggungjawaban sehingga tidak bersifat objektif. ',
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
                      '    Perilaku moral hendaknya diartikan sebagai suatu pola perilaku di dalam kerangka konteks tertentu, dengan memperhatikan proses-proses batin yang melahirkan perilaku moral tersebut. Tanpa mengetahui proses-proses batin yang melahirkan perilaku tersebut maka kita tidak mungkin dapat menyebut perilaku tersebut sebagai "perilaku moral", tidak pula kita mengetahui bagaimana menentukan hal yang serupa dalam situasi-situasi yang lain. Perhatian terhadap konteks situasional dan proses-proses batin yang melahirkan perilaku itu bukan sekadar tuntutan kecermatan akademis, melainkan pula sebagai hal esensial bagi pemahaman, perkiraan serta mempengaruhi perilaku moral. Berikut di bawah ini gambar contoh perilaku moral yang menyimpang.',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk3/materi_cpmk3_2.jpg',
                ),
                TextMateri(
                  text:
                      '     Ada (4) empat komponen proses pokok yang mempengaruhi lahirnya perilaku moral. Komponen pertama, fungsi utamanya untuk menafsirkan situasi, ditinjau dari sudut bagaimana perilaku seseorang mempengaruhi kesejahteraan orang lain. Komponen kedua, fungsi utamanya adalah merumuskan bagaimana hendaknya suatu perangkat tindakan moral dan mengidentifikasi moral yang ideal dalam suatu situasi tertentu. Komponen ketiga, fungsi utamanya adalah menyeleksi berbagai hasil penilaian tentang citra moral, mana yang patut dilaksanakan dan memutuskan apakah mencoba untuk memenuhi citra moral atau seseorang ataukah tidak. Komponen keempat, fungsi utamanya adalah untuk memutuskan dan mengimplementasikan apa yang hendak dilakukan. ',
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
                  subtitle: 'E. Tindakan Moral',
                ),
                TextMateri(
                  text: 'Tindakan moral memiliki tiga tipe, yaitu:',
                ),
                UnorderedListItem(
                    text:
                        'Tipe rasionalis, memandang penalaran moral sebagai suatu keharusan serta mencukupi bagi lahirnya suatu tindakan moral'),
                UnorderedListItem(
                    text:
                        'Tipe naturalistik, yaitu seorang etis yang bertanggung jawab dan berpandangan bahwa moral itu merupakan suatau keharusan, akan tetapi tidak mencukupi untuk melahirkan suatu tindakan moral.'),
                UnorderedListItem(
                    text:
                        '3.	Tipe behavioristik-sosial, moralitas dapat ditentukan tanpa merujuk kepada pola pikir sang pelaku.'),
                TextMateri(
                  text:
                      '    Tindakan moral dapat diartikan sebagai tindakan yang sejalan atau konsisten dengan pertimbangan moral, bagaimanapun tindakan itu adanya. Jenis pertimbangan moral sebagai pusat tindakan moral, adalah: (1) pertimbangan yang deontis ialah pertimbangan yang menyatukan atau mengharuskan bahwa sesuatu tindakan itu benar. Ciri khas pertimbangan deontis ialah pertimbangan tersebut dijabarkan dari suatu prinsip; (2) pertimbangan atas dasar tanggung jawab mencakup suatu unsur "aretaic", yaitu suatu pertimbangan tentang apa yang menurut moral itu baik, buruk, dapat dipertanggung-jawabkan atau patut dicaci-maki. Pertimbangan moral yang bersifat klasikal, berkorelasi dengan atau meramalkan tindakan moral dalam situasi wajar maupun eksperimental. Di bagian lain, pertimbangan moral relevansinya sama dengan tindakan moral. Selain itu, tindakan moral juga didukung oleh suasana moral yang merupakan interaksi antara kemampuan seseorang dengan peristiwa moral yang terdapat dalam situasinya.',
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
