import 'package:flutter/material.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';
import '../utils/my_button.dart';
import '../data/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget> {
  final _textController = TextEditingController();
  List todoList = [
    ['Prepare for Exams', false],
    ['Learn Flutter', false],
    ['Learn to Cook', false],
  ];
  @override
  void initState() {
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
    updateData();
  }

  void updateData() {
    todoList.add('TODOLIST');
  }

  void onSave() {
    setState(() {
      todoList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
    updateData();
  }

  //adding new task
  void newTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_box(
            controller: _textController,
            onSave: onSave,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Todo App'),
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                MyButton(
                  text: 'Add Task',
                  onPressed: newTask,
                ),
                MyButton(
                    text: 'Display Tasks',
                    onPressed: () async {
                      var response = await BaseClient().get('todos.json');
                      if (response == null) return;
                      print('Successful');
                    }),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return todoTile(
                        title: todoList[index][0],
                        status: todoList[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                        remove: (context) => deleteTask(index));
                  },
                ),
              ],
            )));
  }
}
