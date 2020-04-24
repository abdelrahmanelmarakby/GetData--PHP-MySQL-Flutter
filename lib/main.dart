import 'package:api1/SecondScreen.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {'second': (context) => Second()},
    );
  }
}
