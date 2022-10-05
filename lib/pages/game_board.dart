import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/test.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/item_soal.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  Test test = Test();

  int levelActive = 0;

  Future dialog() {
    log('test ' + test.toString());
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Soal 1',
                  style: fontPlay.copyWith(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Apa itu moral?',
                  style: fontPlay.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ItemSoal(
                  soal: '1 Apa itu moral',
                  isChoosen: true,
                  onPressed: () {},
                ),
                ItemSoal(
                  soal: '2 Apa itu moral',
                  isChoosen: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ButtonSubmit(
                onPressed: () {
                  setState(() {
                    levelActive++;
                  });
                  Navigator.pop(context);
                },
                title: 'Simpan Jawaban',
              ),
            ),
          ],
        );
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
          'Caracter 1',
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
    return Container(
      width: 80,
      height: 40,
      margin: const EdgeInsets.only(top: 20, right: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: whiteColor),
      ),
      child: Center(
        child: Text(
          'Point 0',
          style: fontPlay.copyWith(
            fontSize: 16,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  // widget level
  Widget level({
    required String title,
    required bool isActive,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: !isActive ? null : onPressed,
      child: Container(
        width: 200,
        height: 42,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: whiteColor),
        ),
        child: Center(
          child: Text(
            title,
            style: fontPermanentMarker.copyWith(
              fontSize: 16,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  // widget line
  Widget lineGreen() {
    return Image.asset('assets/icons/ic_line.png', height: 12, width: 50);
  }

  // * MENU
  // menu kiri
  Widget leftMenu({String caracterImg = ''}) {
    return Container(
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

  // widget right menu
  Widget rightMenu() {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: 120,
      child: point(),
    );
  }

  // widget main menu
  Widget mainMenu() {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            level(
              title: 'Materi',
              isActive: levelActive == 0,
              onPressed: () {
                dialog();
              },
            ),
            level(
              title: 'Soal 1',
              isActive: levelActive == 1,
              onPressed: () {
                dialog();
              },
            ),
            level(
              title: 'Soal 2',
              isActive: levelActive == 2,
              onPressed: () {
                dialog();
              },
            ),
            level(
              title: 'Soal 3',
              isActive: levelActive == 3,
              onPressed: () {
                dialog();
              },
            ),
            level(
              title: 'Soal 4',
              isActive: levelActive == 4,
              onPressed: () {
                dialog();
              },
            ),
            level(
              title: 'Soal 5',
              isActive: levelActive == 5,
              onPressed: () {
                dialog();
              },
            ),
          ],
        ),
      ),
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
                rightMenu(),
              ],
            );
          },
        ),
      ),
    );
  }
}
