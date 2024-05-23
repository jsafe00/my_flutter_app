import 'package:flutter/material.dart';
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Haruki Murakami Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => Text('${quote.text} - ${quote.book}')).toList(),
      )
    );
  }
}

