import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo list"),
      ),
      body: _TaskListBody(
        tasks: list,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
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
}

class _TaskListBody extends StatefulWidget {
  final List<Task> tasks;

  const _TaskListBody({Key key, @required this.tasks})
      : assert(tasks != null),
        super(key: key);

  @override
  _TaskListBodyState createState() => _TaskListBodyState();
}

class _TaskListBodyState extends State<_TaskListBody> {
  List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = widget.tasks.toList();
  }

  @override
  void didUpdateWidget(_TaskListBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tasks = widget.tasks.toList();
  }

  Widget build(BuildContext context) {
    final list = _tasks;
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
            onChanged: (bool value) {
              if (value != task.isCompleted) {
                _setIsCompleted(task, value);
                _tasks.remove(1);
              }
            },
          ),
          Text(' ${task.text}'),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _removeTask(task, false);
              // Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void _setIsCompleted(Task task, bool value) {
    final newTask = task.copyWith(isCompleted: value);
    setState(
      () {
        final index = _tasks.indexOf(task);
        _tasks[index] = newTask;
      },
    );
  }

  void _removeTask(Task task, bool value) {
    final newTask = task.copyWith(isCompleted: value);
    setState(
      () {
        final index = _tasks.indexOf(task);
        _tasks[index] = newTask;
        _tasks.removeAt(index);
      },
    );
  }
}
