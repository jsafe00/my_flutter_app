import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/home_screen.dart';


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Go to Home screen"),
              ),
        ),
      ),
    );
  }
}