import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/item_soal.dart';

class CPMK1Soal4 extends StatefulWidget {
  const CPMK1Soal4({Key? key}) : super(key: key);

  @override
  State<CPMK1Soal4> createState() => _CPMK1Soal4State();
}

class _CPMK1Soal4State extends State<CPMK1Soal4> {
  int indexAnswer = 0;
  int scoreAnswer = 0;

  void changeIndexAnswer({int index = 0, int score = 0}) {
    setState(() {
      indexAnswer = index;
      scoreAnswer = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cpmk1Bloc, Cpmk1State>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Soal 4',
                  style: fontPlay.copyWith(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Hal-hal apa yang membuat anda  nyaman saat bersa di lingkungan masyarakat?',
                  style: fontPlay.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ItemSoal(
                  soal:
                      'A. Saya selalu nyaman berada di lingkungan masyarakat,Cuma memamng saya pendiam',
                  isChoosen: indexAnswer == 1,
                  onPressed: () {
                    changeIndexAnswer(index: 1, score: 1);
                  },
                ),
                ItemSoal(
                  soal:
                      'B. Merasa dianggap,jika tetangga mengajak saya berbicara, dan mengajak saya ikut serta tanpa paksaan.',
                  isChoosen: indexAnswer == 2,
                  onPressed: () {
                    changeIndexAnswer(index: 2, score: 2);
                  },
                ),
                ItemSoal(
                  soal:
                      'C. Hanya sedikit yang membuat saya nyaman, yaitu tetangga yang satu pola pikiran dengan saya.',
                  isChoosen: indexAnswer == 3,
                  onPressed: () {
                    changeIndexAnswer(index: 3, score: 3);
                  },
                ),
                ItemSoal(
                  soal:
                      'D. Hampir tidak ada, Karena asumsi mereka terhadap saya juga tidak ada.',
                  isChoosen: indexAnswer == 4,
                  onPressed: () {
                    changeIndexAnswer(index: 4, score: 4);
                  },
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ButtonSubmit(
                onPressed: indexAnswer > 0
                    ? () {
                        Navigator.pop(context);
                        context.read<Cpmk1Bloc>().add(Cpmk1Action(
                              scoreSoal: state.scoreSoal + scoreAnswer,
                              indexTes: state.indexTes + 1,
                            ));
                      }
                    : () {},
                title: 'Simpan Jawaban',
              ),
            ),
          ],
        );
      },
    );
  }
}
