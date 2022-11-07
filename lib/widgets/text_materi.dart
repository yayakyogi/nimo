import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class TextMateri extends StatelessWidget {
  const TextMateri({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: fontPlay.copyWith(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
