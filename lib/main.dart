import 'package:flutter/material.dart';
import '../day31/day_31_screen.dart';
import 'custom_scroll_behavior.dart';
import 'day32/day_32_screen.dart';
import 'day33/day_33_screen.dart';
import 'day34/day_34_screen.dart';
import 'day35/day_35_screen.dart';
import 'day36/day_36_screen.dart';
import 'day37/day_37_screen.dart';
import 'day38/day_38_screen.dart';
import 'day39/day_39_screen.dart';
import 'day40/day_40_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day31Screen())),
                child: const Text("Day 31"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day32Screen())),
                child: const Text("Day 32"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day33Screen())),
                child: const Text("Day 33"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day34Screen())),
                child: const Text("Day 34"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day35Screen())),
                child: const Text("Day 35"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day36Screen())),
                child: const Text("Day 36"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day37Screen())),
                child: const Text("Day 37"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day38Screen())),
                child: const Text("Day 38"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day39Screen())),
                child: const Text("Day 39"),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day40Screen())),
                child: const Text("Day 40"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
