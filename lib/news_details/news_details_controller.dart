import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {
  String targetUrl = "https://pub.dev";
  late WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();

    webViewController = WebViewController()..loadRequest(Uri.parse(targetUrl));
    //why we use .. to call loadRequest
  }

  void updateTargetUrl({required String url}) {

    targetUrl = url;

    webViewController.loadRequest(Uri.parse(targetUrl));

    update();
  }
}
