import 'package:flutter/material.dart';
import 'package:hackreactonary/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  // this method is defined in an ancestor class, but 
  // is redefined here to do something else
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackReactonary Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'HackReactonary'),
    );
  }
}

