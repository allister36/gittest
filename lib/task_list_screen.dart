import 'package:flutter/material.dart';
import 'package:test12/task.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: временно генерируем данные
    final list = [
      Task("asda0", true),
      Task("asda1", true),
      Task("asda", false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo list"),
      ),
      body: _TaskListBody(
        tasks: list,
      ),
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
              }
            },
          ),
          Text('Задача:  ${task.text}'),
        ],
      ),
    );
  }

  void _setIsCompleted(Task task, bool value) {
    final newTask = task.copyWith(isCompleted: value);
    setState(() {
      final index = _tasks.indexOf(task);
      _tasks[index] = newTask;
    });
  }
}
