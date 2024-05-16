import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_flutter_app/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
      body: Center(
        child: ElevatedButton(
        onPressed: () async {
          var url = Uri.parse(
              'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
          var response = await http.get(url);
          var data = jsonDecode(response.body);

          String content = data["content"];
          String author = data["author"];
          List<dynamic> tags = data["tags"];

          List<String> tagsList = tags.map((tag) => tag.toString()).toList();

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => 
              SecondScreen(
                contentText: content, 
                authorName: author,
                tagsText: tagsList,
            ))
          );
        }, 
        child: Text("Get Quote!"),
          ),
        ),
      ),
    );
  }
}