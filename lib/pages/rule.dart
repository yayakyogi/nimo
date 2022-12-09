import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimo/pages/choose_caracter.dart';
import 'package:nimo/pages/provision.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_willpopup.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_submit.dart';

class Rule extends StatefulWidget {
  const Rule({Key? key}) : super(key: key);

  @override
  State<Rule> createState() => _RuleState();
}

class _RuleState extends State<Rule> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // text rule
    Widget ruleContent({required String rule}) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 5),
        child: Text(
          rule,
          style: fontPlay.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );
    }

    // widget bg black opacity
    Widget bgOpacity() {
      return const BackgroundTransparent();
    }

    // widget title
    Widget title() {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 25, top: 20),
          child: Text(
            'Aturan Permainan',
            style: fontPlay.copyWith(
              fontSize: 32,
              color: whiteColor,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    // widget rule
    Widget rule() {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 120, left: 120, bottom: 30),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor),
        ),
        child: Column(
          children: [
            ruleContent(
              rule: '1. Tekan Menu "Ketentuan"',
            ),
            ruleContent(
              rule: '2. Tekan Menu "Mulai"',
            ),
            ruleContent(
              rule: '3.	Tekan Menu “Karakter NiMo” Paling Kiri',
            ),
            ruleContent(
              rule:
                  '4.	Tekan Ikon “Peti” Awal untuk Materi & Video Pembelajaran',
            ),
            ruleContent(
              rule:
                  '5.	Tekan Ikon “Peti” Selanjutnya Masuk “Soal Pertanyaan” Secara Urut Sesuai Level',
            ),
            ruleContent(
              rule: '6.	Teka Menu “Simpan Jawaban” ',
            ),
            ruleContent(
              rule: '7.	Dapatkan Skor Per-Level',
            ),
            ruleContent(
              rule: '8.	Resume Skor Akhir Keseluruhan',
            ),
          ],
        ),
      );
    }

    // widget button submit
    Widget buttonSubmit() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonSubmit(
            onPressed: () => Navigator.push(
              context,
              PageTransition(widget: const ChooseCaracter()),
            ),
            title: 'Mulai',
          ),
          const SizedBox(width: 20),
          ButtonSubmit(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Provision()),
            ),
            title: 'Ketentuan',
          ),
        ],
      );
    }

    // widget body
    Widget body() {
      return ListView(
        children: [
          title(),
          rule(),
          buttonSubmit(),
          const SizedBox(height: 25),
        ],
      );
    }

    return WillPopScope(
      onWillPop: () => onBackPressed(context: context),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              bgOpacity(),
              body(),
            ],
          ),
        ),
      ),
    );
  }
}
