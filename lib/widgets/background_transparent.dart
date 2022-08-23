import 'package:flutter/material.dart';

class BackgroundTransparent extends StatelessWidget {
  const BackgroundTransparent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black45,
    );
  }
}
