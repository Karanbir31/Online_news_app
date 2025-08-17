import 'package:get/get.dart';

class NewsController extends GetxController {
  // Categories list
  final categories = ["Health", "Sports", "Business", "Tech", "World"];

  // Observable for selected index
  final RxInt selectedCategoryIndex = (-1).obs;

  void updateSelectedCategoryIndex({required int idx}) {
    selectedCategoryIndex.value = idx;
  }
}
