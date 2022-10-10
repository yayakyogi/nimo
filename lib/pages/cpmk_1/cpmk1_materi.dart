import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';

class CPMK1Materi extends StatefulWidget {
  const CPMK1Materi({Key? key}) : super(key: key);

  @override
  State<CPMK1Materi> createState() => _CPMK1MateriState();
}

class _CPMK1MateriState extends State<CPMK1Materi> {
  Future watchVideo() {
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black26,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              margin: const EdgeInsets.symmetric(vertical: 23),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Video Penjelasan CPMK 1 - Pengeritan Moral',
                    style: fontPoppins.copyWith(
                      fontSize: 18,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 250,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Tutup',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              'Materi',
              style: fontPlay.copyWith(
                fontSize: 20,
                color: whiteColor,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              child: Text(
                'Moral adalah  (ajaran tentang) baik buruk yang diterima umum mengenai perbuatan, sikap, kewajiban, dan sebagainya .[1] Moral merupakan standar perilaku yang memungkinkan setiap orang untuk dapat hidup secara kooperatif dalam suatu kelompok. Moral dapat mengacu pada sanksi-sanksi masyarakat terkait perilaku yang benar dan dapat diterima.',
                style: fontPlay.copyWith(
                  fontSize: 16,
                  color: primaryColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSubmit(
              title: 'Mengerti',
              onPressed: () {
                Navigator.pop(context);
                context
                    .read<Cpmk1Bloc>()
                    .add(Cpmk1Action(scoreSoal: 0, indexTes: 1));
              },
            ),
            const SizedBox(width: 20),
            ButtonSubmit(
              onPressed: () => watchVideo(),
              title: 'Lihat Video',
            ),
          ],
        ),
      ],
    );
  }
}
