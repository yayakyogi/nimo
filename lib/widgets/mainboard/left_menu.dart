import 'package:flutter/material.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/pages/choose_caracter.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_back.dart';
import 'package:nimo/widgets/mainboard/reset_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key? key,
    required this.title,
    required this.caracter,
  }) : super(key: key);

  final String title;
  final String caracter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      padding: const EdgeInsets.all(10),
      width: 120,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: const ButtonBack(widget: ChooseCaracter()),
          ),
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(top: 80, bottom: 10),
            child: Image.asset(caracter),
          ),
          const SizedBox(height: 40),
          Image.asset('assets/icons/ic_logo.png', width: 100),
          const SizedBox(height: 10),
          ResetButton(
            onReset: () {
              context.read<CpmkBloc>().add(CpmkAction(
                    scoreSoal: 0,
                    indexTes: 0,
                  ));
              context.read<SetAnswerBloc>().add(SetAnswerEvent(
                    indexAnswer: 0,
                    score: 0,
                  ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
