import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String title;
  final String date;
  Function(BuildContext)? remove;
  todoTile(
      {super.key,
      required this.title,
      required this.date,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: remove,
              icon: Icons.delete,
              backgroundColor: Colors.orangeAccent,
            )
          ],
        ),
        child: Container(
          width: 350,
          decoration: const BoxDecoration(
            color: Colors.indigo,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  date,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
