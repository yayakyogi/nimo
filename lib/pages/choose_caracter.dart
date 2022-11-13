import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/pages/cpmk_1/cpmk1_board.dart';
import 'package:nimo/pages/cpmk_2/cpmk2_board.dart';
import 'package:nimo/pages/cpmk_3/cpmk3_board.dart';
import 'package:nimo/pages/cpmk_4/cpmk4_board.dart';
import 'package:nimo/pages/cpmk_5/cpmk5_board.dart';
import 'package:nimo/pages/rule.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_willpopup.dart';
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
                    fontSize: 24,
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Pilih karakter dan mulai permainan',
                  style: fontPlay.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
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
                    title: '1. Pengertian Moral',
                    isActive: state.activeCPMK == 1,
                    isCompleted: state.activeCPMK > 1,
                    onPressed: () {
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: 1,
                            caracter: 'caracter_1.gif',
                            scoreGlobal: state.scoreGlobal,
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK1Board()),
                      );
                    },
                  ),
                  ItemCaracter(
                    image: 'caracter_2.gif',
                    title: '2. Keterkaitan Nilai, Moral & Karakter',
                    isActive: state.activeCPMK == 2,
                    isCompleted: state.activeCPMK > 2,
                    onPressed: () {
                      log('score global after CPMK 1 ${state.scoreGlobal}');
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: 2,
                            caracter: 'caracter_2.gif',
                            scoreGlobal: state.scoreGlobal,
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK2Board()),
                      );
                    },
                  ),
                  ItemCaracter(
                    image: 'caracter_3.gif',
                    title: '3. Kawasan Moral',
                    isActive: state.activeCPMK == 3,
                    isCompleted: state.activeCPMK > 3,
                    onPressed: () {
                      log('score global after CPMK 2 ${state.scoreGlobal}');
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: 3,
                            caracter: 'caracter_3.gif',
                            scoreGlobal: state.scoreGlobal,
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK3Board()),
                      );
                    },
                  ),
                  ItemCaracter(
                    image: 'caracter_4.gif',
                    title: '4. Filsafat Nilai & Moral',
                    isActive: state.activeCPMK == 4,
                    isCompleted: state.activeCPMK > 4,
                    onPressed: () {
                      log('score global after CPMK 3 ${state.scoreGlobal}');
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: 4,
                            caracter: 'caracter_4.gif',
                            scoreGlobal: state.scoreGlobal,
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK4Board()),
                      );
                    },
                  ),
                  ItemCaracter(
                    image: 'caracter_5.gif',
                    title: '5. Pendidikan Nilai di Sekolah',
                    isActive: state.activeCPMK == 5,
                    isCompleted: state.activeCPMK > 5,
                    onPressed: () {
                      log('score global after CPMK 4 ${state.scoreGlobal}');
                      context.read<CpmkActiveBloc>().add(CpmkActive(
                            cpmkActive: 5,
                            caracter: 'caracter_5.gif',
                            scoreGlobal: state.scoreGlobal,
                          ));
                      Navigator.push(
                        context,
                        PageTransition(widget: const CPMK5Board()),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () => onBackPressed(context: context),
      child: Scaffold(
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
      ),
    );
  }
}
