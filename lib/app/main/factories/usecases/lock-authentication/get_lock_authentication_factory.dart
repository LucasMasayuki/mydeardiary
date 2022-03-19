import 'package:mydeardiary/app/data/usecases/lock-authentication/local_get_lock_authentication.dart';
import 'package:mydeardiary/app/data/usecases/settings/local_get_setting.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/get_lock_authentication.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

GetLockAuthentication makeGetLockAuthentication() => LocalGetLockAuthentication(
      fetchSharedPreferences: makeSharedPreferencesAdapter(),
    );
