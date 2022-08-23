import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ItemCaracter extends StatelessWidget {
  const ItemCaracter({
    Key? key,
    required this.title,
    required this.image,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String image;
  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: isActive ? 100 : 90,
            height: isActive ? 100 : 90,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: isActive ? primaryColor : blackColor,
              borderRadius: BorderRadius.circular(isActive ? 50 : 45),
              border: Border.all(color: whiteColor),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/$image',
                width: isActive ? 50 : 40,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: fontPermanentMarker.copyWith(
            fontSize: 16,
            color: whiteColor,
          ),
        )
      ],
    );
  }
}
