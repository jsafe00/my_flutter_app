class Quote {
  int id;
  String text;
  String book;

  Quote({
    required this.id,
    required this.text, 
    required this.book
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['attributes']['text'],
      book: json['relationships']['book']['data']['title'],
    );
  }
}
