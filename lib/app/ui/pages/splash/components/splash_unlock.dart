import 'package:flutter/material.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/ui/pages/splash/components/splash_layout.dart';

class SplashUnlock extends StatelessWidget {
  final Color fontColor;
  final Color backgroundColor;
  final String fontFamily;
  final Color primaryColor;
  final Function() onAuthenticate;
  final LockAuthenticationType type;

  const SplashUnlock({
    Key? key,
    required this.fontColor,
    required this.backgroundColor,
    required this.primaryColor,
    required this.fontFamily,
    required this.onAuthenticate,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashLayout(
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      fontFamily: fontFamily,
      child: Column(children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              primaryColor,
            ),
            elevation: MaterialStateProperty.all(2.0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          onPressed: onAuthenticate,
          child: Row(
            children: [
              Icon(
                Icons.fingerprint,
                color: fontColor,
              ),
              Text(
                'Digital',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ]),
    );
  }
}
