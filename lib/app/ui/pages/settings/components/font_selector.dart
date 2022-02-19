import 'package:flutter/material.dart';

class FontSelector extends StatelessWidget {
  final Function onClickFont;

  FontSelector({
    required this.onClickFont,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              children: [ListTile(leading: Text('test'), title: Text('test'))],
            );
          },
        );
      },
      icon: Icon(Icons.font_download),
    );
  }
}
