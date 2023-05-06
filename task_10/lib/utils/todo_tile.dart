import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String title;
  final bool status;
  Function(bool?)? onChanged;
  Function(BuildContext)? remove;
   todoTile({
    super.key,
    required this.title,
    required this.status,
    required this.onChanged,
    required this.remove,
}) ;


  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
    child:Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: remove,
            icon: Icons.delete ,
            backgroundColor: Colors.redAccent.shade100,
          )
        ],
      ),
         child: Container(
          decoration: BoxDecoration(
            color:Colors.teal.shade400,
          ),
          padding: const EdgeInsets.all(20.0),
          child:Row(
            children: [
              Checkbox(value: status, onChanged: onChanged, checkColor: Colors.black, fillColor:MaterialStateProperty.resolveWith ((Set  states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white.withOpacity(.32);
                }
                return Colors.white;
              }) ,),
              Text(title,
              style: TextStyle(color: Colors.white,
              decoration: status ? TextDecoration.lineThrough : TextDecoration.none,
              )
              ),
            ],
          ),

        ),
      ),
    );
  }
}
