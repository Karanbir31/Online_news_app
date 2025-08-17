import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/news_controller.dart';

class NewsHome extends GetView<NewsController> {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Main AppBar
            SliverAppBar(
              title: const Text("News App"),
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Get.toNamed("/news_details");
                  },
                ),
              ],
            ),

            // Categories
            SliverAppBar(
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => ChoiceChip(
                          label: Text(controller.categories[index]),
                          selected:
                              index == controller.selectedCategoryIndex.value,
                          onSelected: (_) {
                            if (index ==
                                controller.selectedCategoryIndex.value) {
                              controller.updateSelectedCategoryIndex(idx: -1);
                            } else {
                              controller.updateSelectedCategoryIndex(
                                idx: index,
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            //  Trending News Section
            _sectionHeader(
              "Trending",
              onSeeAll: () {
                controller.readTopHeadlines();
              },
            ),
            SliverToBoxAdapter(child: _trendingNewsList()),

            //  Latest News Section
            _sectionHeader(
              "Latest",
              onSeeAll: () {
                controller.readLatestNews();
              },
            ),
            _latestNewsList(),
          ],
        ),
      ),
    );
  }

  ///  Reusable Section Header (Trending / Latest)
  static SliverToBoxAdapter _sectionHeader(
    String title, {
    VoidCallback? onSeeAll,
  }) {
    return SliverToBoxAdapter(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: onSeeAll,
              child: const Text(
                "see all",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///  Trending News List (Horizontal)
  Widget _trendingNewsList() {
    return SizedBox(
      height: Get.height * 0.3,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.topHeadlines.value?.articles.length ?? 0,
          itemBuilder: (context, index) => Container(
            width: Get.width * 0.9,
            margin: const EdgeInsets.all(8),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    controller.topHeadlines.value?.articles[index].urlToImage ??
                        "https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg",
                    fit: BoxFit.fill,
                    width: Get.width * 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4),
                  child: Text(
                    controller.topHeadlines.value?.articles[index].title ??
                        "Some important news headline you can replace this with some test news",
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 12, backgroundColor: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        controller
                                .topHeadlines
                                .value
                                ?.articles[index]
                                .source
                                .name ??
                            "BCC News",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.watch_later_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("4 hrs ago", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Latest News List (Vertical)
  SliverList _latestNewsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Obx(
          () => Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    controller.allNews.value?.articles[index].urlToImage ??
                        "https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg",
                    fit: BoxFit.fill,
                    height: 84,
                    width: 84,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.allNews.value?.articles[index].title ??
                            "Some important news headline you can replace this with some test news",
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              controller
                                      .allNews
                                      .value
                                      ?.articles[index]
                                      .source
                                      .name ??
                                  "BCC News",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.watch_later_outlined, size: 16),
                            SizedBox(width: 4),
                            Text("4 hrs ago", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: controller.allNews.value?.articles.length ?? 0),
    );
  }
}
