import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/settings/get_setting.dart';

class LocalGetSettings implements GetSetting {
  final FetchSharedPreferences fetchSharedPreferences;

  LocalGetSettings({
    required this.fetchSharedPreferences,
  });

  @override
  Future<SettingEntity?> getSetting(GetSettingParams params) async {
    try {
      final setting = await fetchSharedPreferences.fetch('settings');
      if (setting == null) {
        return null;
      }

      return SettingEntity.fromJson(json.decode(setting));
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
