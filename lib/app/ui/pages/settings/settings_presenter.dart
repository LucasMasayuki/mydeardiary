import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/usecases/settings/edit_setting.dart';
import 'package:mydeardiary/app/ui/helpers/ui_error.dart';

abstract class SettingPresenter {
  Stream<UIError?> get mainErrorStream;
  Stream<bool?> get isLoadingStream;
  Stream<SettingEntity?> get settingStream;

  Future<void> getSetting();
  Future<void> editSetting(EditSettingParams params);
}
