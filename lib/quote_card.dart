import 'package:flutter/material.dart';
import 'quote.dart';
import 'main.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final VoidCallback delete;
  final Function(Quote) edit;

  QuoteCard({required this.quote, required this.delete, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
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
              SizedBox(height: 6.0),
              Text(
                quote.book,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: delete,
                    icon: Icon(Icons.delete),
                    label: Text('delete quote'),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final editedQuote = await Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) => QuoteForm(quote: quote),
                        ),
                      );
                    if (editedQuote != null) {
                      edit(editedQuote);
                    }
                  },
                  icon: Icon(Icons.edit),
                  label: Text('edit quote'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
