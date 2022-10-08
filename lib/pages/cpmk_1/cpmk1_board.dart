import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_materi.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_soal1.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_soal2.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_soal3.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_soal4.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_soal5.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/lottie_animation.dart';

class CPMK1Board extends StatefulWidget {
  const CPMK1Board({Key? key}) : super(key: key);

  @override
  State<CPMK1Board> createState() => _CPMK1BoardState();
}

class _CPMK1BoardState extends State<CPMK1Board> {
  int levelActive = 0;
  int indexAnswerSoal = 0;

  Future dialog(Widget widget) {
    return showDialog(
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }

  // icon logo
  Widget iconLogo() {
    return Image.asset('assets/icons/ic_logo.png', width: 100);
  }

  // widget karakter
  Widget caracter({String caracter = ''}) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(top: 130, bottom: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: primaryColor,
            border: Border.all(color: whiteColor),
          ),
          child: Image.asset('assets/images/$caracter'),
        ),
        Text(
          'CPMK 1',
          style: fontPlay.copyWith(
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // widget button bantuan
  Widget buttonHelp() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 95,
        height: 40,
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.question_mark,
              color: whiteColor,
              size: 20,
            ),
            Text(
              'Bantuan',
              style: fontPlay.copyWith(color: whiteColor),
            )
          ],
        ),
      ),
    );
  }

  // widget point
  Widget point() {
    return BlocBuilder<Cpmk1Bloc, Cpmk1State>(
      builder: (context, state) {
        return Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(top: 40, right: 15),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: whiteColor),
          ),
          child: Center(
            child: Text(
              'Point : ${state.scoreSoal}',
              style: fontPlay.copyWith(
                fontSize: 20,
                color: whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        );
      },
    );
  }

  // widget level
  Widget level({
    required String title,
    required bool isActive,
    required bool isDone,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: !isActive ? null : onPressed,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: isDone
              ? secondaryColor
              : isActive
                  ? primaryColor
                  : secondaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDone || !isActive ? primaryColor : secondaryColor,
          ),
        ),
        child: Center(
          child: isDone
              ? const LottieAnimation(lottieFile: 'done')
              : isActive
                  ? const LottieAnimation(lottieFile: 'active')
                  : const LottieAnimation(lottieFile: 'pending'),
        ),
      ),
    );
  }

  // widget line
  Widget lineGreen({required bool isDone, required bool isActive}) {
    String icon;

    if (isDone) {
      icon = 'done';
    } else if (isActive) {
      icon = 'active';
    } else {
      icon = 'pending';
    }

    return Image.asset('assets/icons/ic_line_$icon.png', height: 12);
  }

  // Line Vertical
  Widget lineVertical({required bool isDone, required bool isActive}) {
    return RotatedBox(
      quarterTurns: 1,
      child: lineGreen(
        isActive: isActive,
        isDone: isDone,
      ),
    );
  }

  // * MENU
  // menu kiri
  Widget leftMenu({String caracterImg = ''}) {
    return Container(
      margin: const EdgeInsets.only(right: 70),
      padding: const EdgeInsets.only(top: 20, right: 10),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconLogo(),
          caracter(caracter: caracterImg),
          buttonHelp(),
        ],
      ),
    );
  }

  // widget main menu
  Widget mainMenu() {
    return BlocBuilder<Cpmk1Bloc, Cpmk1State>(
      builder: (context, state) {
        return Expanded(
          flex: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'CPMK 1 : Pengertian Moral',
                  style: fontPlay.copyWith(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
                // Materi
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        level(
                          title: 'Materi',
                          isActive: state.indexTes == 0,
                          isDone: state.indexTes > 0,
                          onPressed: () => dialog(const CPMK1Materi()),
                        ),
                        lineGreen(
                          isActive: state.indexTes == 1,
                          isDone: state.indexTes > 1,
                        ),
                      ],
                    ),
                    // Soal 1
                    Row(
                      children: [
                        level(
                          title: 'Soal 1',
                          isActive: state.indexTes == 1,
                          isDone: state.indexTes > 1,
                          onPressed: () => dialog(const CPMK1Soal1()),
                        ),
                        lineGreen(
                          isActive: state.indexTes == 2,
                          isDone: state.indexTes > 2,
                        ),
                      ],
                    ),
                    // Soal 2
                    Column(
                      children: [
                        level(
                          title: 'Soal 2',
                          isActive: state.indexTes == 2,
                          isDone: state.indexTes > 2,
                          onPressed: () => dialog(const CPMK1Soal2()),
                        ),
                        lineVertical(
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
                    level(
                      title: 'Soal 5',
                      isActive: state.indexTes == 5,
                      isDone: state.indexTes > 5,
                      onPressed: () => dialog(const CPMK1Soal5()),
                    ),
                    lineGreen(
                      isActive: state.indexTes == 5,
                      isDone: state.indexTes > 5,
                    ),
                    level(
                      title: 'Soal 4',
                      isActive: state.indexTes == 4,
                      isDone: state.indexTes > 4,
                      onPressed: () => dialog(const CPMK1Soal4()),
                    ),
                    lineGreen(
                      isActive: state.indexTes == 4,
                      isDone: state.indexTes > 4,
                    ),
                    level(
                      title: 'Soal 3',
                      isActive: state.indexTes == 3,
                      isDone: state.indexTes > 3,
                      onPressed: () => dialog(const CPMK1Soal3()),
                    ),
                  ],
                ),
                point(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundGamepage,
            fit: BoxFit.fill,
          ),
        ),
        child: BlocBuilder<CpmkActiveBloc, CpmkActiveState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftMenu(caracterImg: state.caracter),
                mainMenu(),
              ],
            );
          },
        ),
      ),
    );
  }
}
