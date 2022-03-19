import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashLayout extends StatelessWidget {
  final Color fontColor;
  final Color backgroundColor;
  final String fontFamily;
  final Widget child;

  const SplashLayout({
    Key? key,
    required this.fontColor,
    required this.backgroundColor,
    required this.fontFamily,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          children: [
            Text(
              'My dear diary'.tr,
              style: TextStyle(
                color: fontColor,
                fontFamily: fontFamily,
                fontSize: 52,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 32)),
            child
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
