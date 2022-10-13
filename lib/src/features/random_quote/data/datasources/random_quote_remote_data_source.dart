
import 'dart:convert';

import 'package:quotes/src/core/api/end_points.dart';
import 'package:quotes/src/core/error/exceptions.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

import '../models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource{
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  http.Client client;
  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuotesUrl = Uri.parse(Endpoints.randomQuote);
  final response = await client.get(randomQuotesUrl,headers: {
    AppStrings.contentType : AppStrings.applicationJson,
  });
  if(response.statusCode == 200){
    return QuoteModel.fromJson(json.decode(response.body));
  }else{
    throw ServerException();
  }
  }


}