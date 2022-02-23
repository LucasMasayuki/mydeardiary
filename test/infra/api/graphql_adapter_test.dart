import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mydeardiary/app/data/api/http_error.dart';
import 'package:mydeardiary/app/infra/api/graphql_adapter.dart';
import 'package:mydeardiary/app/main/graphql/auth.dart';

import "package:http/http.dart" as http;

import 'graphql_adapter_test.mocks.dart';

@GenerateMocks([GraphQLClient])
void main() {
  late GraphQlAdapter sut;
  late MockGraphQLClient client;

  setUp(
    () {
      client = MockGraphQLClient();
      sut = GraphQlAdapter(client);
    },
  );

  group('query', () {
    PostExpectation mockQuery() => when(client.query(any));
    PostExpectation mockMutate() => when(client.mutate(any));

    void mockResponse(
      Map<String, dynamic>? data,
      OperationException? exception,
    ) {
      mockQuery().thenAnswer(
        (_) async => QueryResult(
          data: data,
          exception: exception,
          source: null,
          parserFn: (Map<String, dynamic> data) {},
        ),
      );

      mockMutate().thenAnswer(
        (_) async => QueryResult(
          data: data,
          exception: exception,
          source: null,
          parserFn: (Map<String, dynamic> data) {},
        ),
      );
    }

    void mockExceptionResponse(OperationException exception) {
      mockResponse(null, exception);
    }

    void mockSuccessResponse(Map<String, dynamic> data) {
      mockResponse(data, null);
    }

    test('When query returns not found error, should not found exception', () {
      final exception = OperationException(
        linkException: HttpLinkServerException(
          response: http.Response('', HttpStatus.notFound),
          parsedResponse: const Response(),
        ),
      );

      mockExceptionResponse(exception);

      final future = sut.query(loginQuery, {});

      expect(future, throwsA(HttpError.notFound));
    });

    test('When query returns no content error, should null', () async {
      final exception = OperationException(
        linkException: HttpLinkServerException(
          response: http.Response('', HttpStatus.noContent),
          parsedResponse: const Response(),
        ),
      );

      mockExceptionResponse(exception);

      final future = await sut.query(loginQuery, {});

      expect(future, null);
    });

    test('When query returns bad request error, should bad request exception',
        () {
      final exception = OperationException(
        linkException: HttpLinkServerException(
          response: http.Response('', HttpStatus.badRequest),
          parsedResponse: const Response(),
        ),
      );

      mockExceptionResponse(exception);

      final future = sut.query(loginQuery, {});
      expect(future, throwsA(HttpError.badRequest));
    });

    test('When query returns unauthorized error, should unauthorized exception',
        () {
      final exception = OperationException(
        linkException: HttpLinkServerException(
          response: http.Response('', HttpStatus.unauthorized),
          parsedResponse: const Response(),
        ),
      );

      mockExceptionResponse(exception);

      final future = sut.query(loginQuery, {});

      expect(future, throwsA(HttpError.unauthorized));
    });

    test('When query returns forbidden error, should forbidden exception', () {
      final exception = OperationException(
        linkException: HttpLinkServerException(
          response: http.Response('', HttpStatus.forbidden),
          parsedResponse: const Response(),
        ),
      );

      mockExceptionResponse(exception);

      final future = sut.query(loginQuery, {});

      expect(future, throwsA(HttpError.forbidden));
    });

    test('When query returns success and data, should return response data',
        () async {
      final data = {'accessToken': 'test'};

      mockSuccessResponse(data);

      final future = await sut.query(loginQuery, {});

      expect(future, data);
    });

    test('When mutate returns success and data, should return response data',
        () async {
      final data = {'accessToken': 'test'};

      mockSuccessResponse(data);

      final future = await sut.mutate(signupMutation, {});

      expect(future, data);
    });
  });
}
