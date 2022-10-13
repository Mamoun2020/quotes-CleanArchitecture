import 'package:dartz/dartz.dart';
import 'package:quotes/src/core/error/exceptions.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/core/network/network_info.dart';
import 'package:quotes/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes/src/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/src/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  QuoteRepositoryImpl({required this.networkInfo,required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource});
  /*
    if(is connected)
    {
    get data from api
    }else{
    get data from cache
    }
     */
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if(await networkInfo.isConnected){
      try{
        final remoteRandomQuote = await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
        final localCacheQuote = await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(localCacheQuote);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
  
}
