import 'package:mydeardiary/app/data/api/graphql.dart';
import 'package:mydeardiary/app/data/api/http_error.dart';
import 'package:mydeardiary/app/data/models/remote_user_model.dart';
import 'package:mydeardiary/app/domain/entities/user_entity.dart';
import 'package:mydeardiary/app/domain/helpers/domain_errors.dart';
import 'package:mydeardiary/app/domain/usecases/authentication.dart';
import 'package:mydeardiary/app/main/graphql/auth.dart';

class RemoteAuthentication implements Authentication {
  final GraphQl graphQlClient;

  RemoteAuthentication({required this.graphQlClient});

  @override
  Future<UserEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();

    try {
      final responseData = await graphQlClient.query(loginQuery, body);
      if (responseData == null) {
        throw DomainError.unexpected;
      }

      return RemoteUserModel.fromJson(responseData).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({
    required this.email,
    required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
        email: params.email,
        password: params.password,
      );

  Map<String, dynamic> toJson() => Map<String, dynamic>.from(
        {
          'email': email,
          'password': password,
        },
      );
}
