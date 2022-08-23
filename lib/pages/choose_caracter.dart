import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_back.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/item_caracter.dart';

class ChooseCaracter extends StatefulWidget {
  const ChooseCaracter({Key? key}) : super(key: key);

  @override
  State<ChooseCaracter> createState() => _ChooseCaracterState();
}

class _ChooseCaracterState extends State<ChooseCaracter> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // background transaparent
    Widget backgroundTransparent() {
      return const BackgroundTransparent();
    }

    // header page
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.only(left: 30),
              child: const ButtonBack(),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Pilih Karakter',
                  style: fontPlay.copyWith(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Silahkan pilih karakter yang anda suka \nsebelum mencoba permainan',
                  style: fontPlay.copyWith(color: whiteColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Container(
              width: 100,
              margin: const EdgeInsets.only(right: 25),
              child: Image.asset('assets/icons/ic_logo.png'),
            )
          ],
        ),
      );
    }

    // widget choose caracter
    Widget chooseCaracter() {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          margin: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemCaracter(
                image: 'caracter_1.png',
                title: 'Caracter 1',
                isActive: index == 1,
                onPressed: () => setState(() => index = 1),
              ),
              ItemCaracter(
                image: 'caracter_2.png',
                title: 'Caracter 2',
                isActive: index == 2,
                onPressed: () => setState(() => index = 2),
              ),
              ItemCaracter(
                image: 'caracter_3.png',
                title: 'Caracter 3',
                isActive: index == 3,
                onPressed: () => setState(() => index = 3),
              ),
              ItemCaracter(
                image: 'caracter_4.png',
                title: 'Caracter 4',
                isActive: index == 4,
                onPressed: () => setState(() => index = 4),
              ),
            ],
          ),
        ),
      );
    }

    // widget button selanjutnya
    Widget buttonNext() {
      return ButtonSubmit(onPressed: () {}, title: 'Selanjutnya');
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            backgroundTransparent(),
            Column(
              children: [
                header(),
                chooseCaracter(),
                buttonNext(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
