import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/add-diary/add_diary_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';

class AddDiaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AddDiaryPresenter>(makeGetxAddDiaryPresenter());
  }
}
