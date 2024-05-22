import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
       backgroundColor: Colors.grey[200], // Set the background color for the entire body
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center children vertically
          children: <Widget>[
            Image.asset(
              'assets/asset-2.avif',
              width: 500.0,  // Set desired width
              height: 500.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min, // Center the row's children
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    print('You clicked me');
                  },
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  label: Text('mail me'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                ),
                SizedBox(width: 10), // Add space between the buttons
                ElevatedButton.icon(
                  onPressed: () {
                    print('You clicked me too');
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: Text('send'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Clicked');
        },
        child: Text('Home'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
