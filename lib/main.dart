import 'package:flutter/material.dart';
import 'package:hackreactonary/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackReactionary Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'HackReactionary'),
    );
  }
}

