import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String contentText;
  String authorName;
  List<String> tagsText;

  SecondScreen({Key? key, required this.contentText, required this.authorName, required this.tagsText }) 
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
            contentText,
            style: TextStyle(fontSize: 20),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.bottomRight, 
              child: Text(
                " - $authorName", style: TextStyle(fontSize: 15),
              )
            )),
          Text(tagsText.join(',')),
        ]),
      ),
    );
  }
}