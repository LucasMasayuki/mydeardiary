import 'dart:convert';

import 'package:mydeardiary/app/data/cache/save_shared_preferences.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/lock-authentication/edit_lock_authentication.dart';

class LocalEditLockAuthentication implements EditLockAuthentication {
  final SaveSharedPreferences saveSharedPreferences;

  LocalEditLockAuthentication({
    required this.saveSharedPreferences,
  });

  @override
  Future<LockAuthenticationEntity?> editLockAuthentication(
    EditLockAuthenticationParams params,
  ) async {
    try {
      final lockAuthentication = params.lockAuthenticationEntity.toString();

      await saveSharedPreferences.save(
          key: 'lockAuthentication', value: lockAuthentication);

      return params.lockAuthenticationEntity;
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
