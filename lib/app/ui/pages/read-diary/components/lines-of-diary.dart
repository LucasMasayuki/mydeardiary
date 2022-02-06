import 'package:flutter/material.dart';

class LinesOfDiary extends StatelessWidget {
  final double _kHeight = 2.0;
  final String text;
  final double fontSize;

  LinesOfDiary({
    required this.text,
    this.fontSize = 32.0,
  });

  Widget _buildLines(double initialHeight) {
    var height = fontSize * _kHeight;

    int numberOfLinesThatNeedToBeBuilt = initialHeight ~/ height;

    // Draw the lines (which are just containers with a bottom border)
    return Column(
      children: List.generate(
        numberOfLinesThatNeedToBeBuilt,
        (index) => Container(
          decoration: BoxDecoration(
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
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: initialHeight,
              ),
              child: Container(
                // Listen for when the TextField's height changes
                child: TextFormField(
                  initialValue: text,
                  maxLines: null,
                  decoration: _inputDecoration(),
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: fontSize,
                    height: _kHeight,
                  ),
                ),
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
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
    );
  }
}
