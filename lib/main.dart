import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'quote.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override

  List<Quote> quotes = [
    Quote(book: 'What I Talk About When I Talk About Running',
          text: 'To keep on going, you have to keep up the rhythm.'),
    Quote(book: 'What I Talk About When I Talk About Running',
          text: 'I will be happy if running and I can grow old together.'), 
    Quote(book: 'What I Talk About When I Talk About Running',
          text: 'You have to wait until tomorrow to find out what tomorrow will bring.'),     
  ];

  Widget quoteTemplate(quote){
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
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      )
    );
  }
}

