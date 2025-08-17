import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../news_controller.dart';

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
            // 🔹 Main AppBar with title & search
            SliverAppBar(
              title: Text("News App"),
              floating: true,
              snap: true,

              actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
            ),

            // 🔹 Second AppBar for categories
            // if we wrap obx other than return  it crashes
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
                    separatorBuilder: (_, __) => SizedBox(width: 8),
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

            // 🔹 Top Headlines
            SliverToBoxAdapter(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                alignment: Alignment.center,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Trending news horizontal scrolling list
            SliverToBoxAdapter(
              child: SizedBox(
                height: (Get.height * 0.3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: 5,

                  itemBuilder: (context, index) => Container(
                    width: (Get.width * 0.8),
                    margin: EdgeInsets.all(8),

                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Expanded(
                          child: Image(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg",
                            ),
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                            width: (Get.width * 0.8),
                          ),
                        ),

                        Text(
                          "USA ",
                          style: TextStyle(fontSize: 14),
                          maxLines: 1,
                        ),

                        Text(
                          "Some important news headline you can replace this with some test news ",
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.red,
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "BCC News ",
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(Icons.watch_later_outlined),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  "4 hrs ago. ",
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 🔹 News Feed (vertical list)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text("News item $index"),
                  subtitle: Text("Details about news item $index"),
                );
              }, childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}


