import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/news_details/news_details_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends GetView<NewsDetailsController> {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final String targetUrl = arguments['data'];

    if(targetUrl.isNotEmpty ){
      controller.updateTargetUrl(url: targetUrl);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
        ],
      ),

      body: SafeArea(
        child: GetBuilder<NewsDetailsController>(
          builder: (controller) {
            return WebViewWidget(
              controller: controller.webViewController,
              layoutDirection: TextDirection.ltr,
            );
          },

        ),
      ),
    );
  }
}
