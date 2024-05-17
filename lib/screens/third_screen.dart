import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/home_screen.dart';
import 'package:my_flutter_app/screens/fourth_screen.dart';
import 'package:my_flutter_app/screens/second_screen.dart';
import 'app_drawer.dart';


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        drawer: AppDrawer(),
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
                        MaterialPageRoute(builder: (context) => FourthScreen()),
                  );
                },
                child: Text("Go to fourth screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
