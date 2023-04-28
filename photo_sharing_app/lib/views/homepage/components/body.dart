import 'package:flutter/material.dart';
import 'package:photo_sharing_app/views/homepage/homepage.dart';
import '../../../components/size_config.dart';
import '../../../components/customButton.dart';
import '../../../components/customField.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: Text(
        'Homepage',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
