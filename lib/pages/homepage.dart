import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:nimo/pages/rule.dart';
import 'package:nimo/pages/setting.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/button_submit.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String audioAsset = 'assets/musics/Mr_Smith-Sonorus.mp3';
  bool isPlaying = false;
  bool audioPlayed = false;
  late Uint8List audioBytes;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      // ambil data audio dari assets
      ByteData bytes = await rootBundle.load(audioAsset);
      // konvert ByteData ke Uin8List
      audioBytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      );
      // putar music
      await audioPlayer.playBytes(audioBytes);
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    ); // to re-show bars
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget subTitle
    Widget subTitle() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Game Nilai Dan Moral',
          style: fontPermanentMarker.copyWith(
            fontSize: 20,
            color: primaryColor,
            fontWeight: medium,
          ),
        ),
      );
    }

    // widget title
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(
          'NIMO',
          style: fontPermanentMarker.copyWith(
            fontSize: 70,
            color: primaryColor,
          ),
        ),
      );
    }

    // widget button
    Widget button() {
      return ButtonSubmit(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(widget: const Rule()),
          );
        },
        title: 'Mulai',
      );
    }

    // widget utama
    Widget body() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          subTitle(),
          title(),
          button(),
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
