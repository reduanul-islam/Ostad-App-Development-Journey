import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title));

      notifyListeners();
    }
  }

  void deleteTask(int index) {
    tasks.removeAt(index);

    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;

    notifyListeners();
  }
}
