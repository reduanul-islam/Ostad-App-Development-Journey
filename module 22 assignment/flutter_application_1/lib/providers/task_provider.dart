import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  int get totalTasks => _tasks.length;

  int get completedTasks {
    return _tasks.where((task) => task.isCompleted).length;
  }

  int get pendingTasks {
    return _tasks.where((task) => !task.isCompleted).length;
  }

  void addTask(String title, String description) {
    _tasks.add(
      Task(
        title: title,
        description: description,
      ),
    );

    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;

    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);

    notifyListeners();
  }
}