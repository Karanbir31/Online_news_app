import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/navigations/nav_routes.dart';
import 'package:news_app/news_details/news_details.dart';
import 'package:news_app/news_details/news_details_binding.dart';

import 'home_page/presentation/news_home.dart';
import 'home_page/presentation/news_home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NavRoutes.initialRoute,

      getPages: [
        GetPage(
          name: NavRoutes.newsHomeRoute,
          page: () => NewsHome(),
          binding: NewsHomeBinding(),
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
        ),
        GetPage(
          name: NavRoutes.newsDetailsRoute,
          page: () => NewsDetails(),
          binding: NewsDetailsBinding(),
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
        ),
      ],
    );
  }
}
