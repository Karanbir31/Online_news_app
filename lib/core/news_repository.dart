import 'package:dio/dio.dart';
import 'package:news_app/home_page/modules/news.dart';
import 'api_service/APIService .dart';

// GET https://newsapi.org/v2/everything
// GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=APIKEY
//GET https://newsapi.org/v2/everything?q=apple&from=2025-08-16&to=2025-08-16&sortBy=popularity&apiKey=APIKEy

class NewsRepository {
  final Dio _dio = APIService.dio;

  /// Get everything
  Future<NewsApiResponse> getEverything() async {
    try {
      final response = await _dio.get(
        "everything",
          queryParameters: {
            "q" : "bitcoin",
            "pageSize": 20
          }
      );
      return NewsApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

/// Get everything with a query
  Future<NewsApiResponse> getEverythingWithQuery({String query = "apple"}) async {
    try {
      final response = await _dio.get(
        "everything",
        queryParameters: {
          "q" : query
        }
      );
      return NewsApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Get top headlines for a given country
  Future<NewsApiResponse> getTopHeadlines({String country = "us"}) async {
    try {
      final response = await _dio.get(
        "top-headlines",
        queryParameters: {"country": country},
      );
      return NewsApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Get headlines by category (business, sports, etc.)
  Future<NewsApiResponse> getHeadlinesByCategory({
    String country = "us",
    required String category,
  }) async {
    try {
      final response = await _dio.get(
        "top-headlines",
        queryParameters: {"country": country, "category": category},
      );
      return NewsApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Get headlines by search query (e.g. "trump")
  Future<NewsApiResponse> getHeadlinesByQuery({
    String country = "us",
    required String query,
  }) async {
    try {
      final response = await _dio.get(
        "top-headlines",
        queryParameters: {"country": country, "q": query},
      );
      return NewsApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Private helper to log DioExceptions (optional)
  void _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        print("Connection Timeout: ${e.message}");
        break;
      case DioExceptionType.receiveTimeout:
        print("Receive Timeout: ${e.message}");
        break;
      case DioExceptionType.badResponse:
        print("Bad Response [${e.response?.statusCode}]: ${e.response?.data}");
        break;
      default:
        print("Unexpected error: ${e.message}");
    }
  }
}
