import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/add-diary/add_diary_presenter_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class AddDiaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AddDiaryPresenter>(makeGetxAddDiaryPresenter());
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
  }
}
