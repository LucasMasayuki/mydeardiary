import 'package:flutter/material.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';
import 'package:get/get.dart';
import 'package:mydeardiary/app/utils/color_helper.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SettingPresenter settingPresenter;
  final SplashPresenter presenter;

  SplashPage(
      {Key? key, required this.presenter, required this.settingPresenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      body: Builder(builder: (context) {
        handleNavigation(
          presenter.navigateToStream,
          clear: true,
        );

        return StreamBuilder<SettingEntity?>(
          stream: settingPresenter.settingStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final setting = snapshot.data;

            return Container(
              color: createColorFromHex(setting?.pageColor ?? ''),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'My dear diary'.tr,
                      style: TextStyle(
                        color: createColorFromHex(setting?.fontColor ?? ''),
                        fontFamily: setting?.fontFamily,
                        fontSize: 52,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 32)),
                    CircularProgressIndicator(
                      color: createColorFromHex(setting?.fontColor ?? ''),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
