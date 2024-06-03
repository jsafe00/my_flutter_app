import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/quote.dart';
import 'package:my_flutter_app/utils/platform.dart';

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
  Map<int, String> books = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

Future<void> createQuote(String text, int bookId) async {
  final baseUrl = await getBaseUrl();
  final response = await http.post(
  Uri.parse('$baseUrl/quotes'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'quote': text, 
      'book_id': bookId
    }),
  );

  if (response.statusCode == 200) {
    fetchQuotes(); 
  } else {
    print('Failed to create quote: ${response.statusCode} ${response.body}');
    throw Exception('Failed to create quote');
  }
}

Future<void> showAddQuoteDialog() async {
  String text = '';
  int? selectedBookId;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Add Quote'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    text = value;
                  },
                  decoration: InputDecoration(labelText: 'Quote Text'),
                ),
                SizedBox(height: 16.0),
                DropdownButton<int>(
                  isExpanded: true,
                  value: selectedBookId,
                  hint: Text('Select Book'),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedBookId = newValue;
                    });
                  },
                  items: books.entries.map<DropdownMenuItem<int>>((entry) {
                    return DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (selectedBookId != null) {
                    createQuote(text, selectedBookId!);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> fetchQuotes() async {
  final baseUrl = await getBaseUrl();
  final response = await http.get(Uri.parse('$baseUrl/quotes'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> data = jsonData['data']['data'];
    setState(() {
      quotes = data.map((json) => Quote.fromJson(json)).toList();
      books = {for (var q in quotes) q.bookId: q.book};
      isLoading = false;
    });
  } else {
    throw Exception('Failed to load quotes');
  }
}

Future<void> deleteQuote(int id) async {
  final baseUrl = await getBaseUrl();
  final response = await http.delete(Uri.parse('$baseUrl/quotes/$id'));
  if (response.statusCode == 200) {
    fetchQuotes(); 
  } else {
    throw Exception('Failed to delete quotes');
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
              quote.quote,
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
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  print('Update');
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteQuote(quote.quoteId);
                  },
                ),
              ]
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
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
               showAddQuoteDialog();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
