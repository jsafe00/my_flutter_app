import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList()
));

class QuoteList extends StatefulWidget {
   const QuoteList({super.key});

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
    Quote(book: 'After Dark',
          text: 'It is my motto for life. - Walk slowly; drink lots of water.'),
    Quote(book: 'What I Talk About When I Talk About Running',
          text: 'I run, therefore I am.'),    
  ];

  void _addQuote(Quote quote) {
    setState(() {
      quotes.add(quote);
    });
  }

  void _editQuote(Quote oldQuote, Quote newQuote) {
    setState(() {
      int index = quotes.indexOf(oldQuote);
      if (index != -1) {
        quotes[index] = newQuote;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Haruki Murakami Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          },
          edit: (newQuote) {
            _editQuote(quote, newQuote);
          },
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newQuote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuoteForm()),
          );
          if (newQuote != null) {
            _addQuote(newQuote);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
class QuoteForm extends StatelessWidget {
  final Quote? quote;

  QuoteForm({this.quote});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _bookController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (quote != null) {
      _textController.text = quote!.text;
      _bookController.text = quote!.book;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quote == null ? 'Add Quote' : 'Edit Quote'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Quote Text'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quote';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bookController,
                decoration: InputDecoration(labelText: 'Book Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      Quote(
                        text: _textController.text,
                        book: _bookController.text,
                      ),
                    );
                  }
                },
                child: Text(quote == null ? 'Add Quote' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
