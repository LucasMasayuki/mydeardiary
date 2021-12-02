import 'package:flutter/material.dart';

class LineInput extends StatelessWidget {
  final void Function(String) onChangeLine;
  final String placeholder;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const LineInput({
    required this.onChangeLine,
    this.placeholder = '',
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: this.focusNode,
      decoration: InputDecoration(
        hintText: this.placeholder,
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      onChanged: onChangeLine,
    );
  }
}
