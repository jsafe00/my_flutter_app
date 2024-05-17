import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/second_screen.dart';
import 'app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateless Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        drawer: AppDrawer(),
        body: Container(
          color: Colors.pink,
          child: Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(30.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen())
                  );
                },
                child: Text("Go to second screen"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}