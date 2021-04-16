import 'package:edapt_task/providers/read_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:edapt_task/providers/graphql_data.dart';
import 'package:edapt_task/screen/movie_list_screen.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLconfiguration>(
            create: (context) => GraphQLconfiguration()),
        ChangeNotifierProvider<DisplayDataProvider>(
            create: (context) => DisplayDataProvider())
      ],
      child: Consumer<GraphQLconfiguration>(
        builder: (context, graphql, child) => GraphQLProvider(
          client: graphql.client,
          child: CacheProvider(
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(),
                home: MovieListScreen()),
          ),
        ),
      ),
    );
  }
}
