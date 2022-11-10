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
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 150,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                emoticon,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(
                report,
                style: fontPoppins.copyWith(
                  fontSize: 20,
                  color: whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ButtonSubmit(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'Tutup',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
