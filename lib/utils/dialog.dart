import 'package:flutter/material.dart';
import 'package:nimo/widgets/soal/result.dart';

Future dialogResult({required BuildContext context, required int scoreAnswer}) {
  var report = '';
  var emoticon = '';

  switch (scoreAnswer) {
    case 1:
      report = 'Jawaban hampir tepat, coba lebih baik lagi ya..';
      emoticon = 'assets/images/emoticon_sad.gif';
      break;
    case 2:
      report = 'Coba lebih baik lagi. Tetap semangat!';
      emoticon = 'assets/images/emoticon_keep_spirit.gif';
      break;
    case 3:
      report = 'Jawaban sudah baik, pertahankan ya..';
      emoticon = 'assets/images/emoticon_good.gif';
      break;
    case 4:
      report = 'Jawaban yang bagus, lanjutkan!';
      emoticon = 'assets/images/emoticon_very_good.gif';
      break;
    default:
      report = 'Waktu habis, coba lebih baik lagi ya..';
      emoticon = 'assets/images/emoticon_sad.gif';
  }

  return showDialog(
    context: context,
    builder: (context) => ResultAnswer(
      emoticon: emoticon,
      report: report,
    ),
  );
}
