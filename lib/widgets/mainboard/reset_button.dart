import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, required this.onReset}) : super(key: key);

  final Function() onReset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 200,
                vertical: 120,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kamu yakin ingin mereset data jawaban ?',
                    style: fontPermanentMarker.copyWith(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonSubmit(
                        title: 'Tidak',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 20),
                      ButtonSubmit(title: 'Ya', onPressed: onReset),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: 95,
        height: 40,
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              color: whiteColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Reset',
              style: fontPlay.copyWith(color: whiteColor),
            )
          ],
        ),
      ),
    );
  }
}
