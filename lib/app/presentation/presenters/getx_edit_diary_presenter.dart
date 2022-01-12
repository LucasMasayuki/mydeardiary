import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/edit-diary.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diary.dart';
import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';

import 'package:mydeardiary/app/presentation/mixins/form_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/edit-diary/edit_diary_presenter.dart';

class GetxEditDiaryPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements EditDiaryPresenter {
  final EditDiary editDiaryCase;
  final GetDiary getDiaryCase;
  final LoadCurrentUser loadCurrentUserCase;

  GetxEditDiaryPresenter({
    required this.editDiaryCase,
    required this.getDiaryCase,
    required this.loadCurrentUserCase,
  });

  final _titleError = Rx<UIError>(UIError.unexpected);
  final _dateError = Rx<UIError>(UIError.unexpected);
  final _diary = Rx<DiaryEntity?>(null);

  String _title = '';
  DateTime _date = new DateTime.now();

  Stream<UIError?> get titleErrorStream => _titleError.stream;
  Stream<UIError?> get dateErrorStream => _dateError.stream;
  Stream<DiaryEntity?> get diaryStream => _diary.stream;

  void onChangeTitle(String title) {
    _title = title;
  }

  void onChangeDate(DateTime date) {
    _date = date;
  }

  Future<void> editDiary(String text, int index) async {
    if (text == '' || _title == '') {
      mainError = UIError.requiredField;
      return;
    }

    try {
      final params = new EditDiaryParams(
        date: _date,
        title: _title,
        text: text,
        index: index,
      );

      await editDiaryCase.editDiary(params);
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

  Future<void> getDiary(int index) async {
    mainError = UIError.nothing;

    try {
      final user = await loadCurrentUserCase.load();

      final params = new GetDiaryParams(userId: user.id ?? 0, diaryId: index);
      final diary = await getDiaryCase.getDiary(params);

      _diary.value = diary;
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
