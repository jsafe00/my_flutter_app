import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/home_screen.dart';
import 'package:my_flutter_app/screens/second_screen.dart';
import 'package:my_flutter_app/screens/third_screen.dart';
import 'package:my_flutter_app/screens/fourth_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Josafe Balili'),
            accountEmail: Text('saf@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black26,
              child: Text('M'),
            ),
            decoration: BoxDecoration(color: Colors.orange),
          ),
          ListTile(
            title: Text('Page 1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Page 2'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Page 3'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Page 4'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FourthScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
