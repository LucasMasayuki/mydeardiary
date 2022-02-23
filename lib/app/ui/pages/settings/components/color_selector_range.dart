import 'package:flutter/material.dart';

class ColorSelectorRange extends StatelessWidget {
  final Function onClickColor;

  const ColorSelectorRange({
    Key? key,
    required this.onClickColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 55 - (2 * 10)) / 10;
    const height = 30.0;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onClickColor(Colors.white);
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
            onClickColor(Colors.red);
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
            onClickColor(Colors.pink);
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
            onClickColor(Colors.purple);
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
            onClickColor(Colors.blue);
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
            onClickColor(Colors.green);
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
            onClickColor(Colors.yellow);
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
            onClickColor(Colors.orange);
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
            onClickColor(Colors.black);
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
