import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/pages/choose_caracter.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.isCompleted,
    required this.resultPoint,
    required this.titleNext,
    required this.nextCpmk,
  }) : super(key: key);

  final int resultPoint;
  final bool isCompleted;
  final String titleNext;
  final int nextCpmk;

  @override
  Widget build(BuildContext context) {
    var resultText = '';

    if (resultPoint >= 0 && resultPoint <= 5) {
      resultText = 'Sangat Kurang';
    } else if (resultPoint > 5 && resultPoint <= 10) {
      resultText = 'Cukup Baik';
    } else if (resultPoint > 10 && resultPoint <= 15) {
      resultText = 'Baik';
    } else if (resultPoint > 15 && resultPoint <= 20) {
      resultText = 'Baik Sekali';
    }

    return AlertDialog(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isCompleted
                ? Image.asset('assets/images/achivement.gif', width: 60)
                : Container(),
            const SizedBox(height: 15),
            isCompleted
                ? Text(
                    'Score : $resultPoint',
                    style: fontPlay.copyWith(
                      fontSize: 24,
                      color: whiteColor,
                    ),
                  )
                : Container(),
            const SizedBox(height: 10),
            Text(
              isCompleted
                  ? resultText
                  : 'Harap jawab semua soal terlebih dahulu!',
              style: fontPlay.copyWith(
                fontSize: isCompleted ? 24 : 20,
                color: whiteColor,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            BlocBuilder<CpmkActiveBloc, CpmkActiveState>(
              builder: (context, state) {
                return ButtonSubmit(
                  title: !isCompleted ? 'Tutup' : titleNext,
                  onPressed: () {
                    if (isCompleted) {
                      // save global score
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: nextCpmk,
                            caracter: state.caracter,
                            scoreGlobal: state.scoreGlobal + resultPoint,
                          ));

                      // reset cpmk1
                      context
                          .read<CpmkBloc>()
                          .add(CpmkAction(scoreSoal: 0, indexTes: 0));

                      // redirect to page choose caracter
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseCaracter(),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                    // !isCompleted
                    //     ? Navigator.pop(context)
                    //     : Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const ChooseCaracter(),
                    //         ),
                    //       );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
