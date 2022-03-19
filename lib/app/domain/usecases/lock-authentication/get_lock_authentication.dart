import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/lock_authentication_entity.dart';

abstract class GetLockAuthentication {
  Future<LockAuthenticationEntity?> getLockAuthentication(
      GetLockAuthenticationParams params);
}

class GetLockAuthenticationParams extends Equatable {
  final int userId;

  @override
  List get props => [
        userId,
      ];

  const GetLockAuthenticationParams({
    required this.userId,
  });
}
