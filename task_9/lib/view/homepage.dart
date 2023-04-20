import 'dart:async';
import '../utils/crossFade.dart';
import 'package:flutter/material.dart';
import '../utils/TweenAnimate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cross Fade Animation"),
      ),
      body: Center(
          child: Column(
        children: [TweenAnimate(), CrossFade()],
      )),
    );
  }
}
