import 'dart:math';

import 'package:flutter/material.dart';

class DiaryInput extends StatefulWidget {
  final String initialText;
  final TextEditingController controller;
  final double fontSize;

  DiaryInput({
    required this.controller,
    this.initialText = '',
    this.fontSize = 32.0,
  });

  @override
  State<StatefulWidget> createState() {
    return _DiaryInputState();
  }
}

class _DiaryInputState extends State<DiaryInput> {
  late GlobalKey _textFieldKey;
  double _kHeight = 2.0;
  late double _kLineHeight;
  late double _kInitialHeight;
  late double lastKnownHeight;

  @override
  initState() {
    super.initState();
    _textFieldKey = GlobalKey();
    widget.controller.text = widget.initialText;
    _kLineHeight = widget.fontSize * _kHeight;
    _kInitialHeight = _kLineHeight * 5;
    lastKnownHeight = _kInitialHeight;

    // Wait for all widgets to be drawn before trying to draw lines again
    WidgetsBinding.instance?.addPostFrameCallback((_) => _setLastKnownHeight());
  }

  void _setLastKnownHeight() {
    final RenderBox? renderBoxTextField =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox;
    final size = renderBoxTextField?.size;

    if (lastKnownHeight != size?.height) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        // Causes the widget to rebuild
        // (so the lines get redrawn)
        setState(() {
          lastKnownHeight = size?.height ?? 0;
        });
      });
    }
  }

  Widget _buildLines() {
    int numberOfLinesThatNeedToBeBuilt =
        max(_kInitialHeight, lastKnownHeight) ~/ _kLineHeight;

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
          height: _kLineHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              // Add before TextField so it appears under it
              _buildLines(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: _kInitialHeight,
                ),
                child: Container(
                  child: NotificationListener<SizeChangedLayoutNotification>(
                    onNotification:
                        (SizeChangedLayoutNotification notification) {
                      // Set the new TextField height whenever it changes
                      _setLastKnownHeight();
                      return true;
                    },
                    child: SizeChangedLayoutNotifier(
                      // Listen for when the TextField's height changes
                      child: TextField(
                        key: _textFieldKey,
                        controller: widget.controller,
                        cursorHeight: _kLineHeight * 0.6,
                        cursorWidth: 4,
                        maxLines: null,
                        decoration: _inputDecoration(),
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          height: _kHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
