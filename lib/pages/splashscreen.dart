import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nimo/pages/home.dart';
import 'package:nimo/themes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NiMo',
              style: fontPermanentMarker.copyWith(
                fontSize: 64,
                color: whiteColor,
              ),
            ),
            Text(
              'Nilai & Moral',
              style: fontPermanentMarker.copyWith(
                fontSize: 30,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
