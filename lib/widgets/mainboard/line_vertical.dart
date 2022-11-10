import 'package:flutter/material.dart';
import 'package:nimo/widgets/mainboard/line_green.dart';

class LineVertical extends StatelessWidget {
  const LineVertical({
    Key? key,
    required this.isActive,
    required this.isDone,
  }) : super(key: key);

  final bool isDone;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: LineGreen(isActive: isActive, isDone: isDone),
    );
  }
}
