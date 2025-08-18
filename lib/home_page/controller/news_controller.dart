import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/news_repository.dart';
import 'package:news_app/home_page/modules/news.dart';

class NewsController extends GetxController {

  @override
  void onReady() {
    readLatestNews();
    readTopHeadlines();
    super.onReady();
  }

  final NewsRepository newsRepo = NewsRepository();

  // Categories list
  final categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];

  // Observable for selected index
  final RxInt selectedCategoryIndex = (-1).obs;

  final Rxn<NewsApiResponse> topHeadlines = Rxn<NewsApiResponse>();
  final Rxn<NewsApiResponse> allNews = Rxn<NewsApiResponse>();

  Future readLatestNews() async {
    try {
      var newsApiResponse = await newsRepo.getEverything();

      allNews.value = newsApiResponse;
    } catch (error) {
      debugPrint("Error in getTopHeadlines ${error}");
    }
  }

  Future readTopHeadlines() async {
    try {
      var newsApiResponse = await newsRepo.getTopHeadlines();

      topHeadlines.value = newsApiResponse;
    } catch (error) {
      debugPrint("Error in getTopHeadlines ${error}");
    }
  }

  void updateSelectedCategoryIndex({required int idx}) {
    selectedCategoryIndex.value = idx;
  }
}
