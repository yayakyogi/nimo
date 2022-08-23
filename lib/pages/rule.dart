import 'package:flutter/material.dart';
import 'package:nimo/pages/gamepage.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/button_back.dart';
import 'package:nimo/widgets/button_submit.dart';

class Rule extends StatefulWidget {
  const Rule({Key? key}) : super(key: key);

  @override
  State<Rule> createState() => _RuleState();
}

class _RuleState extends State<Rule> {
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
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(0.4),
      );
    }

    // widget title
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Text(
          'Aturan Permainan',
          style: fontPlay.copyWith(
            fontSize: 32,
            color: whiteColor,
            fontWeight: medium,
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
              rule: '1. Pilih karakter yang anda suka',
            ),
            ruleContent(
              rule: '2. Pilih soal yang disediakan',
            ),
            ruleContent(
              rule: '3. Jawab pertanyaan secara urut sesuai level',
            ),
            ruleContent(
              rule:
                  '4. Klik tombol "Simpan Jawaban" jika sudah selesai menjawab',
            ),
          ],
        ),
      );
    }

    // widget button submit
    Widget buttonSubmit() {
      return ButtonSubmit(
        onPressed: () => Navigator.push(
          context,
          PageTransition(widget: const Gamepage()),
        ),
        title: 'Mulai',
      );
    }

    // widget body
    Widget body() {
      return Column(
        children: [
          const ButtonBack(),
          title(),
          rule(),
          buttonSubmit(),
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
        child: Stack(
          children: [
            bgOpacity(),
            body(),
          ],
        ),
      ),
    );
  }
}