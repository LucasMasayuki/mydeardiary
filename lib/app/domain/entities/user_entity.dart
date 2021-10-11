import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? token;

  List get props => [token];

  UserEntity({this.token, this.id});
}
