import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  late final String text;
  final VoidCallback onBtnPressed;
  CustomBtn({
    super.key,
    required this.text,
    required this.onBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: onBtnPressed,
          minWidth: 300,
          height: 52,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
