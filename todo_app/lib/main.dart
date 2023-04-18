import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './View/home_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('MyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
