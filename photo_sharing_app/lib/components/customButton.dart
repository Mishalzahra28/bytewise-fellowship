import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const customButton({Key? key, required this.text, required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
