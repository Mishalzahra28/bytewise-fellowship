import 'package:flutter/material.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';
import '../utils/my_button.dart';
import '../data/http.dart';
import 'package:uuid/uuid.dart';
import '../data/http.dart';
import 'package:getwidget/getwidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget> {
  var _isLoading = false;
  final _textController = TextEditingController();
  final _dateController = TextEditingController();
  List<dynamic> todoList = [];
  @override
  void initState() {
    super.initState();
  }

  void onSave() {
    var uuid = Uuid();
    var id = uuid.v4().toString();
    Object todo = {
      id: {'title': _textController.text, 'date': _dateController.text}
    };
    postData(todo);
    GFToast.showToast(
      'New Task Added',
      context,
    );

    Navigator.of(context).pop();
    getTasks();
  }

  void postData(Object todo) async {
    var response = await BaseClient().post('todos.json', todo);
    if (response == null) return;
    print('Successful');
    print(response);
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

  void deleteTask(String id) async {
    var response = await BaseClient().delete('todos/$id.json');
    getTasks();
  }

  void remove(String id) {
    GFToast.showToast(
      'Task Deleted!',
      context,
    );
    deleteTask(id);
  }

  void getTasks() async {
    setState(() {
      _isLoading = true;
    });
    var response = await BaseClient().get('todos.json');
    setState(() {
      todoList = response;
      _isLoading = false;
    });
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
                _isLoading
                    ? GFLoader(type: GFLoaderType.ios)
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return todoTile(
                              title: todoList[index][1],
                              date: todoList[index][2],
                              remove: (context) =>
                                  deleteTask(todoList[index][0]));
                        },
                      ),
              ],
            )));
  }
}
