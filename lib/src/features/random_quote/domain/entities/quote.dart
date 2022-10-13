import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final int id;
  final String content;
  final String permalink;

  Quote(
      {required this.author,
      required this.id,
      required this.content,
      required this.permalink});

  @override
  List<Object?> get props => [
    author,
    id,
    content,
    permalink,
  ];
}
/*
{"author":"Robert Sewell","id":41,"quote":"If Java had true garbage collection,
 most programs would delete themselves upon execution.",
 "permalink":"http://quotes.stormconsultancy.co.uk/quotes/41"}
 */
