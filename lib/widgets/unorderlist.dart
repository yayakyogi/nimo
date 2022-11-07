import 'package:flutter/material.dart';
import 'package:nimo/widgets/text_materi.dart';

class UnorderedListItem extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UnorderedListItem({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("• "),
          Expanded(
            child: TextMateri(text: text),
          ),
        ],
      ),
    );
  }
}
