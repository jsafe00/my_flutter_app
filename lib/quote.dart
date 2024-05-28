class Quote {
  String text;
  String book;

  Quote({required this.text, required this.book});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['attributes']['text'],
      book: json['relationships']['book']['data']['title'],
    );
  }
}
