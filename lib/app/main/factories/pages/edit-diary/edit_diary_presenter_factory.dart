import 'package:mydeardiary/app/main/factories/usecases/diaries/add_diary_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/diaries/edit_diary_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/diaries/get_diary_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_edit_diary_presenter.dart';

GetxEditDiaryPresenter makeGetxEditDiaryPresenter() => GetxEditDiaryPresenter(
      editDiaryCase: makeEditDiary(),
      getDiaryCase: makeGetDiary(),
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
    );
