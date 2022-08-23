import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // icon logo
  Widget iconLogo() {
    return Image.asset('assets/icons/ic_logo.png', width: 100);
  }

  // widget karakter
  Widget caracter() {
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
          child: Image.asset('assets/images/caracter_1.png'),
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
  Widget level({required int level, required bool isActive}) {
    return GestureDetector(
      onTap: !isActive
          ? null
          : () {
              print('buka soal');
            },
      child: Container(
        width: 85,
        height: 42,
        decoration: BoxDecoration(
          color: isActive ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: whiteColor),
        ),
        child: Center(
          child: Text(
            'Level $level',
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
    return Image.asset('assets/icons/ic_line.png', height: 12);
  }

  // * MENU
  // menu kiri
  Widget leftMenu() {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconLogo(),
          caracter(),
          buttonHelp(),
        ],
      ),
    );
  }

  // widget right menu
  Widget rightMenu() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
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
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                children: [
                  level(level: 1, isActive: true),
                  lineGreen(),
                  level(level: 2, isActive: false),
                ],
              )
            ],
          )),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftMenu(),
            mainMenu(),
            rightMenu(),
          ],
        ),
      ),
    );
  }
}
