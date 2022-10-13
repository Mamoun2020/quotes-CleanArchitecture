import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/src/core/network/network_info.dart';
import 'package:quotes/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes/src/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes/src/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  //Blocs  when use it every once we will call a cubit, so we make register when use it
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  //Use Cases
  // when call init ,we will crate instance form it, not care about use it or not
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));
  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));
  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl(client: sl()));
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
