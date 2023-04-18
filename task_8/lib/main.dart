import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './utils/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var logBox = await Hive.openBox('logBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Hive demo'),
    );
  }
}
