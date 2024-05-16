import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Row(children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),

          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
          ),
        ],)
      );
  }
}