import 'dart:convert';

import 'package:quotes/src/core/error/exceptions.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if(jsonString != null){
      final cacheRandomQuote = Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(AppStrings.cachedRandomQuote, json.encode(quoteModel));
  }
}
