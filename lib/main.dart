import 'package:flutter/material.dart';
import '../day31/day_31_screen.dart';
import 'custom_scroll_behavior.dart';
import 'day32/day_32_screen.dart';
import 'day33/day_33_screen.dart';
import 'day34/day_34_screen.dart';

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
