// Mocks generated by Mockito 5.0.16 from annotations
// in mydeardiary/test/data/usecases/remote_add_user_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:graphql_flutter/graphql_flutter.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mydeardiary/app/data/api/graphql.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [GraphQl].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphQl extends _i1.Mock implements _i2.GraphQl {
  MockGraphQl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<T> query<T>(String? query, Map<String, dynamic>? variables) =>
      (super.noSuchMethod(Invocation.method(#query, [query, variables]),
          returnValue: Future<T>.value(null)) as _i3.Future<T>);
  @override
  _i3.Future<T> mutate<T>(String? mutation, Map<String, dynamic>? variables) =>
      (super.noSuchMethod(Invocation.method(#mutate, [mutation, variables]),
          returnValue: Future<T>.value(null)) as _i3.Future<T>);
  @override
  dynamic handleResponse(_i4.QueryResult<dynamic>? response) =>
      super.noSuchMethod(Invocation.method(#handleResponse, [response]));
  @override
  String toString() => super.toString();
}
