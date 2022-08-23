import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: whiteColor),
        ),
      ),
      child: Text(
        title,
        style: fontPermanentMarker.copyWith(
          fontSize: 18,
          color: whiteColor,
        ),
      ),
    );
  }
}