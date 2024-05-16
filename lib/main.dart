import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          ),
        body: Image(
          image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
            ))));
  }
}
