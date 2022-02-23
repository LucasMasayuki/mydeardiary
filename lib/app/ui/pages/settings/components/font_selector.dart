import 'package:flutter/material.dart';

class FontSelector extends StatelessWidget {
  final Function onClickFont;

  const FontSelector({
    Key? key,
    required this.onClickFont,
  }) : super(key: key);

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
              children: [
                ListTile(
                  title: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'indieflower'),
                  ),
                  onTap: () => onClickFont('indieflower'),
                ),
                ListTile(
                  title: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'festive'),
                  ),
                  onTap: () => onClickFont('festive'),
                ),
                ListTile(
                  title: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'birthstone'),
                  ),
                  onTap: () => onClickFont('birthstone'),
                ),
                ListTile(
                  title: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'ephesis'),
                  ),
                  onTap: () => onClickFont('ephesis'),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.font_download),
    );
  }
}
