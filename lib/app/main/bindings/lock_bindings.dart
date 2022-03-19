import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/lock/lock_presenter_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/lock-authentication/lock_authentication_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class LockBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
    Get.put<LockAuthenticationPresenter>(makeLockAuthenticationPresenter());
  }
}
