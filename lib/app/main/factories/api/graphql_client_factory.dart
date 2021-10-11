import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mydeardiary/app/data/api/graphql.dart';
import 'package:mydeardiary/app/infra/api/graphql_adapter.dart';
import 'package:mydeardiary/app/main/factories/api/api_url_factory.dart';

GraphQl makeGraphQLAdapter() => GraphQlAdapter(
      GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(makeApiUrl('graphql')),
      ),
    );
