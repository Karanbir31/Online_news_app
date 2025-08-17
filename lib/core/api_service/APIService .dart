import 'package:dio/dio.dart';

class APIService {
  APIService._privateConstructor();

  static final instance = APIService._privateConstructor();
  static final _baseUrl = "https://newsapi.org/v2/";

  static final _apiKey = "";


  static final dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Authorization': _apiKey,
        'Content-Type': 'application/json',

      }
    )
  );

  // why we include  'Content-Type': 'application/json',





}