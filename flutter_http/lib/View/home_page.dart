import 'package:flutter/material.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';
import '../utils/my_button.dart';
import '../data/http.dart';
import 'package:uuid/uuid.dart';
import '../data/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget> {
  final _textController = TextEditingController();
  final _dateController = TextEditingController();
  List<dynamic> todoList = [];
  @override
  void initState() {
    super.initState();
  }

  void onSave() async {
    var uuid = Uuid();
    var id = uuid.v4().toString();
    Object todo = {
      id: {'title': _textController.text, 'date': _dateController.text}
    };
    var response = await BaseClient().post('todos.json', todo);
    if (response == null) return;
    print('Successful');
    print(response);
    Navigator.of(context).pop();
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_box(
            taskcontroller: _textController,
            datecontroller: _dateController,
            onSave: onSave,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // void deleteTask(int index) {
  //   setState(() {
  //     todoList.removeAt(index);
  //   });
  //   updateData();
  // }

  void getTasks() async {
    var response = await BaseClient().get('todos.json');
    setState(() {
      todoList = response;
    });
    print(todoList);
    if (response == null) return;
    print('Successful');
    print("end of get task");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Weekly Planner'),
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: 'Add Task',
                  onPressed: newTask,
                ),
                MyButton(text: 'Show Weekly Tasks', onPressed: getTasks),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return todoTile(
                        title: todoList[index][0], date: todoList[index][1]);
                  },
                ),
              ],
            )));
  }
}
