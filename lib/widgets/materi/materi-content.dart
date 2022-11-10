import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/countdown.dart';

class MateriContent extends StatelessWidget {
  const MateriContent({
    Key? key,
    required this.totalPage,
    required this.onEnd,
    required this.onFinish,
    required this.onSkip,
    required this.background,
    required this.pageBodies,
  }) : super(key: key);

  final int totalPage;
  final List<Widget> pageBodies;
  final List<Widget> background;
  final Function() onEnd;
  final Function() onFinish;
  final Function() onSkip;

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      onFinish: onEnd,
      skipFunctionOverride: onEnd,
      totalPage: totalPage,
      headerBackgroundColor: Colors.transparent,
      pageBodies: pageBodies,
      background: background,
      finishButtonColor: primaryColor,
      finishButtonText: 'Mengerti',
      speed: 1.8,
      skipTextButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeCountdown(
            color: primaryColor,
            onEnd: onEnd,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '/',
              style: fontPermanentMarker.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          Text(
            'Skip',
            style: fontPermanentMarker.copyWith(
              fontSize: 16,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
