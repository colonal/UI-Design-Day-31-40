import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api.dart';
import 'model.dart';

class Day31Screen extends StatefulWidget {
  const Day31Screen({Key? key}) : super(key: key);

  @override
  State<Day31Screen> createState() => _Day31ScreenState();
}

class _Day31ScreenState extends State<Day31Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Users> users = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List data = await API.getUser();

    for (var item in data) {
      users.add(Users.fromJson(item));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.grey))
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) => buildUserItme(users[index]),
            ),
    );
  }

  buildUserItme(Users user) {
    return InkWell(
      onTap: () {
        _launchURL(user.url).then((value) => null).onError((error, stackTrace) {
          debugPrint(error.toString());
          showInSnackBar(error.toString());
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 50,
                offset: const Offset(0, 40),
                spreadRadius: 1,
              )
            ]),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  user.url,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  Future<void> _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
