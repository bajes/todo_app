import 'package:flutter/material.dart';
import 'package:tabbar/data/repository.dart';
import 'package:tabbar/models/task.dart';
import 'package:tabbar/pages/widgits/task_widget.dart';

class AllTasks extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function function1;
  AllTasks(this.tasks, this.function, this.function1);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(tasks[index], function, function1);
        });
  }
}
