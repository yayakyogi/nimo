import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_materi.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_soal1.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_soal2.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_soal3.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_soal4.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_soal5.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/mainboard/level.dart';
import 'package:nimo/widgets/mainboard/line_green.dart';
import 'package:nimo/widgets/mainboard/line_vertical.dart';
import 'package:nimo/widgets/mainboard/mainboard.dart';
import 'package:nimo/widgets/mainboard/result.dart';
import 'package:nimo/widgets/mainboard/skor_button.dart';
import 'package:nimo/widgets/mainboard/title.dart';

class CPMK5Board extends StatefulWidget {
  const CPMK5Board({Key? key}) : super(key: key);

  @override
  State<CPMK5Board> createState() => _CPMK5BoardState();
}

class _CPMK5BoardState extends State<CPMK5Board> {
  final String title = 'CPMK 5 : Pendidikan Nilai di Sekolah';

  Future dialog(Widget widget) {
    return showDialog(
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }

  // widget point
  Widget point({bool isCompleted = false}) {
    return BlocBuilder<CpmkBloc, CpmkState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => dialog(
            Result(
              titleNext: 'Lihat Score Akhir',
              resultPoint: state.scoreSoal,
              isCompleted: isCompleted,
              nextCpmk: 6,
            ),
          ),
          child: const SkorButton(),
        );
      },
    );
  }

  // * MENU UTAMA
  Widget mainMenu() {
    return BlocBuilder<CpmkBloc, CpmkState>(
      builder: (context, state) {
        return Expanded(
          flex: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                TitleBoard(title: title),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Materi
                    Row(
                      children: [
                        Level(
                          isActive: state.indexTes == 0,
                          isDone: state.indexTes > 0,
                          onPressed: () => Navigator.push(
                            context,
                            PageTransition(widget: const CPMK5Materi()),
                          ),
                        ),
                        LineGreen(
                          isActive: state.indexTes == 1,
                          isDone: state.indexTes > 1,
                        ),
                      ],
                    ),
                    // Soal 1
                    Row(
                      children: [
                        Level(
                          isActive: state.indexTes == 1,
                          isDone: state.indexTes > 1,
                          onPressed: () => dialog(const CPMK5Soal1()),
                        ),
                        LineGreen(
                          isActive: state.indexTes == 2,
                          isDone: state.indexTes > 2,
                        ),
                      ],
                    ),
                    // Soal 2
                    Column(
                      children: [
                        Level(
                          isActive: state.indexTes == 2,
                          isDone: state.indexTes > 2,
                          onPressed: () => dialog(const CPMK5Soal2()),
                        ),
                        LineVertical(
                          isActive: state.indexTes == 3,
                          isDone: state.indexTes > 3,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Soal 5
                    Level(
                      isActive: state.indexTes == 5,
                      isDone: state.indexTes > 5,
                      onPressed: () => dialog(const CPMK5Soal5()),
                    ),
                    LineGreen(
                      isActive: state.indexTes == 5,
                      isDone: state.indexTes > 5,
                    ),
                    // Soal 4
                    Level(
                      isActive: state.indexTes == 4,
                      isDone: state.indexTes > 4,
                      onPressed: () => dialog(const CPMK5Soal4()),
                    ),
                    LineGreen(
                      isActive: state.indexTes == 4,
                      isDone: state.indexTes > 4,
                    ),
                    // Soal 3
                    Level(
                      isActive: state.indexTes == 3,
                      isDone: state.indexTes > 3,
                      onPressed: () => dialog(const CPMK5Soal3()),
                    ),
                  ],
                ),
                point(isCompleted: state.indexTes > 5),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Mainboard(
      title: title,
      menu: mainMenu(),
    );
  }
}
