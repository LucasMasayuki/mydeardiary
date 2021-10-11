import 'package:mydeardiary/app/data/usecases/remote_add_user_.dart';
import 'package:mydeardiary/app/domain/usecases/add_user.dart';
import 'package:mydeardiary/app/main/factories/api/graphql_client_factory.dart';

AddUser makeRemoteAddUser() => RemoteAddUser(
      graphQlClient: makeGraphQLAdapter(),
    );
