import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

class PreviewDiary extends StatelessWidget {
  final double _kHeight = 2.0;
  final String text;
  final double height;
  final double width;
  final SettingEntity? setting;

  PreviewDiary({
    required this.text,
    required this.height,
    required this.width,
    required this.setting,
  });

  Widget _buildLines() {
    var height = setting?.fontSize ?? 32 * _kHeight;

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
                    color: colorFromHex(setting?.fontColor ?? ''),
                    fontFamily: setting?.fontFamily,
                    fontSize: setting?.fontSize,
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
