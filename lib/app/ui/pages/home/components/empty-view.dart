import 'package:mydeardiary/app/ui/components/buttons/add_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function() onPressButton;

  EmptyView(this.text, this.buttonText, this.onPressButton);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            this.text.tr,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 32)),
          AddButton(
            text: this.buttonText,
            onPressed: this.onPressButton,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
