class Quote {
  int quoteId;
  String quote;
  int bookId;
  String book;

  Quote({
    required this.quoteId,
    required this.quote, 
    required this.bookId,
    required this.book
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteId: json['id'],
      quote: json['attributes']['text'],
      bookId: json['relationships']['book']['data']['id'],
      book: json['relationships']['book']['data']['title'],
    );
  }
}
