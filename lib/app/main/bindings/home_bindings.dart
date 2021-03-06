import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/home/home_presenter_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HomePresenter>(makeGetxHomePresenter());
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
  }
}
