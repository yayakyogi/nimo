import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class SkorButton extends StatelessWidget {
  const SkorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      margin: const EdgeInsets.only(top: 40, right: 200, bottom: 20),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: whiteColor),
      ),
      child: Center(
        child: Text(
          'Lihat Skor',
          style: fontPlay.copyWith(
            fontSize: 20,
            color: whiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
