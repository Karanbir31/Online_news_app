import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page/ui_screen/news_home.dart';
import 'home_page/ui_screen/news_home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",

      getPages: [
        GetPage(
          name: "/home",
          page: () => NewsHome(),
          binding: NewsHomeBinding(),
        ),
      ],
    );
  }
}
