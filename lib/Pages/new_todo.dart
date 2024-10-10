import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/save_task.dart';
import 'package:template/models/task_model.dart';
import 'package:uuid/uuid.dart';

class NewTodo extends StatelessWidget {
  NewTodo({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        centerTitle: true,
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                var uuid = Uuid();
                context.read<SaveTask>().newTask(Task(
                      id: uuid.v4(),
                      title: textController.text,
                      isCompleted: false,
                    ));
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
