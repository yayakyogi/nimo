import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';

class ResultAnswer extends StatelessWidget {
  const ResultAnswer({
    Key? key,
    required this.emoticon,
    required this.report,
  }) : super(key: key);

  final String emoticon;
  final String report;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 220,
        vertical: 70,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              emoticon,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            report,
            style: fontPoppins.copyWith(
              fontSize: 18,
              color: whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          ButtonSubmit(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Tutup',
          ),
        ],
      ),
    );
  }
}
