import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Go back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text("Go to third screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
