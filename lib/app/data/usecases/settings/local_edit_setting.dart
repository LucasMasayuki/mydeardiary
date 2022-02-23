import 'dart:convert';

import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/settings/edit_setting.dart';

class LocalEditSetting implements EditSetting {
  final SaveSharedPreferences saveSharedPreferences;

  LocalEditSetting({
    required this.saveSharedPreferences,
  });

  @override
  Future<void> editSetting(EditSettingParams params) async {
    try {
      final entity = SettingEntity(
        fontColor: params.fontColor,
        fontFamily: params.fontFamily,
        fontSize: params.fontSize,
        pageColor: params.pageColor,
        primaryColor: params.primaryColor,
      );

      await saveSharedPreferences.save(
        key: 'settings',
        value: json.encode(entity.toJson()),
      );
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
