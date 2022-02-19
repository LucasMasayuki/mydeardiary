import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class SettingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
  }
}
