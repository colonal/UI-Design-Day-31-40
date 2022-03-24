import 'dart:async';

import 'package:flutter/material.dart';

class Day39Screen extends StatefulWidget {
  const Day39Screen({Key? key}) : super(key: key);

  @override
  State<Day39Screen> createState() => _Day39ScreenState();
}

class _Day39ScreenState extends State<Day39Screen> {
  bool show = false;
  double opacity = 0;
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (opacity + 0.1 < 1.0) {
        opacity += 0.15;
      } else {
        opacity = 1;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC3A6),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 900),
                    tween: Tween<Offset>(
                        begin: const Offset(60, 0), end: Offset.zero),
                    builder: (context, Offset value, child) {
                      return Transform.translate(
                        offset: value,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 1000),
                          opacity: opacity,
                          child: Image.network(
                            'https://cdn.dribbble.com/users/115278/screenshots/16812737/media/93914b7224e59946c61b9dbde7542628.gif',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween<Offset>(
                    begin: Offset(0, MediaQuery.of(context).size.height * 0.1),
                    end: Offset.zero,
                  ),
                  onEnd: () => setState(() {
                        show = true;
                      }),
                  child: !show
                      ? Container()
                      : TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 500),
                          tween: Tween<Offset>(
                              begin: Offset(
                                  0, MediaQuery.of(context).size.height * 0.1),
                              end: Offset.zero),
                          builder: (context, Offset value, child) {
                            return Transform.translate(
                              offset: value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Discover the best \norganic asian tea.🔥',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Stright from motherland ⛰',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: MaterialButton(
                                      child: const Text(
                                        'EXPLORE NOW ☕️',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                  builder: (context, Offset value, child) {
                    return Transform.translate(
                      offset: value,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: child,
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
