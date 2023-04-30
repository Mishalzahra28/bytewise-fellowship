import 'package:flutter/material.dart';
import './size_config.dart';

class customField extends StatelessWidget {
  final String text;
  final controller;
  final keyboardType;
  final bool hidden;
  const customField(
      {Key? key,
      required this.text,
      required this.controller,
      required this.keyboardType,
      required this.hidden})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: hidden,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200)),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
    );
  }
}
