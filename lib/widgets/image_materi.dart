import 'package:flutter/material.dart';

class ImageMateri extends StatelessWidget {
  const ImageMateri({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
