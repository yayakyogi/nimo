import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nimo/themes.dart';

class TimeCountdown extends StatelessWidget {
  const TimeCountdown({
    Key? key,
    required this.color,
    required this.onEnd,
  }) : super(key: key);

  final Function() onEnd;
  final Color color;

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;

    return CountdownTimer(
      endTime: endTime,
      onEnd: onEnd,
      textStyle: fontPermanentMarker.copyWith(
        fontSize: 16,
        color: color,
      ),
    );
  }
}
