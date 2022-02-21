import 'package:flutter/material.dart';

class ColorSelectorRange extends StatelessWidget {
  final Function onClickColor;

  ColorSelectorRange({
    required this.onClickColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 55 - (2 * 10)) / 10;
    final height = 30.0;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.white);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.white,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.red);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.red,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.pink);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.pink,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.purple);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.purple,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.blue);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.blue,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.green);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.green,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.yellow);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.yellow,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.orange);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.orange,
            ),
            height: height,
            width: width,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClickColor(Colors.black);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.black,
            ),
            height: height,
            width: width,
          ),
        ),
      ],
    );
  }
}
