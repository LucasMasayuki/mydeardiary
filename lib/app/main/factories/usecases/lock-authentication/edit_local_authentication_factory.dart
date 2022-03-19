import 'package:mydeardiary/app/data/usecases/lock-authentication/local_edit_lock_authentication.dart';
import 'package:mydeardiary/app/data/usecases/lock-authentication/local_get_lock_authentication.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/edit_lock_authentication.dart';
import 'package:mydeardiary/app/main/factories/cache/shared_preferences_adapter_factory.dart';

EditLockAuthentication makeEditLockAuthentication() =>
    LocalEditLockAuthentication(
      saveSharedPreferences: makeSharedPreferencesAdapter(),
    );
