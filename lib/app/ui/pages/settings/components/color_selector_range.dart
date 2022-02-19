import 'package:flutter/material.dart';

class ColorSelectorRange extends StatelessWidget {
  final Function onClickColor;

  ColorSelectorRange({
    required this.onClickColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 55) / 10;
    final height = 30.0;
    return Row(
      children: [
        Container(
          color: Colors.white,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.red,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.pink,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.orange,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.yellow,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.green,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.purple,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.blue,
          height: height,
          width: width,
        ),
        Container(
          color: Colors.black,
          height: height,
          width: width,
        )
      ],
    );
  }
}
