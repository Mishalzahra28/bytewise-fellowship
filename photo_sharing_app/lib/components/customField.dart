import 'package:flutter/material.dart';
import './size_config.dart';

class customField extends StatelessWidget {
  final String text;
  const customField({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25.0)),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100)),
          fillColor: Colors.grey.shade50,
          filled: true,
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
