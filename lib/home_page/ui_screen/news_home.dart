import 'package:flutter/material.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text("My News app"),
              toolbarHeight: 60,

              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column();
              }, childCount: 5),
            ),



          ],
        ),
      ),
    );
  }
}
