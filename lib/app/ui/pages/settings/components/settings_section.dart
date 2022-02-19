import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/color_selector.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/font_selector.dart';
import 'package:mydeardiary/app/ui/pages/settings/components/preview_diary.dart';

import 'color_selector_range.dart';

class SettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cor da página',
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            ColorSelectorRange(onClickColor: () => {}),
            ColorSelector(
                pickerColor: Colors.black, onColorChanged: (color) => {}),
          ],
        ),
        Text(
          'Cor do texto',
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            ColorSelectorRange(onClickColor: () => {}),
            ColorSelector(
                pickerColor: Colors.black, onColorChanged: (color) => {}),
          ],
        ),
        Row(
          children: [
            Text(
              'Estilo da texto: ',
              style: TextStyle(color: Colors.white),
            ),
            FontSelector(onClickFont: () => {}),
          ],
        ),
        Row(
          children: [
            Text(
              'Tamanho do texto: ',
              style: TextStyle(color: Colors.white),
            ),
            Slider(value: 0, onChanged: (double size) => {}),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        PreviewDiary(
          fontSize: 14,
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 1,
        ),
      ],
    );
  }
}
