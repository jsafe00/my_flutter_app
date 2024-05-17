import 'package:flutter/material.dart';
import 'app_drawer.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        drawer: AppDrawer(),
        body: Container(
          child: Text('Container Sample'),
          height: 300.0,
          width: 300.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
