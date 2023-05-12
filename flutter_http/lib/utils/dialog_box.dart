import 'package:flutter/material.dart';
import 'package:flutter_http/utils/my_button.dart';

class Dialog_box extends StatelessWidget {
  final taskcontroller;
  final datecontroller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialog_box(
      {super.key,
      required this.taskcontroller,
      required this.datecontroller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: taskcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Task",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              TextField(
                controller: datecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Date",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ));
  }
}
