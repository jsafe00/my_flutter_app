import 'package:flutter/material.dart';

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
          ),
          ListTile(
            title: Text('Page 2'),
            trailing: Icon(Icons.arrow_forward),
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
