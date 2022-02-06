import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diary.dart';
import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';

import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_view_model.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_presenter.dart';

class GetxReadDiaryPresenter extends GetxController
    with LoadingManager, NavigationManager, UIErrorManager
    implements ReadDiaryPresenter {
  final GetDiary getDiaryCase;
  final LoadCurrentUser loadCurrentUserCase;
  RxInt _totalPages = 1.obs;

  GetxReadDiaryPresenter({
    required this.getDiaryCase,
    required this.loadCurrentUserCase,
  });

  final _diary = Rx<ReadDiaryViewModel?>(null);

  Stream<ReadDiaryViewModel?> get diaryStream => _diary.stream;
  int get totalPages => _totalPages.value;

  Future<void> getDiary(int index) async {
    mainError = UIError.nothing;

    try {
      final user = await loadCurrentUserCase.load();

      final params = new GetDiaryParams(userId: user.id ?? 0, diaryId: index);
      final diary = await getDiaryCase.getDiary(params);

      final lines = diary?.text.split('\n');

      List<String> pages = [];
      String page = '';
      var i = 0;

      lines?.forEach((line) {
        if (i == 0) {
          page = line;
        } else {
          page = '$page \n $line';
        }

        if (i % 29 == 0 && i != 0) {
          pages.add(page);

          page = '';
        }

        i++;
      });

      if (page.length > 0) {
        pages.add(page);
      }

      _totalPages.value = pages.length;

      _diary.value = new ReadDiaryViewModel(
        date: diary!.date,
        title: diary.title ?? '',
        pages: pages,
      );
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

  void goToEditDiary(int index) {
    navigateTo = '/edit-diary/$index';
  }
}
