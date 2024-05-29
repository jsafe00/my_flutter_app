import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'quote.dart';
import 'dart:io';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

String get baseUrl {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8081/api/v1/quotes';
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:8081/api/v1/quotes';
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}

Future<void> fetchQuotes() async {
  final response = await http.get(Uri.parse(baseUrl));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> data = jsonData['data']['data'];
    setState(() {
      quotes = data.map((json) => Quote.fromJson(json)).toList();
      isLoading = false;
    });
  } else {
    throw Exception('Failed to load quotes');
  }
}

  Widget quoteTemplate(Quote quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0,16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              quote.book,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800]
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Haruki Murakami Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: quotes.map((quote) => quoteTemplate(quote)).toList(),
            ),
    );
  }
}
