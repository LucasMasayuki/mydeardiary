import 'package:equatable/equatable.dart';

enum LockAuthenticationType {
  biometric,
  pincode,
}

// ignore: must_be_immutable
class LockAuthenticationEntity extends Equatable {
  late LockAuthenticationType type;
  late int? pinCode;
  late String? recoveryEmail;
  late DateTime? created;
  late DateTime? modified;

  @override
  List get props => [type];

  LockAuthenticationEntity({
    required this.type,
    this.pinCode,
    this.recoveryEmail,
    this.created,
    this.modified,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'pinCode': pinCode,
        'recoveryEmail': recoveryEmail,
      };

  LockAuthenticationEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    pinCode = json['pinCode'];
    recoveryEmail = json['recoveryEmail'];
    created = json['created'];
    modified = json['modified'];
  }
}
