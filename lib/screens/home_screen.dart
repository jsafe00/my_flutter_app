import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  List<String> tagsText = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quote Generator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                quote,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  " - $author",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                ' ${tagsText.join(', ')}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var url = Uri.parse('https://api.quotable.io/random');
                  var response = await http.get(url);
                  var data = jsonDecode(response.body);

                  setState(() {
                    quote = data["content"];
                    author = data["author"];
                    tagsText = List<String>.from(data["tags"]);
                  });
                },
                child: Text("Get Quote!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
