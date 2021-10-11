import 'package:mydeardiary/app/data/usecases/save_current_user.dart';
import 'package:mydeardiary/app/domain/usecases/save_current_user.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

SaveCurrentUser makeLocalSaveCurrentUser() => LocalSaveCurrentUser(
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
