import 'package:flutter/material.dart';
import 'package:test12/info_page.dart';
import 'package:test12/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskListScreenState();
  }
}

class _TaskListScreenState extends State<TaskListScreen> {
  final list = [
    Task("1 задача", true),
    Task("2 задача", true),
    Task("3 задача", false),
  ];
  @override
  Widget build(BuildContext context) {
    final someVar = [1, 2, 3];
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: Text("Задачи на сегодня"),
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.lime),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(),
              ),
            ),
          ),
        ],
      ),
      body: _TaskListBody(
        tasks: list,
        onRemovePressed: _removeTask,
        taskCompletedChanged: _setIsCompleted,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        backgroundColor: Colors.lime[800],
        child: Text('+', style: TextStyle(fontSize: 25)),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _textController = TextEditingController();
        final alertDialog = AlertDialog(
          title: Text("Добавление записи"),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Новая запись"),
                  controller: _textController,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("ОК"),
              onPressed: () {
                setState(() {
                  list.add(Task(_textController.text, false));
                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Отмена"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
        return alertDialog;
      },
    );
  }

  void _setIsCompleted(Task task, bool value) {
    final newTask = task.copyWith(isCompleted: value);
    setState(
      () {
        final index = list.indexOf(task);
        list[index] = newTask;
      },
    );
  }

  void _removeTask(Task task) {
    setState(
      () {
        list.remove(task);
      },
    );
  }
}

typedef TaskRemove = void Function(Task task);
typedef TaskCompleteChanged = void Function(Task task, bool value);

class _TaskListBody extends StatelessWidget {
  final List<Task> tasks;
  final TaskRemove onRemovePressed;
  final TaskCompleteChanged taskCompletedChanged;

  const _TaskListBody(
      {Key key,
      @required this.tasks,
      @required this.onRemovePressed,
      @required this.taskCompletedChanged})
      : assert(tasks != null),
        assert(onRemovePressed != null),
        assert(taskCompletedChanged != null),
        super(key: key);

  Widget build(BuildContext context) {
    final list = tasks;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final task = list[index];
        return _buildItem(context, task);
      },
    );
  }

  Widget _buildItem(BuildContext context, Task task) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Checkbox(
            value: task.isCompleted,
            checkColor: Colors.teal[400],
            activeColor: Colors.amber[300],
            onChanged: (bool value) {
              if (value != task.isCompleted) {
                taskCompletedChanged(task, value);
              }
            },
          ),
          Text(' ${task.text}'),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red[600],
            onPressed: () {
              onRemovePressed(task);
              // Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
