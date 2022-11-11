import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_active/cpmk_active_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_willpopup.dart';
import 'package:nimo/widgets/mainboard/left_menu.dart';

class Mainboard extends StatelessWidget {
  const Mainboard({
    Key? key,
    required this.title,
    required this.menu,
  }) : super(key: key);

  final String title;
  final Widget menu;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context: context),
      child: Scaffold(
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
                  LeftMenu(
                    title: title,
                    caracter: 'assets/images/${state.caracter}',
                  ),
                  menu,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
