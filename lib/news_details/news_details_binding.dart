import 'package:get/get.dart';
import 'package:news_app/news_details/news_details_controller.dart';

class NewsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsDetailsController());
  }
}
