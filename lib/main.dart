import 'package:flutter/material.dart';
import 'natasha.dart';

void main() => runApp(MaterialApp(
  home: MarvelCard(),
    routes: {
      '/natashaCard': (context) => NatashaCard(),
      '/marvelCard': (context) => MarvelCard(),
    },
));

class MarvelCard extends StatefulWidget {
  @override
  State<MarvelCard> createState() => _MarvelCardState();
}

class _MarvelCardState extends State<MarvelCard> {
  int marvelLevel = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Captain Marvel',
          style: TextStyle(
            color: Colors.white, // Set the text color here
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
                heroTag: 'addButton',
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
                heroTag: 'subtractButton',
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
                heroTag: 'forwardButton',
                onPressed: () {
                  Navigator.pushNamed(context, '/natashaCard');
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
                  backgroundImage: AssetImage('assets/Captain_Marvel.png'),
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
                'Carol Danvers',
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
                      'caroldanvers@marvel.com',
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
