import 'package:flutter/material.dart';
import 'package:todo_provider/models/Provider_data.dart';
import 'package:todo_provider/screens/task_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => taskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: task_screen(),
      ),
    );
  }
}
