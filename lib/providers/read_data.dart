import 'package:edapt_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DisplayDataProvider extends ChangeNotifier {
  final String documentValue = """query{
 movies{
 name,
 genre,
 actor{
 name
 }
 }
}""";

  Widget displayData() {
    return Query(
      options: QueryOptions(document: gql(documentValue)),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.isLoading) {
          return Center(
              child: SpinKitCircle(
            color: Colors.red,
            size: 45,
          ));
        }
        return ListView.builder(
            itemCount: result.data['movies'].length,
            itemBuilder: (context, index) {
           
              return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(result.data['movies'][index]['name'],
                              style: ktextStyleMovieName),
                          Table(
                            columnWidths: {
                              0: FractionColumnWidth(0.4),
                              1: FractionColumnWidth(0.6)
                            },
                            children: [
                              TableRow(children: [
                                Text('Name', style: ktextStyleHint),
                                Text(result.data['movies'][index]['name'],
                                    style: ktextStyleName),
                              ]),
                              TableRow(children: [
                                Text('Genre', style: ktextStyleHint),
                                Text(result.data['movies'][index]['genre'],
                                    style: ktextStyleName),
                              ]),
                              TableRow(children: [
                                Text('Actor', style: ktextStyleHint),
                                Text(
                                    result.data['movies'][index]['actor']
                                        ['name'],
                                    style: ktextStyleName),
                              ]),
                            ],
                          ),
                        ]),
                  ));
            });
      },
    );
  }
}
