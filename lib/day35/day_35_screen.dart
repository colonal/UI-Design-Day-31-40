import 'package:flutter/material.dart';

class Day35Screen extends StatefulWidget {
  const Day35Screen({Key? key}) : super(key: key);

  @override
  State<Day35Screen> createState() => _Day35ScreenState();
}

class _Day35ScreenState extends State<Day35Screen>
    with SingleTickerProviderStateMixin {
  List images = [
    "https://i.pinimg.com/564x/7a/62/46/7a624675b8fed6db6c257fdc6169fba5.jpg",
    "https://i.pinimg.com/564x/23/8c/bb/238cbbe2e835479e9073dd18d2784be8.jpg",
    "https://i.pinimg.com/236x/fb/55/9a/fb559aee7b68b87895ae8ad4a650988c.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) => buildPageitme(context, index)),
    );
  }

  buildPageitme(context, int index) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        buildImage(size, index),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Modern Furniture",
                style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder(
                  duration: const Duration(seconds: 1),
                  tween: Tween<Offset>(
                      begin: const Offset(0, -20), end: Offset.zero),
                  builder: (context, Offset value, child) {
                    return Transform.translate(
                      offset: value,
                      child: Text(
                        "Choos From Thousands Of Items That Fits Your Choice",
                        style: TextStyle(color: Colors.grey[400], fontSize: 20),
                      ),
                    );
                  }),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 45,
                  width: 180,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 181, 102, 0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(color: Colors.grey[300], fontSize: 16),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(right: 10, bottom: 3),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white12,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        )
      ],
    );
  }

  TweenAnimationBuilder<double> buildImage(Size size, int index) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 2),
      tween: Tween(begin: 1, end: 1.1),
      builder: (ctx, value, child) {
        debugPrint("$value");
        return Transform.scale(
          scale: value,
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(images[index]), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.2),
                    Colors.grey.withOpacity(0.1),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
