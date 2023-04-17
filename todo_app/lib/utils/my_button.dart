import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  late final String text;
  VoidCallback onPressed;
  MyButton({super.key,
  required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: MaterialButton(
          onPressed: onPressed,
          color: Colors.redAccent.shade100,
          child: Text(text,
            style: TextStyle(color: Colors.white),
          ),
          minWidth:100,
          height: 45,
      ),
    );

  }


}