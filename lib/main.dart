import 'package:flutter/material.dart';
import 'route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Initially display FirstPage
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


