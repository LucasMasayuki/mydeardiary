import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/read-diary/read_diary_presenter_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class ReadDiaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ReadDiaryPresenter>(makeReadDiaryPresenter());
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
  }
}
