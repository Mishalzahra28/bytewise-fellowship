import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';
import '../data/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() =>_MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget>{
  final _myBox=Hive.box('MyBox');
  TodoDataBase db=TodoDataBase();
  final _textController= TextEditingController();
  @override
  void initState(){
    if(_myBox.get("TODOLIST")==null){
      db.createInitData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }


  void checkBoxChanged(bool? value,int index){
    setState((){
    db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updateData();
  }

  void onSave(){
    setState(() {
      db.todoList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
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
      db.todoList.removeAt(index);
    });
    db.updateData();
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
             itemCount: db.todoList.length,
             itemBuilder:(context,index){
               return todoTile(title: db.todoList[index][0],
                   status: db.todoList[index][1],
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

