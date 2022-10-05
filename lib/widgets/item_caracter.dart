import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ItemCaracter extends StatelessWidget {
  const ItemCaracter({
    Key? key,
    required this.title,
    required this.image,
    required this.isActive,
    required this.isCompleted,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String image;
  final bool isActive;
  final bool isCompleted;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: isActive ? onPressed : null,
          child: Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: isActive ? primaryColor : blackColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(45),
              border: Border.all(color: whiteColor),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/$image',
                width: 40,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: fontPlay.copyWith(
              fontSize: 16,
              color: whiteColor,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
