import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{

  List todoList=[];
  final _myBox=Hive.box('MyBox');
  void createInitData(){
    List todoList=[
      ['Prepare for Exams',false],
      ['Learn Flutter',false],
      ['Learn to Cook',false],
    ];
  }

  void loadData(){
  todoList=_myBox.get("TODOLIST");
  }

  void updateData(){
  _myBox.put('TODOLIST',todoList);
  }

}