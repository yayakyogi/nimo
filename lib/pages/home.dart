import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimo/pages/login.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/nimo_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String audioAsset = 'assets/musics/Mr_Smith-Sonorus.mp3';
  bool isPlaying = false;
  bool audioPlayed = false;
  late Uint8List audioBytes;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    // Future.delayed(Duration.zero, () async {
    //   // ambil data audio dari assets
    //   ByteData bytes = await rootBundle.load(audioAsset);
    //   // konvert ByteData ke Uin8List
    //   audioBytes = bytes.buffer.asUint8List(
    //     bytes.offsetInBytes,
    //     bytes.lengthInBytes,
    //   );
    //   // putar music
    //   await audioPlayer.playBytes(audioBytes);
    // });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    ); // to re-show bars
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget subTitle
    Widget subTitle() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5),
          border: Border.all(width: 0.6, color: whiteColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Nilai & Moral',
          style: fontPermanentMarker.copyWith(
            fontSize: 20,
            color: whiteColor,
            fontWeight: medium,
          ),
        ),
      );
    }

    // widget button
    Widget button() {
      return ButtonSubmit(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageTransition(widget: const Login()),
          );
        },
        title: 'Login',
      );
    }

    Widget logo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo-kemendikbud.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 5),
          Image.asset(
            'assets/images/logo-ubhi.png',
            width: 40,
            height: 40,
          ),
        ],
      );
    }

    Widget copyright() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.6),
          border: Border.all(width: 1, color: whiteColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Powered By\nUnit Layanan Disabilitas - Universitas Bhinneka PGRI',
          style: fontPlay.copyWith(
            fontSize: 10,
            fontWeight: semibold,
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    // widget utama
    Widget body() {
      return ListView(
        children: [
          const SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subTitle(),
              const SizedBox(height: 10),
              const NimoTitle(),
              button(),
              logo(),
              copyright(),
            ],
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      ),
    );
  }
}
