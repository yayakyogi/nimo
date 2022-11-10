import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';

PreferredSizeWidget appBar({
  required String title,
  required Function() onVideoOpen,
}) {
  return AppBar(
    title: Text('Materi - $title'),
    backgroundColor: primaryColor,
    elevation: 0,
    actions: <Widget>[
      GestureDetector(
        onTap: () => onVideoOpen,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(right: 30, top: 8),
          child: Text(
            'Lihat Video',
            style: fontPermanentMarker.copyWith(
              fontSize: 16,
              color: whiteColor,
            ),
          ),
        ),
      )
    ],
  );
}
