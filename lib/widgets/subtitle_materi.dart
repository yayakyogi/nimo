import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class SubtitleMateri extends StatelessWidget {
  const SubtitleMateri({Key? key, required this.subtitle}) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: Text(
        subtitle,
        style: fontPoppins.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}
