import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const AddButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(Icons.add),
          Text(
            text.tr.toUpperCase(),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
