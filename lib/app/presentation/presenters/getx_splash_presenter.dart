import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/get_lock_authentication.dart';
import 'package:mydeardiary/app/domain/usecases/settings/get_setting.dart';
import 'package:mydeardiary/app/main/constants/default_settings.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';
import 'package:local_auth/local_auth.dart';

class GetxSplashPresenter extends GetxController
    with NavigationManager
    implements SplashPresenter {
  final LoadCurrentUser loadCurrentUserCase;
  final GetSetting getSettingCase;
  final GetLockAuthentication getLockAuthenticationCase;

  final Rx<SettingEntity?> _setting = (SettingEntity(
    fontColor: defaultFontColor,
    fontFamily: defaultFontFamily,
    fontSize: defaultFontSize,
    pageColor: defaultPageColor,
    primaryColor: defaultPrimaryColor,
  )).obs;

  final Rx<LockAuthenticationEntity?> _lockAuthentication = null.obs;

  @override
  Stream<SettingEntity?> get settingStream => _setting.stream;

  @override
  Stream<LockAuthenticationEntity?> get lockAuthenticationStream =>
      _lockAuthentication.stream;

  GetxSplashPresenter({
    required this.loadCurrentUserCase,
    required this.getSettingCase,
    required this.getLockAuthenticationCase,
  });

  @override
  Future<void> onAuthenticateBiometric() async {
    try {
      var localAuth = LocalAuthentication();
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to unlock the diary',
        biometricOnly: true,
      );

      if (didAuthenticate) {
        navigateTo = '/home';
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> checkAccount({int durationInSeconds = 1}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));

    try {
      final user = await loadCurrentUserCase.load();
      final getSettingParams = GetSettingParams(userId: user.id ?? 0);
      _setting.value = await getSettingCase.getSetting(getSettingParams);

      final getLockAuthenticationParams = GetLockAuthenticationParams(
        userId: user.id ?? 0,
      );

      _lockAuthentication.value =
          await getLockAuthenticationCase.getLockAuthentication(
        getLockAuthenticationParams,
      );

      _lockAuthentication.refresh();

      print(_lockAuthentication.value);

      if (_lockAuthentication.value != null) {
        return;
      }

      // navigateTo = '/home';
    } catch (error) {
      print(error);
    }
  }
}
