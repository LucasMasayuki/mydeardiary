import 'package:mydeardiary/app/data/usecases/settings/local_edit_setting.dart';
import 'package:mydeardiary/app/domain/usecases/settings/edit_setting.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

EditSetting makeEditSettings() => LocalEditSetting(
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
