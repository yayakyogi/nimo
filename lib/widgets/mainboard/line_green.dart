import 'package:flutter/material.dart';

class LineGreen extends StatelessWidget {
  const LineGreen({
    Key? key,
    required this.isActive,
    required this.isDone,
  }) : super(key: key);

  final bool isDone;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    String icon;

    if (isDone) {
      icon = 'done';
    } else if (isActive) {
      icon = 'active';
    } else {
      icon = 'pending';
    }

    return Image.asset('assets/icons/ic_line_$icon.png', height: 12);
  }
}
