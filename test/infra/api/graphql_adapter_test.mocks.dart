// Mocks generated by Mockito 5.0.10 from annotations
// in mydeardiary/test/infra/api/graphql_adapter_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:gql_exec/src/request.dart' as _i12;
import 'package:gql_link/src/link.dart' as _i3;
import 'package:graphql/src/cache/cache.dart' as _i4;
import 'package:graphql/src/cache/fragment.dart' as _i13;
import 'package:graphql/src/core/mutation_options.dart' as _i11;
import 'package:graphql/src/core/observable_query.dart' as _i6;
import 'package:graphql/src/core/policies.dart' as _i2;
import 'package:graphql/src/core/query_manager.dart' as _i5;
import 'package:graphql/src/core/query_options.dart' as _i9;
import 'package:graphql/src/core/query_result.dart' as _i7;
import 'package:graphql/src/graphql_client.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDefaultPolicies extends _i1.Fake implements _i2.DefaultPolicies {}

class _FakeLink extends _i1.Fake implements _i3.Link {}

class _FakeGraphQLCache extends _i1.Fake implements _i4.GraphQLCache {}

class _FakeQueryManager extends _i1.Fake implements _i5.QueryManager {}

class _FakeObservableQuery extends _i1.Fake implements _i6.ObservableQuery {}

class _FakeQueryResult extends _i1.Fake implements _i7.QueryResult {
  @override
  String toString() => super.toString();
}

/// A class which mocks [GraphQLClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphQLClient extends _i1.Mock implements _i8.GraphQLClient {
  MockGraphQLClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DefaultPolicies get defaultPolicies =>
      (super.noSuchMethod(Invocation.getter(#defaultPolicies),
          returnValue: _FakeDefaultPolicies()) as _i2.DefaultPolicies);
  @override
  set defaultPolicies(_i2.DefaultPolicies? _defaultPolicies) =>
      super.noSuchMethod(Invocation.setter(#defaultPolicies, _defaultPolicies),
          returnValueForMissingStub: null);
  @override
  _i3.Link get link =>
      (super.noSuchMethod(Invocation.getter(#link), returnValue: _FakeLink())
          as _i3.Link);
  @override
  _i4.GraphQLCache get cache => (super.noSuchMethod(Invocation.getter(#cache),
      returnValue: _FakeGraphQLCache()) as _i4.GraphQLCache);
  @override
  _i5.QueryManager get queryManager =>
      (super.noSuchMethod(Invocation.getter(#queryManager),
          returnValue: _FakeQueryManager()) as _i5.QueryManager);
  @override
  set queryManager(_i5.QueryManager? _queryManager) =>
      super.noSuchMethod(Invocation.setter(#queryManager, _queryManager),
          returnValueForMissingStub: null);
  @override
  _i6.ObservableQuery watchQuery(_i9.WatchQueryOptions? options) =>
      (super.noSuchMethod(Invocation.method(#watchQuery, [options]),
          returnValue: _FakeObservableQuery()) as _i6.ObservableQuery);
  @override
  _i6.ObservableQuery watchMutation(_i9.WatchQueryOptions? options) =>
      (super.noSuchMethod(Invocation.method(#watchMutation, [options]),
          returnValue: _FakeObservableQuery()) as _i6.ObservableQuery);
  @override
  _i10.Future<_i7.QueryResult> query(_i9.QueryOptions? options) =>
      (super.noSuchMethod(Invocation.method(#query, [options]),
              returnValue: Future<_i7.QueryResult>.value(_FakeQueryResult()))
          as _i10.Future<_i7.QueryResult>);
  @override
  _i10.Future<_i7.QueryResult> mutate(_i11.MutationOptions? options) =>
      (super.noSuchMethod(Invocation.method(#mutate, [options]),
              returnValue: Future<_i7.QueryResult>.value(_FakeQueryResult()))
          as _i10.Future<_i7.QueryResult>);
  @override
  _i10.Stream<_i7.QueryResult> subscribe(_i9.SubscriptionOptions? options) =>
      (super.noSuchMethod(Invocation.method(#subscribe, [options]),
              returnValue: Stream<_i7.QueryResult>.empty())
          as _i10.Stream<_i7.QueryResult>);
  @override
  _i10.Future<_i7.QueryResult> fetchMore(_i9.FetchMoreOptions? fetchMoreOptions,
          {_i9.QueryOptions? originalOptions,
          _i7.QueryResult? previousResult}) =>
      (super.noSuchMethod(
              Invocation.method(#fetchMore, [
                fetchMoreOptions
              ], {
                #originalOptions: originalOptions,
                #previousResult: previousResult
              }),
              returnValue: Future<_i7.QueryResult>.value(_FakeQueryResult()))
          as _i10.Future<_i7.QueryResult>);
  @override
  Map<String, dynamic>? readQuery(_i12.Request? request,
          {bool? optimistic = true}) =>
      (super.noSuchMethod(Invocation.method(
              #readQuery, [request], {#optimistic: optimistic}))
          as Map<String, dynamic>?);
  @override
  Map<String, dynamic>? readFragment(_i13.FragmentRequest? fragmentRequest,
          {bool? optimistic = true}) =>
      (super.noSuchMethod(Invocation.method(
              #readFragment, [fragmentRequest], {#optimistic: optimistic}))
          as Map<String, dynamic>?);
  @override
  void writeQuery(_i12.Request? request,
          {Map<String, dynamic>? data, bool? broadcast = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeQuery, [request], {#data: data, #broadcast: broadcast}),
          returnValueForMissingStub: null);
  @override
  void writeFragment(_i13.FragmentRequest? fragmentRequest,
          {bool? broadcast = true, Map<String, dynamic>? data}) =>
      super.noSuchMethod(
          Invocation.method(#writeFragment, [fragmentRequest],
              {#broadcast: broadcast, #data: data}),
          returnValueForMissingStub: null);
  @override
  _i10.Future<List<_i7.QueryResult?>>? resetStore(
          {bool? refetchQueries = true}) =>
      (super.noSuchMethod(Invocation.method(
              #resetStore, [], {#refetchQueries: refetchQueries}))
          as _i10.Future<List<_i7.QueryResult?>>?);
}
