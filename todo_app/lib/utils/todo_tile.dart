import 'package:flutter/material.dart';

class todoTile extends StatelessWidget {
  final String title;
  final bool status;
  Function(bool?)? onChanged;
   todoTile({
    super.key,
    required this.title,
    required this.status,
    required this.onChanged
}) ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.teal.shade400,
          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
