import 'package:flutter/material.dart';

class LineInput extends StatelessWidget {
  final void Function(String) onChangeLine;
  final String placeholder;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const LineInput({
    Key? key,
    required this.onChangeLine,
    this.placeholder = '',
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: placeholder,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      onChanged: onChangeLine,
    );
  }
}
