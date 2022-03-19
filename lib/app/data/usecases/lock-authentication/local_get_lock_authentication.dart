import 'dart:convert';

import 'package:mydeardiary/app/data/cache/fetch_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/get_lock_authentication.dart';

class LocalGetLockAuthentication implements GetLockAuthentication {
  final FetchSharedPreferences fetchSharedPreferences;

  LocalGetLockAuthentication({
    required this.fetchSharedPreferences,
  });

  @override
  Future<LockAuthenticationEntity?> getLockAuthentication(
    GetLockAuthenticationParams params,
  ) async {
    try {
      final lockAuthentication =
          await fetchSharedPreferences.fetch('lock-authentication');
      if (lockAuthentication == null) {
        return null;
      }

      return LockAuthenticationEntity.fromJson(json.decode(lockAuthentication));
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
