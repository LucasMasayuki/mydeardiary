import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/ui/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:mydeardiary/app/ui/mixins/loading_manager.dart';
import 'package:mydeardiary/app/ui/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/pages/lock-authentication/lock_authentication_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

import '../../../utils/color_helper.dart';

// ignore: must_be_immutable
class LockPage extends StatelessWidget
    with LoadingManager, UIErrorManager, NavigationManager {
  SettingPresenter presenter = Get.find<SettingPresenter>();
  LockAuthenticationPresenter lockPresenter =
      Get.find<LockAuthenticationPresenter>();

  LockPage({Key? key}) : super(key: key);

  Future<void> onPressSelectLocalAuthType(LockAuthenticationType type) async {
    try {
      await lockPresenter.setAuthenticationType(type);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleLoading(context, presenter.isLoadingStream);
      presenter.getSetting();
      lockPresenter.getLockAuthentication();

      return StreamBuilder<SettingEntity?>(
        stream: presenter.settingStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final setting = snapshot.data;

          return Layout(
            setting: setting,
            actions: const [],
            title: 'Configuração do cadeado',
            withBackButton: true,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_open_outlined,
                      size: 72,
                      color: createColorFromHex(
                        setting?.fontColor ?? '',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    Text(
                      'Proteja seu diário com uma das opções',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: setting?.fontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: createColorFromHex(
                          setting?.fontColor ?? '',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 32)),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          createColorFromHex(
                            setting?.primaryColor ?? '',
                          ),
                        ),
                        elevation: MaterialStateProperty.all(2.0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: createColorFromHex(
                              setting?.fontColor ?? '',
                            ),
                          ),
                          Text(
                            'Digital',
                            style: TextStyle(
                              fontFamily: setting?.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: createColorFromHex(
                                setting?.fontColor ?? '',
                              ),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          createColorFromHex(
                            setting?.primaryColor ?? '',
                          ),
                        ),
                        elevation: MaterialStateProperty.all(2.0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: createColorFromHex(
                              setting?.fontColor ?? '',
                            ),
                          ),
                          Text(
                            'Senha',
                            style: TextStyle(
                              fontFamily: setting?.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: createColorFromHex(
                                setting?.fontColor ?? '',
                              ),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(20),
              ),
            ),
          );
        },
      );
    });
  }
}
