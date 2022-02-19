import 'package:mydeardiary/app/main/factories/usecases/load_current_user_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/setting/add_setting_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/setting/edit_setting_factory.dart';
import 'package:mydeardiary/app/main/factories/usecases/setting/get_settings_factory.dart';
import 'package:mydeardiary/app/presentation/presenters/getx_setting_presenter.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

SettingPresenter makeGetxSettingPresenter() => GetxSettingPresenter(
      getSettingCase: makeGetSettings(),
      loadCurrentUserCase: makeLocalLoadCurrentUser(),
      editSettingCase: makeEditSettings(),
      addSettingCase: makeAddSettings(),
    );
