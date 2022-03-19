import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/pages/splash/components/splash_layout.dart';

class SplashLoading extends StatelessWidget {
  final Color fontColor;
  final Color backgroundColor;
  final String fontFamily;

  const SplashLoading(
      {Key? key,
      required this.fontColor,
      required this.backgroundColor,
      required this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashLayout(
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontFamily: fontFamily,
      child: CircularProgressIndicator(
        color: fontColor,
      ),
    );
  }
}
