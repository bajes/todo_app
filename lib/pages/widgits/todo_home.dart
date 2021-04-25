import 'package:flutter/material.dart';
import 'package:tabbar/data/repository.dart';
import 'package:tabbar/pages/pages/complete_tasks.dart';
import 'package:tabbar/pages/pages/all_tasks.dart';
import 'package:tabbar/pages/pages/inComplete_tasks.dart';
import 'package:tabbar/models/task.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int taskNumber = 0;
  TabController controller;
  void isComplete(Task task) {
    task.isComplete = !task.isComplete;
    setState(() {});
  }

  void addTask(Task task) {
    Repository.tasks.add(task);
    setState(() {});
  }

  void deleteTask(Task task) {
    Repository.tasks.remove(task);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          AllTasks(Repository.tasks, deleteTask, isComplete),
          CompleteTasks(Repository.tasks, deleteTask, isComplete),
          InCompleteTasks(Repository.tasks, deleteTask, isComplete)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'All',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'Complete',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'InComplete',
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ++taskNumber;
          addTask(Task(
              title: 'Task $taskNumber',
              description: 'this task created by Bajes $taskNumber',
              isComplete: false,
              id: '$taskNumber'));
        },
      ),
    );
  }
}
