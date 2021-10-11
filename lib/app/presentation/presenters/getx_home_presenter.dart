import 'package:mydeardiary/app/domain/entities/diary_entity.dart';
import 'package:mydeardiary/app/domain/usecases/diaries/get-diaries.dart';
import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';
import 'package:get/get.dart';

import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/presentation/mixins/form_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/navigation_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

class GetxHomePresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements HomePresenter {
  final GetDiaries getDiariesUseCase;
  final LoadCurrentUser loadCurrentUserCase;

  final _getDiariesError = Rx<UIError>(UIError.unexpected);
  final _diaries = Rx<List<DiaryEntity>>([]);

  Stream<UIError?> get getDiariesErrorStream => _getDiariesError.stream;
  Stream<List<DiaryEntity>?> get diariesStream => _diaries.stream;

  GetxHomePresenter({
    required this.getDiariesUseCase,
    required this.loadCurrentUserCase,
  });

  Future<void> getDiaries() async {
    print('passa');
    try {
      final user = await loadCurrentUserCase.load();
      mainError = UIError.nothing;

      _diaries.value = await getDiariesUseCase.getDiaries(
        GetDiariesParams(userId: user.id),
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
}
