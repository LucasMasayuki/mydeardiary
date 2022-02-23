import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/user_entity.dart';

abstract class AddUser {
  Future<UserEntity> add(AddUserParams params);
}

class AddUserParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  @override
  List get props => [
        name,
        email,
        password,
        passwordConfirmation,
      ];

  const AddUserParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}
