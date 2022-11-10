import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class TextMateri extends StatelessWidget {
  const TextMateri({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              text,
              style: fontPermanentMarker.copyWith(
                fontSize: 16,
                color: primaryColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
