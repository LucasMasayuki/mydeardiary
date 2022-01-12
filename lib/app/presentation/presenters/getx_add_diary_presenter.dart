import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/add-diary.dart';

import 'package:mydeardiary/app/presentation/mixins/form_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';

class GetxAddDiaryPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements AddDiaryPresenter {
  final AddDiary addDiaryCase;

  GetxAddDiaryPresenter({
    required this.addDiaryCase,
  });

  final _titleError = Rx<UIError>(UIError.unexpected);
  final _dateError = Rx<UIError>(UIError.unexpected);

  String _title = '';
  DateTime _date = new DateTime.now();

  Stream<UIError?> get titleErrorStream => _titleError.stream;
  Stream<UIError?> get dateErrorStream => _dateError.stream;

  void onChangeTitle(String title) {
    _title = title;
  }

  void onChangeDate(DateTime date) {
    _date = date;
  }

  Future<void> addDiary(String text) async {
    if (text == '' || _title == '') {
      mainError = UIError.requiredField;
      return;
    }

    try {
      final params = new AddDiaryParams(date: _date, title: _title, text: text);

      await addDiaryCase.addDiary(params);
      mainError = UIError.nothing;

      navigateTo = '/home';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
    }
  }
}
