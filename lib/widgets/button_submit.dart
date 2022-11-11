import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isButtonClose = false,
  }) : super(key: key);

  final Function() onPressed;
  final String title;
  final bool isButtonClose;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: isButtonClose ? whiteColor : primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isButtonClose ? primaryColor : whiteColor),
        ),
      ),
      child: Text(
        title,
        style: fontPermanentMarker.copyWith(
          color: isButtonClose ? primaryColor : whiteColor,
        ),
      ),
    );
  }
}
