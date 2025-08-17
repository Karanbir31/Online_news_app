

import 'package:get/get.dart';
import 'package:news_app/home_page/news_controller.dart';

class NewsHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> NewsController());
  }
  
}