import 'package:flutter/material.dart';
import 'main.dart';

class NatashaCard extends StatefulWidget {
  @override
  State<NatashaCard> createState() => _NatashaCard();
}

class _NatashaCard extends State<NatashaCard> {
  int marvelLevel = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Black Widow',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Padding around the column
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10, bottom: 0), // Padding below the add button
              child: FloatingActionButton(
                heroTag: 'addButtonNatasha',
                onPressed: () {
                  setState(() {
                    marvelLevel += 1;
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.grey[500],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0), // Padding above the subtract button
              child: FloatingActionButton(
                heroTag: 'subtractButtonNatasha',
                onPressed: () {
                  setState(() {
                    marvelLevel -= 1;
                  });
                },
                child: Icon(Icons.remove),
                backgroundColor: Colors.grey[500],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                heroTag: 'backButton',
                onPressed: () {
                  Navigator.pushNamed(context, '/marvelCard');
                },
                child: Icon(Icons.arrow_forward),
                backgroundColor: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Black_Widow.jpeg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Natasha Romanoff',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT MARVEL LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$marvelLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'blackwidow@marvel.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ]
            )
          ],
        )
      ),
    );
  }
}
