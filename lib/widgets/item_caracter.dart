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
          onTap: isActive
              ? onPressed
              : () {
                  print('CPMK DONE');
                },
          child: Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: Image.asset(
                'assets/images/$image',
                width: 80,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: fontPermanentMarker.copyWith(
              fontSize: 14,
              color: whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
