import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
      body: Center(
        child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SecondScreen()));
        }, 
        child: Text("Go to next screen"),
          ),
        ),
      ),
    );
  }
}