import 'package:flutter/material.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class LinesOfDiary extends StatelessWidget {
  final double _kHeight = 2.0;
  final String text;
  final double fontSize;
  final String fontFamily;
  final String fontColor;

  const LinesOfDiary({
    Key? key,
    required this.text,
    required this.fontFamily,
    required this.fontColor,
    this.fontSize = 32.0,
  }) : super(key: key);

  Widget _buildLines(double initialHeight) {
    var height = fontSize * _kHeight;

    int numberOfLinesThatNeedToBeBuilt = initialHeight ~/ height;

    // Draw the lines (which are just containers with a bottom border)
    return Column(
      children: List.generate(
        numberOfLinesThatNeedToBeBuilt,
        (index) => Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          height: height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = fontSize * _kHeight;
    var initialHeight = height * 30;

    return Column(
      children: [
        Stack(
          children: [
            // Add before TextField so it appears under it
            _buildLines(initialHeight),
            TextFormField(
              initialValue: text,
              maxLines: null,
              decoration: _inputDecoration(),
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                color: createColorFromHex(fontColor),
                fontFamily: fontFamily,
                fontSize: fontSize,
                height: _kHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Flatten out and "plainify" the TextField so it doesn't have any
  // unwanted dimensions.

  InputDecoration _inputDecoration() {
    return const InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
    );
  }
}
