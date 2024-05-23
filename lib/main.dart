import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList()
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Haruki Murakami Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}

