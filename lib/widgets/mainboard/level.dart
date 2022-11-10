import 'package:flutter/material.dart';
import 'package:nimo/widgets/lottie_animation.dart';

class Level extends StatelessWidget {
  const Level({
    Key? key,
    required this.isActive,
    required this.isDone,
    required this.onPressed,
  }) : super(key: key);

  final bool isActive;
  final bool isDone;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isActive ? null : onPressed,
      child: Center(
        child: isDone
            ? const LottieAnimation(
                lottieFile: 'done',
                width: 80,
              )
            : isActive
                ? Image.asset(
                    'assets/images/materi.gif',
                    width: 80,
                  )
                : const LottieAnimation(
                    lottieFile: 'pending',
                    width: 70,
                  ),
      ),
    );
  }
}
