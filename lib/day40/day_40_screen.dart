import 'package:flutter/material.dart';

class Day40Screen extends StatefulWidget {
  const Day40Screen({Key? key}) : super(key: key);

  @override
  State<Day40Screen> createState() => _Day40ScreenState();
}

class _Day40ScreenState extends State<Day40Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6DDC9),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAnimation(
              duration: const Duration(milliseconds: 600),
              beginDy: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/images/Day40/1.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const MyAnimation(
              duration: Duration(milliseconds: 1000),
              child: Text(
                'Learning code is\nnow more easy',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyAnimation(
              duration: const Duration(milliseconds: 1000),
              child: Text(
                'Are you ready to learn Languages\neasily in the funniest way?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const Spacer(),
            MyAnimation(
              duration: const Duration(milliseconds: 1500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class MyAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double beginDy;
  const MyAnimation(
      {required this.child, Duration? duration, double? beginDy, Key? key})
      : duration = duration ?? const Duration(milliseconds: 1000),
        beginDy = beginDy ?? 40,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<Offset>(begin: Offset(0, beginDy), end: Offset.zero),
      child: child,
      builder: (context, Offset value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
    );
  }
}
