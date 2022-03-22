import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './images.dart';

class Day37Screen extends StatefulWidget {
  const Day37Screen({Key? key}) : super(key: key);

  @override
  State<Day37Screen> createState() => _Day37ScreenState();
}

class _Day37ScreenState extends State<Day37Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover \nToday's Posts 🔥",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade700,
                            ),
                            border: InputBorder.none,
                            hintText: "Classic Style",
                            hintStyle: TextStyle(color: Colors.grey.shade500)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade600,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "Popular",
                  ),
                  Tab(
                    text: "New",
                  ),
                  Tab(
                    text: "Classic",
                  ),
                  Tab(
                    text: "Stylish",
                  )
                ],
              ),
              Expanded(
                // height: 200,
                child: TabBarView(
                  children: [
                    popularTap(),
                    const Center(),
                    const Center(),
                    const Center(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  MasonryGridView popularTap() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.black,
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
