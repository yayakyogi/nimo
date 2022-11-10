import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class TitleBoard extends StatelessWidget {
  const TitleBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'CPMK 1 : Pengertian Moral',
        style: fontPlay.copyWith(
          fontSize: 20,
          color: primaryColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
