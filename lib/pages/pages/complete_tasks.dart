import 'package:flutter/material.dart';
import 'package:tabbar/data/repository.dart';
import 'package:tabbar/models/task.dart';
import 'package:tabbar/pages/widgits/task_widget.dart';

class CompleteTasks extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function function1;
  CompleteTasks(this.tasks, this.function, this.function1);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.where((element) => element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => element.isComplete).toList()[index],
              function,
              function1);
        });
  }
}
