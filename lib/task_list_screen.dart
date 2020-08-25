import 'package:flutter/material.dart';
import 'package:test12/task.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: временно генерируем данные

    final list = [
      Task("asda", true),
      Task("asda1", true),
      Task("asda", false),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo list"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final task = list[index];
          return _buildItem(context, task);
        },
      ),
    );
  }
}

Widget _buildItem(BuildContext context, Task task) {
  return Container(
    height: 50,
    child: Row(
      children: [
        Checkbox(
          value: task.isCompleted,
          onChanged: (bool value) {
            print(value);
          },
        ),
        Text('Задача:  ${task.text}'),
      ],
    ),
  );
}
