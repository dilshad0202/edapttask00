
import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
  

class GraphQLconfiguration extends ChangeNotifier {


  static HttpLink link = HttpLink(
    'https://n7b67.sse.codesandbox.io/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache()
  ));


 GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
}



}

