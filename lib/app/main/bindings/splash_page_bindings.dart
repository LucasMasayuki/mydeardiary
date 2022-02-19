import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/factories/pages/splash/splash_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';
import 'package:mydeardiary/app/ui/pages/splash/splash_presenter.dart';

class SplashPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
    Get.put<SplashPresenter>(makeGetxSplashPresenter());
  }
}
