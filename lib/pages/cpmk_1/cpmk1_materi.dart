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

class CPMK1Materi extends StatefulWidget {
  const CPMK1Materi({Key? key}) : super(key: key);

  @override
  State<CPMK1Materi> createState() => _CPMK1MateriState();
}

class _CPMK1MateriState extends State<CPMK1Materi> {
  final String title = 'CPMK 1 : Pengertian Moral';

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
                    child: const YoutubeWidget(youtubeID: 'iGT9QltrNk8'),
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
                  subtitle: 'A. Makna Moral',
                ),
                TextMateri(
                  text:
                      '     Moral berasal dari nilai tentang sesuatu yang diwujudkan dalam bentuk perilaku. Jadi suatu moral melekat dengan nilai dari perilaku tersebut dan tidak ada perilaku yang tidak bebas dari nilai. Hanya barangkali sejauh mana kita memahami nilai-nilai yang terkandung di dalam perilaku seseorang atau sekelompok memungkinkan berada dalam kondisi tidak jelas. Banyak sekali generasi muda pada zaman sekarang sangat kurang dalam penilaian sikap dan tingkah lakunya kepada para orang tua dan pada teman seumurannya. Banyak dari generasi muda saat ini telah rusak dan tidak sopan atau hormat kepada orang tua atau sesorang yang umurnya lebih tua dari dirinya. Hal ini di sebabkan karena tidak adanya pengarahan moral yang di berikan.',
                ),
              ],
            ),
          ),

          // Page 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: const [
                SizedBox(height: 20),
                TextMateri(
                  text:
                      '     Ada beberapa pakar yang mengembangkan pembelajaran nilai moral, dengan tujuan membentuk watak atau karakterstik. Pakar-pakar tersebut di antaranya Newman, Simon, Howe, dan Lickona. Dari beberapa pakar tersebut, pendapat Lickona lebih cocok diterapkan untuk membentuk watak atau karakter. Pandangan Lickona (1992) tersebut dikenal dengan educating for character atau pendidikan untuk membangun karakter atau watak. Dalam hal ini, Lickona berpendapat bahwa pembentukan karakter atau watak dapat dilakukan melalui 3 (tiga) kerangka pikir, yaitu konsep moral (moral knowing), sikap moral (moral feeling), dan perilaku moral (moral behavior). Dengan demikian, hasil pembentukan sikap karakter anak pun dapat dilihat dari tiga aspek, yaitu konsep moral, sikap moral, dan perilaku moral. Lebih jelasnya seperti pada peta konsep di bawah ini',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk1/materi_cpmk1.png',
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
                TextMateri(
                  text:
                      'Pemikiran Lickona ini diupayakan dapat digunakan untuk membentuk watak, agar dapat memiliki karakter demokrasi, sehingga standar kompetensi demokrasi tercapai. Oleh karena itu, materi tersebut harus menyentuh konsep moral (moral knowing) seperti bawah ini:',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk1/materi_cpmk2.png',
                ),
                TextMateri(
                  text:
                      'Selanjutnya materi moral juga mencakup sikap moral (moral feeling) yang meliputi beberapa hal seperti di bawah ini:',
                ),
                ImageMateri(
                  image: 'assets/images/materi_cpmk1/materi_cpmk3.png',
                ),
                TextMateri(
                    text:
                        'Kemudian juga mencakup perilaku moral (moral behavior) yang meliputi beberapa hal seperti di bawah ini'),
                ImageMateri(
                  image: 'assets/images/materi_cpmk1/materi_cpmk4.png',
                ),
                TextMateri(
                  text:
                      'Berdasarkan uraian di atas, dapat disimpulkan bahwa pengertian moral atau moralitas adalah suatu tuntutan perilaku yang baik yang dimiliki oleh individu yang tercermin dalam pemikiran atau konsep, sikap, dan tingkah laku sesuai dengan nilai falsafah hidup',
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
                  subtitle: 'B. Nilai Moral Dalam Kehidupan',
                ),
                UnorderedListItem(
                  text:
                      'Religius, dimana sikap dan perilaku yang patuh dalam melaksanakan ajaran agama yang dianutnya, toleran terhadap pelaksanaan ibadah agama lain, dan hidup rukun dengan pemeluk agama lain;',
                ),
                UnorderedListItem(
                  text:
                      'Jujur, yaitu perilaku yang didasarkan pada upaya menjadikan dirinya sebagai orang yang selalu dapat dipercaya dalam perkataan, tindakan, dan pekerjaan;',
                ),
                UnorderedListItem(
                  text:
                      'Toleransi, berupa sikap dan tindakan yang menghargai perbedaan agama, suku, etnis, pendapat, sikap, dan tindakan orang lain yang berbeda dari dirinya;',
                ),
                UnorderedListItem(
                  text:
                      'Disiplin, adalah tindakan yang menunjukkan perilaku tertib dan patuh pada berbagai ketentuan dan peraturan. Perilaku yang menunjukkan upaya sungguh-sungguh dalam mengatasi berbagai hambatan belajar dan tugas, serta menyelesaikan tugas dengan sebaik-baiknya;',
                ),
                UnorderedListItem(
                  text:
                      'Kerja Keras, yaitu perilaku yang menunjukkan upaya sungguh-sungguh dalam mengatasi berbagai hambatan belajar dan tugas, serta menyelesaikan tugas dengan sebaik-baiknya;',
                ),
                UnorderedListItem(
                  text:
                      'Kreatif, adalah cara berpikir dan melakukan sesuatu untuk menghasilkan cara atau hasil baru dari sesuatu yang telah dimiliki;',
                ),
                UnorderedListItem(
                  text:
                      'Mandiri, berupa sikap dan perilaku yang tidak mudah tergantung pada orang lain dalam menyelesaikan tugas-tugas;',
                ),
                UnorderedListItem(
                  text:
                      'Demokratis, cara berfikir, bersikap, dan bertindak yang menilai sama hak dan kewajiban dirinya dan orang lain;',
                ),
                UnorderedListItem(
                  text:
                      'Rasa Ingin Tahu, berupa sikap dan tindakan yang selalu berupaya untuk mengetahui lebih mendalam dan meluas dari sesuatu yang dipelajarinya, dilihat, dan didengar.;',
                ),
                UnorderedListItem(
                  text:
                      'Semangat Kebangsaan, ara berpikir, bertindak, dan berwawasan yang menempatkan kepentingan bangsa dan negara di atas kepentingan diri dan kelompoknya;',
                ),
                UnorderedListItem(
                  text:
                      'Cinta Tanah Air, adalah cara berpikir, bersikap, dan berbuat yang menunjukkan kesetiaan, kepedulian, dan penghargaan yang tinggi terhadap bahasa, lingkungan fisik, sosial budaya, ekonomi, dan politik bangsa.',
                ),
                UnorderedListItem(
                  text:
                      'Menghargai Prestasi, merupakan sikap dan tindakan yang mendorong dirinya untuk menghasilkan sesuatu yang berguna bagi masyarakat, dan mengakui, serta menghormati keberhasilan orang lain;',
                ),
                UnorderedListItem(
                  text:
                      'Bersahabat, adalah tindakan yang memperlihatkan rasa senang berbicara, bergaul, dan bekerja sama dengan orang lain;',
                ),
                UnorderedListItem(
                  text:
                      'Cinta Damai, merupakan sikap, perkataan, dan tindakan yang menyebabkan orang lain merasa senang dan aman atas kehadiran dirinya.',
                ),
                UnorderedListItem(
                  text:
                      'Gemar membaca, kebiasaan menyediakan waktu untuk membaca berbagai bacaan yang memberikan kebajikan bagi dirinya;',
                ),
                UnorderedListItem(
                  text:
                      'Peduli lingkungan, berupa sikap dan tindakan yang selalu berupaya mencegah kerusakan pada lingkungan alam di sekitarnya, dan mengembangkan upaya-upaya untuk memperbaiki kerusakan alam yang sudah terjadi;',
                ),
                UnorderedListItem(
                  text:
                      'Peduli sosial, yaitu ikap dan tindakan yang selalu ingin memberi bantuan pada orang lain dan masyarakat yang membutuhkan;',
                ),
                UnorderedListItem(
                  text:
                      'Tanggung Jawab, merupakan sikap dan perilaku seseorang untuk melaksanakan tugas dan kewajibannya, yang seharusnya dia lakukan, terhadap diri sendiri, masyarakat, lingkungan (alam, sosial dan budaya), negara dan Tuhan Yang Maha Esa',
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
                  subtitle: 'C. Fungsi Moral Bagi Kehidupan Manusia',
                ),
                TextMateri(
                  text:
                      '     Nilai moral dan hukum mempunyai keterkaitan yang sangat erat sekali. nilai dianggap penting oleh manusia itu harus jelas, harus semakin diyakini oleh individu dan hasrus diaplikasikan dalam perbuatan.moralitas diidentikan dengan perbuatan baik dan perbuatan buruk (etika) yang mana cara mengukurannya adalah melalui nilai-nilai yang terkandung dalam perbuatan tersebut. Pada dasarnya nilai, moral, dan hukum mempunyai fungsi yaitu untuk melayani manusia. pertama, berfungsi mengingatkan manusia untuk melakukan kebaikan demi diri sendiri dan sesame sebagai bagian dari masyarakat. kedua, menarik perhatian pada permaslahan-permasalahan moral yang kurang ditanggapi manusia. Ketiga, dapat menjadi penarik perhatian manusia kepada gejala “Pembiasaan emosional”.',
                ),
                TextMateri(
                  text:
                      '     Selain itu fungsi dari nilai, moral dan hukum yaitu dalam rangka untuk pengendalian dan pengaturan. Pentingnya system hukum ialah sebagai perlindungan bagi kepentingan-kepentingan yang telah dilindungi agama, kaidah kesusilaan dan kaidah kesopanan karena belum cukup kuat untuk melindungi dan menjamin mengingat terdapat kepentingan-kepentingan yang tidak teratur.untuk melindungi lebih lanjut kepentingan yang telah dilindungi kaidah-kaidah tadi maka diperlukanlah system hukum. Hukum yang mengatur kehidupan masyarakat dan nyata berlaku dalam masyarakat , disebut hukum positif.',
                ),
                TextMateri(
                  text:
                      '     Istilah hukum positif dimaksudkan untuk menandai “diferensi” (perbedaan) dan hukum terhadap kaidah-kaidah lain dalam masyarakat tampil lebih jelas tegas, dan didukung oleh perlengkapan yang cukup agar diikuti oleh anggota masyarakat .sebagai atribut positif ini adalah bukan kaidah sosial yang mengambang atau tidak jelas bentuk dan tujuannya sehingga dibutuhkan lembaga khusus yang bertujuan merumuskan dengan jelas tujuan yang hendak dicapai oleh hukum. Bahkan tatkala terjadi dilema di dalam hukum sendiri, yang dapat disebabkan karena adanya konflik, baik dari lembaga-lembaga hukum, sarana prasarana hukum bahkan rendahnya budaya hukum dalam masyarakat, maka setiap orang (masyarakat dan aparatur hukum) harus mengembalikannya pada rasa keadilan hukum masyarakat, artinya harus mengutamakan moralitas masyarakat.',
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
