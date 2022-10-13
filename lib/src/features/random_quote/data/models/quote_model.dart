import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel(
      {required String author,
      required int id,
      required String quote,
      required String permalink})
      : super(
          author: author,
          id: id,
          content: quote,
          permalink: permalink,
        );
  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
      author: json['author'],
      id: json['id'],
      quote: json['quote'],
      permalink: json['permalink']);
  Map<String, dynamic> toJson() =>
      {'author': author, 'id': id, 'quote': content, 'permalink': permalink};
}
