import 'package:flutter/material.dart';
import 'package:tabbar/data/repository.dart';
import 'package:tabbar/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function function;
  Function function1;
  TaskWidget(this.task, this.function, this.function1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            function(task);
          },
        ),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (bool value) {
            function1(task);
          },
        ),
      ),
    );
  }
}
