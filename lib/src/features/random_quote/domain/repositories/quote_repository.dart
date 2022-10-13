
import 'package:dartz/dartz.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';

abstract class QuoteRepository{
  Future<Either<Failure,Quote>> getRandomQuote();
}