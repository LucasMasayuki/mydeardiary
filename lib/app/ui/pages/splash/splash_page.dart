import 'package:flutter/material.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/main/constants/default_settings.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/pages/splash/components/splash_unlock.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

import 'components/splash_loading.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;

  SplashPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.checkAccount();

          handleNavigation(
            presenter.navigateToStream,
            clear: true,
          );

          return StreamBuilder<SettingEntity?>(
            stream: presenter.settingStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) {
                // ignore: prefer_const_constructors
                return SplashLoading(
                  fontColor: createColorFromHex(defaultFontColor),
                  backgroundColor: createColorFromHex(defaultPageColor),
                  fontFamily: defaultFontFamily,
                );
              }

              final setting = snapshot.data;

              return StreamBuilder<LockAuthenticationEntity?>(
                stream: presenter.lockAuthenticationStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) {
                    // ignore: prefer_const_constructors
                    return SplashLoading(
                      fontColor: createColorFromHex(defaultFontColor),
                      backgroundColor: createColorFromHex(defaultPageColor),
                      fontFamily: defaultFontFamily,
                    );
                  }

                  final lockAuthentication = snapshot.data;

                  // if (lockAuthentication != null) {
                  // if (lockAuthentication.type ==
                  // LockAuthenticationType.biometric) {
                  return SplashUnlock(
                    fontColor: createColorFromHex(setting?.fontColor ?? ''),
                    backgroundColor:
                        createColorFromHex(setting?.pageColor ?? ''),
                    fontFamily: setting?.fontFamily ?? defaultFontFamily,
                    primaryColor:
                        createColorFromHex(setting?.primaryColor ?? ''),
                    onAuthenticate: presenter.onAuthenticateBiometric,
                    // type: lockAuthentication.type,
                    type: LockAuthenticationType.biometric,
                  );
                  // }
                  // }

                  // return Builder(
                  //   builder: (context) {
                  //     return SplashLoading(
                  //       fontColor: createColorFromHex(setting?.fontColor ?? ''),
                  //       backgroundColor:
                  //           createColorFromHex(setting?.pageColor ?? ''),
                  //       fontFamily: setting?.fontFamily ?? defaultFontFamily,
                  //     );
                  //   },
                  // );
                },
              );
            },
          );
        },
      ),
    );
  }
}
