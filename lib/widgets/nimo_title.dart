import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class NimoTitle extends StatelessWidget {
  const NimoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        'NiMo',
        style: fontPermanentMarker.copyWith(
          fontSize: 70,
          color: primaryColor,
        ),
      ),
    );
  }
}
