import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {
  //https://pub.dev/packages/webview_flutter/example
  WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse("https://pub.dev"));
}
