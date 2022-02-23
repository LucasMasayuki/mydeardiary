import 'package:mydeardiary/app/data/usecases/settings/local_add_setting.dart';
import 'package:mydeardiary/app/domain/usecases/settings/add_setting.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

AddSetting makeAddSettings() => LocalAddSetting(
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
