
import 'package:get/get.dart';
import 'package:news_app/home_page/controller/news_controller.dart';

class NewsHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> NewsController());
  }
  
}