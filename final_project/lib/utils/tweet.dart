import 'package:flutter/material.dart';

class NewTweet extends StatefulWidget {
  @override
  _NewTweetState createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("NewTweet")),
    ));
  }
}
