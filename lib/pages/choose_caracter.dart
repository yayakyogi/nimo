import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_board.dart';
import 'package:nimo/pages/rule.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_back.dart';
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
              child: const ButtonBack(widget: Rule()),
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
          child: BlocBuilder<CpmkActiveBloc, CpmkActiveState>(
            builder: (context, state) {
              log(state.activeCPMK.toString());
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemCaracter(
                    image: 'caracter_1.gif',
                    title: 'Pengertian Moral',
                    isActive: state.activeCPMK == 1,
                    isCompleted: state.activeCPMK == 1,
                    onPressed: () {
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpkmActive: 1,
                            caracter: 'caracter_1.gif',
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK1Board()),
                      );
                    },
                  ),
                  ItemCaracter(
                    image: 'caracter_2.gif',
                    title: 'Keterkaitan Nilai, Moral & Karakter',
                    isActive: state.activeCPMK == 2,
                    isCompleted: state.activeCPMK >= 2,
                    onPressed: () {},
                  ),
                  ItemCaracter(
                    image: 'caracter_3.gif',
                    title: 'Kawasan Moral',
                    isActive: state.activeCPMK == 3,
                    isCompleted: state.activeCPMK >= 3,
                    onPressed: () {},
                  ),
                  ItemCaracter(
                    image: 'caracter_4.gif',
                    title: 'Filsafat Nilai & Moral',
                    isActive: state.activeCPMK == 4,
                    isCompleted: state.activeCPMK >= 4,
                    onPressed: () {},
                  ),
                  ItemCaracter(
                    image: 'caracter_1.gif',
                    title: 'Pendidikan Nilai di Sekolah',
                    isActive: state.activeCPMK == 5,
                    isCompleted: state.activeCPMK >= 5,
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ),
      );
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
