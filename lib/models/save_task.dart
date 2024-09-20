import 'package:flutter/material.dart';
import 'package:template/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Make juice', isCompleted: false),
    Task(title: 'Go gym', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void newTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void isChecked(int index) {
    tasks[index].isChecked();
    notifyListeners();
  }
}
