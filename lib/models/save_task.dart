import 'package:flutter/material.dart';
import 'package:template/models/task_model.dart';
import 'package:template/models/API/todo_api.dart';

enum TaskFilter { all, done, undone }

class SaveTask extends ChangeNotifier {
  final String apiKey;
  final List<Task> _tasks = [];
  TaskFilter _filter = TaskFilter.all;

  SaveTask(this.apiKey) {
    _initialize();
  }

  List<Task> get tasks {
    switch (_filter) {
      case TaskFilter.done:
        return _tasks.where((task) => task.isCompleted).toList();
      case TaskFilter.undone:
        return _tasks.where((task) => !task.isCompleted).toList();
      case TaskFilter.all:
      default:
        return _tasks;
    }
  }

  final NetworkService _networkService = NetworkService();

  Future<void> _initialize() async {
    await fetchTasksFromAPI();
  }

  Future<void> fetchTasksFromAPI() async {
    try {
      final fetchedTasks = await _networkService.fetchTodos(apiKey);
      _tasks.clear();
      _tasks.addAll(fetchedTasks);
      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  void newTask(Task task) async {
    await _networkService.addTask(task, apiKey);
    await fetchTasksFromAPI();
  }

  void deleteTask(Task task) async {
    await _networkService.deleteTask(task.id, apiKey);
    await fetchTasksFromAPI();
  }

  void isChecked(int index) async {
    _tasks[index].isChecked();
    await _networkService.updateTask(_tasks[index], apiKey);
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    _filter = filter;
    notifyListeners();
  }
}
