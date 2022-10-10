import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/item_soal.dart';

class CPMK1Soal2 extends StatefulWidget {
  const CPMK1Soal2({Key? key}) : super(key: key);

  @override
  State<CPMK1Soal2> createState() => _CPMK1Soal2State();
}

class _CPMK1Soal2State extends State<CPMK1Soal2> {
  int indexAnswer = 0;
  int scoreAnswer = 0;

  void changeIndexAnswer({int index = 0, int score = 0}) {
    setState(() {
      indexAnswer = index;
      scoreAnswer = score;
    });
  }

  Future dialog() {
    var report = '';
    var emoticon = '';

    switch (scoreAnswer) {
      case 1:
        report = 'Jawaban hampir tepat, coba lebih baik lagi ya..';
        emoticon = 'sad';
        break;
      case 2:
        report = 'Coba lebih baik lagi. Tetap semangat!';
        emoticon = 'sad';
        break;
      case 3:
        report = 'Jawaban sudah baik, pertahankan ya..';
        emoticon = 'happy';
        break;
      case 4:
        report = 'Jawaban yang bagus, lanjutkan..';
        emoticon = 'happy';
        break;
      default:
    }

    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black26,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 150,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/emoticon_$emoticon.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    report,
                    style: fontPoppins.copyWith(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
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
                  'Soal 2',
                  style: fontPlay.copyWith(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Pernahkan anda tidak menyukai kegiatan masyarakat (seperti ronda, kerja bakti, arisan)',
                  style: fontPlay.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ItemSoal(
                  soal:
                      'A. Tidak pernah, saya selalu menyukai kegiatan kemasyarakatan',
                  isChoosen: indexAnswer == 1,
                  onPressed: () {
                    changeIndexAnswer(index: 1, score: 1);
                  },
                ),
                ItemSoal(
                  soal:
                      'B. Pernah, saya tidak menyukai kegiatan tersebut karena mereka kurang menganggap saya.',
                  isChoosen: indexAnswer == 2,
                  onPressed: () {
                    changeIndexAnswer(index: 2, score: 2);
                  },
                ),
                ItemSoal(
                  soal:
                      'C. Pernah, karena mereka selalu berasumsi, yang tidak hadir, orang yang tidak bisa bertetangga, sehingga saya terpaksa hadir.',
                  isChoosen: indexAnswer == 3,
                  onPressed: () {
                    changeIndexAnswer(index: 3, score: 3);
                  },
                ),
                ItemSoal(
                  soal:
                      'D. Pernah, dan sampai sekarang saya membenci kegiatan kemasyarakatan.',
                  isChoosen: indexAnswer == 4,
                  onPressed: () {
                    changeIndexAnswer(index: 4, score: 4);
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: ButtonSubmit(
                    onPressed: indexAnswer > 0
                        ? () {
                            Navigator.pop(context);
                            context.read<Cpmk1Bloc>().add(Cpmk1Action(
                                  scoreSoal: state.scoreSoal + scoreAnswer,
                                  indexTes: state.indexTes + 1,
                                ));
                            dialog();
                          }
                        : () {},
                    title: 'Simpan Jawaban',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
