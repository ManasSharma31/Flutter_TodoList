import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/todey_main.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/module/taskdata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Taskdata>(
        create: (context) => Taskdata(),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: TodeyMain()));
  }
}
