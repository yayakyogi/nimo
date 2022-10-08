import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({Key? key, required this.lottieFile}) : super(key: key);
  final String lottieFile;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/lottie/lottie-$lottieFile.json",
      repeat: true,
      reverse: true,
      animate: true,
      width: 40,
      // height: 40,
    );
  }
}
