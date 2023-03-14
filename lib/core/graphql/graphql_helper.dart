import 'package:graphql_flutter/graphql_flutter.dart';
import '../utils/url_constants.dart';

class GraphQlHelper {
  GraphQLClient initGraphQlClient() {
    final HttpLink httpLink = HttpLink(
      Urls.baseUrl,
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => "Bearer ''", // We do need any token as this api is free
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
