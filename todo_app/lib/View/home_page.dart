import 'package:flutter/material.dart';

import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() =>_MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget>{
  List todoList=[
    ['Prepare for Exams',false],
    ['Learn Flutter',false],
    ['Learn to Cook',false],
  ];

  final _textController= TextEditingController();

  void checkBoxChanged(bool? value,int index){
    setState((){
    todoList[index][1]=!todoList[index][1];
    });
  }

  void onSave(){
    setState(() {
      todoList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
  }

  //adding new task
  void newTask(){
    showDialog(context: context, builder: (context){
      return Dialog_box(
        controller: _textController,
        onSave: onSave,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    }
     );
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar:AppBar(
         backgroundColor: Colors.black,
          title: Text('Todo App'),
          ),

       body:SingleChildScrollView(
            physics: ScrollPhysics(),
            child:Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.redAccent.shade100,// foreground
                  fixedSize: Size(150, 60)
               ),
               onPressed: newTask,
               child: Text('Add Task'),
           ),
            ),
           ListView.builder(
             shrinkWrap: true,
             itemCount: todoList.length,
             itemBuilder:(context,index){
               return todoTile(title: todoList[index][0],
                   status: todoList[index][1],
                   onChanged: (value)=>checkBoxChanged(value,index),
                   remove: (context)=>deleteTask(index)
               );
             },
           ),

         ],
       )
       )
   );
  }
}

