// Mocks generated by Mockito 5.0.10 from annotations
// in mydeardiary/test/presentation/presenters/getx_signup_presenter_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mydeardiary/app/domain/entities/user_entity.dart'
    as _i2;
import 'package:mydeardiary/app/domain/usecases/add_user.dart'
    as _i6;
import 'package:mydeardiary/app/domain/usecases/save_current_user.dart'
    as _i4;
import 'package:mydeardiary/app/presentation/protocols/validation.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeUserEntity extends _i1.Fake implements _i2.UserEntity {}

/// A class which mocks [Validation].
///
/// See the documentation for Mockito's code generation for more information.
class MockValidation extends _i1.Mock implements _i3.Validation {
  MockValidation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ValidationError? validate(
          {String? field, Map<dynamic, dynamic>? input}) =>
      (super.noSuchMethod(
              Invocation.method(#validate, [], {#field: field, #input: input}))
          as _i3.ValidationError?);
}

/// A class which mocks [SaveCurrentUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveCurrentUser extends _i1.Mock implements _i4.SaveCurrentUser {
  MockSaveCurrentUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> save(_i2.UserEntity? user) =>
      (super.noSuchMethod(Invocation.method(#save, [user]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
}

/// A class which mocks [AddUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddUser extends _i1.Mock implements _i6.AddUser {
  MockAddUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.UserEntity> add(_i6.AddUserParams? params) =>
      (super.noSuchMethod(Invocation.method(#add, [params]),
              returnValue: Future<_i2.UserEntity>.value(_FakeUserEntity()))
          as _i5.Future<_i2.UserEntity>);
}
