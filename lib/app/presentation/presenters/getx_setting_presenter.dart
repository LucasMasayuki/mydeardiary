import 'package:get/get.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/load_current_user.dart';
import 'package:mydeardiary/app/domain/usecases/settings/add_setting.dart';
import 'package:mydeardiary/app/domain/usecases/settings/edit_setting.dart';
import 'package:mydeardiary/app/domain/usecases/settings/get_setting.dart';
import 'package:mydeardiary/app/main/constants/default_settings.dart';

import 'package:mydeardiary/app/presentation/mixins/loading_manager.dart';
import 'package:mydeardiary/app/presentation/mixins/ui_error_manager.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';
import 'package:mydeardiary/app/ui/pages/settings/settings_presenter.dart';

class GetxSettingPresenter extends GetxController
    with LoadingManager, UIErrorManager
    implements SettingPresenter {
  final GetSetting getSettingCase;
  final EditSetting editSettingCase;
  final AddSetting addSettingCase;
  final LoadCurrentUser loadCurrentUserCase;

  GetxSettingPresenter({
    required this.getSettingCase,
    required this.editSettingCase,
    required this.addSettingCase,
    required this.loadCurrentUserCase,
  });

  final Rx<SettingEntity?> _setting = (SettingEntity(
    fontColor: defaultFontColor,
    fontFamily: defaultFontFamily,
    fontSize: defaultFontSize,
    pageColor: defaultPageColor,
    primaryColor: defaultPrimaryColor,
  )).obs;

  @override
  Stream<SettingEntity?> get settingStream => _setting.stream;

  @override
  Future<void> editSetting(EditSettingParams params) async {
    try {
      await editSettingCase.editSetting(params);
      mainError = UIError.nothing;
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

  @override
  Future<void> getSetting() async {
    mainError = UIError.nothing;

    try {
      final user = await loadCurrentUserCase.load();

      final params = GetSettingParams(userId: user.id ?? 0);
      var setting = await getSettingCase.getSetting(params);

      if (setting == null) {
        const params = AddSettingParams(
          fontColor: defaultFontColor,
          fontFamily: defaultFontFamily,
          fontSize: defaultFontSize,
          pageColor: defaultPageColor,
          primaryColor: defaultPrimaryColor,
        );

        setting = await addSettingCase.addSetting(params);
      }

      _setting.value = setting;
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
