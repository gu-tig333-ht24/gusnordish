import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:template/models/task_model.dart';

class NetworkService {
  Future<String> getApiKey() async {
    final response = await http
        .get(Uri.parse('https://todoapp-api.apps.k8s.gu.se/register'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register and get API key');
    }
  }

  Future<List<Task>> fetchTodos(String apiKey) async {
    final response = await http
        .get(Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> addTask(Task task, String apiKey) async {
    final response = await http.post(
      Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': task.title,
        'done': task.isCompleted,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add task');
    }
  }

  Future<void> updateTask(Task task, String apiKey) async {
    final response = await http.put(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos/${task.id}?key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': task.title,
        'done': task.isCompleted,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(String id, String apiKey) async {
    final response = await http.delete(
        Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos/$id?key=$apiKey'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
