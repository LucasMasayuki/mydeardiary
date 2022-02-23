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
  DateTime _date = DateTime.now();

  @override
  Stream<UIError?> get titleErrorStream => _titleError.stream;
  @override
  Stream<UIError?> get dateErrorStream => _dateError.stream;

  @override
  void onChangeTitle(String title) {
    _title = title;
  }

  @override
  void onChangeDate(DateTime date) {
    _date = date;
  }

  @override
  Future<void> addDiary(String text) async {
    if (text == '' || _title == '') {
      mainError = UIError.requiredField;
      return;
    }

    try {
      final params = AddDiaryParams(date: _date, title: _title, text: text);

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
