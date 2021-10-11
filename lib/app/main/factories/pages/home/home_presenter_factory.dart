import 'package:mydeardiary/app/main/factories/usecases/diaries/get_diaries_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_home_presenter.dart';
import 'package:mydeardiary/app/ui/pages/home/home_presenter.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      getDiariesUseCase: makeGetDiaries(),
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
    );
