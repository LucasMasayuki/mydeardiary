import 'package:mydeardiary/app/main/factories/usecases/diaries/get_diary_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_read_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/read-diary/read_diary_presenter.dart';

ReadDiaryPresenter makeReadDiaryPresenter() => GetxReadDiaryPresenter(
      getDiaryCase: makeGetDiary(),
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
    );
