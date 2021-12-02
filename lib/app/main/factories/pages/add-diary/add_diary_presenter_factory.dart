import 'package:mydeardiary/app/main/factories/usecases/diaries/add_diary_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_add_diary_presenter.dart';
import 'package:mydeardiary/app/ui/pages/add-diary/add_diary_presenter.dart';

AddDiaryPresenter makeGetxAddDiaryPresenter() => GetxAddDiaryPresenter(
      addDiaryCase: makeAddDiary(),
    );
