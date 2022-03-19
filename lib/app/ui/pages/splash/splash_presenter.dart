import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

abstract class SplashPresenter {
  Stream<String?> get navigateToStream;
  Stream<SettingEntity?> get settingStream;
  Stream<LockAuthenticationEntity?> get lockAuthenticationStream;

  Future<void> checkAccount({int durationInSeconds});
  Future<void> onAuthenticateBiometric();
}
