import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool soundEffectOn = true;
  bool musicOn = true;
  double marginContent = 70;

  @override
  Widget build(BuildContext context) {
    double widthContent = MediaQuery.of(context).size.width;

    Widget rowMenuText({required String label, required String value}) {
      return Container(
        width: widthContent - 300,
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fontPlay.copyWith(
                fontSize: 16,
                color: Colors.white60,
                fontWeight: semibold,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: fontPlay.copyWith(
                fontSize: 16,
                color: Colors.white60,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      );
    }

    Widget rowMenuButton({
      required Function() onPressed,
      required String label,
      required IconData icon,
    }) {
      return Container(
        width: widthContent - 300,
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fontPlay.copyWith(
                fontSize: 16,
                color: Colors.white60,
                fontWeight: semibold,
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Icon(icon, color: Colors.white),
            )
          ],
        ),
      );
    }

    return Scaffold(
      primary: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_homepage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(top: 35, left: 25),
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                'Pengaturan',
                style: fontPermanentMarker.copyWith(
                  fontSize: 32,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 25),
            rowMenuText(label: 'Nama Pengguna', value: 'Lorem Ipsum'),
            rowMenuButton(
              label: 'Suara Efek',
              icon: soundEffectOn == true ? Icons.graphic_eq : Icons.music_off,
              onPressed: () {
                setState(() {
                  soundEffectOn = !soundEffectOn;
                });
              },
            ),
            rowMenuButton(
              label: 'Musik',
              icon: musicOn == true ? Icons.music_note : Icons.music_off,
              onPressed: () {
                setState(() {
                  musicOn = !musicOn;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: primaryColor),
              child: Text(
                'Edit Profil',
                style: fontPermanentMarker.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
