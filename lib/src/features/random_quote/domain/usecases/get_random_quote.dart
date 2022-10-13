import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/core/usecases/usecases.dart';

import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote,NoParams>{
    final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  // we use call to make it in general
  // Future<Either<Failure,Quote>>? execute(){
  //   return null;
  // }
  // if no parms
  //

  @override
  Future<Either<Failure, Quote>> call(NoParams params) => quoteRepository.getRandomQuote();

  // @override
  // Future<Either<Failure, Quote>> call(LoginParams params) {
  //   return quoteRepository.get(params.userName);
  // }

}
// class LoginParams extends Equatable {
//   final String userName;
//   final String password;
//   const LoginParams({required this.userName, required this.password,});
//   @override
//   List<Object?> get props => [userName,password ];
//
// }