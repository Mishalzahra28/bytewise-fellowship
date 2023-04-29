import 'package:flutter/material.dart';
import '../../components/size_config.dart';
import './components/body.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trending Pictures"),
        ),
        backgroundColor: Colors.black,
        body: Body());
  }
}
