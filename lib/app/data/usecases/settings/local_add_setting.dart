import 'dart:convert';

import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/settings/add_setting.dart';

class LocalAddSetting implements AddSetting {
  final SaveSharedPreferences saveSharedPreferences;

  LocalAddSetting({
    required this.saveSharedPreferences,
  });

  Future<SettingEntity> addSetting(AddSettingParams params) async {
    try {
      final entity = new SettingEntity(
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

      return entity;
    } catch (error) {
      print(error);
      throw DomainError.unexpected;
    }
  }
}
