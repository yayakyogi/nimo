import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ItemSoal extends StatelessWidget {
  const ItemSoal({
    Key? key,
    required this.soal,
    required this.onPressed,
    required this.isChoosen,
  }) : super(key: key);

  final String soal;
  final Function() onPressed;
  final bool isChoosen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: isChoosen ? primaryColor.withOpacity(0.5) : whiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: whiteColor),
        ),
        child: Text(
          soal,
          style: fontPlay.copyWith(
            fontSize: 12,
            color: isChoosen ? whiteColor : blackColor,
          ),
        ),
      ),
    );
  }
}
