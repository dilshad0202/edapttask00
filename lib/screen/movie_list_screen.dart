
import 'package:edapt_task/providers/read_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayDataProvider>(
      builder: (context,provider,child)=>
           Scaffold(
             backgroundColor: Colors.grey[200],
          body: provider.displayData()),
    );
  }
}
