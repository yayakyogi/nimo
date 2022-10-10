import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        ),
        child: Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
