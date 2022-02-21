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
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'indieflower'),
                  ),
                  onTap: () => this.onClickFont('indieflower'),
                ),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'festive'),
                  ),
                  onTap: () => this.onClickFont('festive'),
                ),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'birthstone'),
                  ),
                  onTap: () => this.onClickFont('birthstone'),
                ),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(fontFamily: 'ephesis'),
                  ),
                  onTap: () => this.onClickFont('ephesis'),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.font_download),
    );
  }
}
