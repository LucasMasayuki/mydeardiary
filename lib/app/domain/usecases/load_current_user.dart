import 'package:mydeardiary/app/domain/entities/user_entity.dart';

abstract class LoadCurrentUser {
  Future<UserEntity> load();
}
