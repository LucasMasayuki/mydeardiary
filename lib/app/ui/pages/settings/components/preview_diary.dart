import 'package:flutter/material.dart';

class PreviewDiary extends StatelessWidget {
  final double _kHeight = 2.0;
  final String text;
  final double fontSize;
  final double height;
  final double width;

  PreviewDiary({
    required this.text,
    required this.height,
    required this.width,
    this.fontSize = 32.0,
  });

  Widget _buildLines() {
    var height = fontSize * _kHeight;

    int numberOfLinesThatNeedToBeBuilt = this.height ~/ height;

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
          width: this.width,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = fontSize * _kHeight;

    return Column(
      children: [
        Stack(
          children: [
            // Add before TextField so it appears under it
            _buildLines(),
            ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: this.height, maxWidth: this.width),
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
