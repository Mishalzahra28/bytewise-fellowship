import 'package:flutter/material.dart';

import '../../utils/tweet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewTweet()));
          },
          child: Image.asset(
            "lib/assets/newtweet.png",
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("HomeScreen")),
        ));
  }
}
