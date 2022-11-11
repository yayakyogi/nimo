import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';

Future<bool> onBackPressed({required BuildContext context}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          backgroundColor: primaryColor,
          title: Icon(
            Icons.warning,
            color: whiteColor,
            size: 50,
          ),
          content: SizedBox(
            width: 100,
            child: Text(
              'Kamu yakin ingin keluar dari game?',
              style: fontPermanentMarker.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSubmit(
                  onPressed: () => SystemNavigator.pop(),
                  title: 'Keluar',
                  isButtonClose: true,
                ),
                const SizedBox(width: 10),
                ButtonSubmit(
                  onPressed: () => Navigator.pop(context),
                  title: 'Batal',
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
