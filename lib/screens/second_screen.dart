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
        body: Column(children: [
          Text(contentText),
          Text(authorName),
          Text(tagsText.join(',')),
        ]),
      ),
    );
  }
}