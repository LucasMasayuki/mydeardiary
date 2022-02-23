import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? token;

  @override
  List get props => [token];

  const UserEntity({this.token, this.id});
}
