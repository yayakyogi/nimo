import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class ProvotionContent extends StatelessWidget {
  const ProvotionContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: whiteColor,
      child: ListView(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: semibold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/ketentuan/$image',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
