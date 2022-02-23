import 'package:mydeardiary/app/data/usecases/settings/local_get_setting.dart';
import 'package:mydeardiary/app/domain/usecases/settings/get_setting.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

GetSetting makeGetSettings() => LocalGetSettings(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
    );
