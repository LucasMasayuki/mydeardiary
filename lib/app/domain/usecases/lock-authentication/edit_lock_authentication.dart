import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';

abstract class EditLockAuthentication {
  Future<LockAuthenticationEntity?> editLockAuthentication(
      EditLockAuthenticationParams params);
}

class EditLockAuthenticationParams extends Equatable {
  final int userId;
  final LockAuthenticationEntity lockAuthenticationEntity;

  @override
  List get props => [
        userId,
        lockAuthenticationEntity,
      ];

  const EditLockAuthenticationParams({
    required this.userId,
    required this.lockAuthenticationEntity,
  });
}
