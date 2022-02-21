import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/edit-diary/edit_diary_presenter_factory.dart';
import 'package:mydeardiary/app/main/factories/pages/setting/setting_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/edit-diary/edit_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class EditDiaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<EditDiaryPresenter>(makeGetxEditDiaryPresenter());
    Get.put<SettingPresenter>(makeGetxSettingPresenter());
  }
}
