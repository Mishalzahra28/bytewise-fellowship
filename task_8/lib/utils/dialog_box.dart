import 'package:flutter/material.dart';

class Dialog_box extends StatelessWidget {
  String message;
  Dialog_box({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(height: 140, child: Text(message)));
  }
}
