import 'package:mydeardiary/app/data/usecases/remote_authentication.dart';
import 'package:mydeardiary/app/domain/usecases/authentication.dart';
import 'package:mydeardiary/app/main/factories/api/graphql_client_factory.dart';

Authentication makeRemoteAuthentication() => RemoteAuthentication(
      graphQlClient: makeGraphQLAdapter(),
    );
