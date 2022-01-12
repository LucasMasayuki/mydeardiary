import 'package:get/get.dart';
import 'package:mydeardiary/app/main/factories/pages/edit-diary/edit_diary_presenter_factory.dart';
import 'package:mydeardiary/app/ui/pages/edit-diary/edit_diary_presenter.dart';

class EditDiaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<EditDiaryPresenter>(makeGetxEditDiaryPresenter());
  }
}
