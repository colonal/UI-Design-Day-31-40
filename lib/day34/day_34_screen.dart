import 'package:flutter/material.dart';

class Day34Screen extends StatefulWidget {
  const Day34Screen({Key? key}) : super(key: key);

  @override
  State<Day34Screen> createState() => _Day34ScreenState();
}

class _Day34ScreenState extends State<Day34Screen> {
  late PageController _pageController;
  int selectPage = 0;
  List images = [
    'https://images.unsplash.com/photo-1525457136159-8878648a7ad0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHdpbnRlciUyMGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1549902529-a515e31f0c1c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHdpbnRlciUyMGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1611080922224-2e0c006a4943?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/flagged/photo-1574876668890-2ff765c77cda?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU3fHx3aW50ZXIlMjBjbG90aGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1575919988855-f727358015b4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fHdpbnRlciUyMGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  ];
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Collection",
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Winter 2021",
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 10,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 3),
                                itemBuilder: (__, index) =>
                                    buildCountSelect(index)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectPage < images.length - 1) ++selectPage;
                            });
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (int indexSelect) {
                  setState(() {
                    selectPage = indexSelect;
                  });
                },
                itemBuilder: (context, index) => buildImagePage(selectPage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCountSelect(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: selectPage == index ? 40 : 20,
      height: 10,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: selectPage == index ? Colors.grey[800] : Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  buildImagePage(int index) {
    return Image.network(
      images[index],
      fit: BoxFit.cover,
    );
  }
}
