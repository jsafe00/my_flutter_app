import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/third_screen.dart';

 void main(){
  runApp(new SecondScreen());
}


class SecondScreen extends StatefulWidget {
    @override
  _ApplicationState createState() => new _ApplicationState();

}

class _ApplicationState extends State<SecondScreen>  {
 

  String text = '';

  @override
  void initState() {
    text = 'Click on this button';
    super.initState();
  }

  void changedText(){
    setState((){
      text = 'The text is being changed.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(text),
                  onPressed: () {
                    changedText();
                },
              ),
              SizedBox(height: 20), 
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
