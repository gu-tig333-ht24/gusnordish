import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/save_task.dart';

// Home Page:

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SaveTask>().fetchTasksFromAPI();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<TaskFilter>(
            onSelected: (TaskFilter filter) {
              context.read<SaveTask>().setFilter(filter);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: TaskFilter.all,
                child: Text('All'),
              ),
              const PopupMenuItem(
                value: TaskFilter.done,
                child: Text('Done'),
              ),
              const PopupMenuItem(
                value: TaskFilter.undone,
                child: Text('Undone'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          if (task.tasks.isEmpty) {
            return const Center(
              child: Text(
                'No todos available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    // Checkbox
                    Checkbox(
                      activeColor: Colors.white,
                      value: task.tasks[index].isCompleted,
                      onChanged: (_) {
                        context.read<SaveTask>().isChecked(index);
                      },
                    ),

                    // Task title
                    Expanded(
                      child: Text(
                        task.tasks[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: task.tasks[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),

                    // Delete button
                    IconButton(
                      onPressed: () {
                        context.read<SaveTask>().deleteTask(task.tasks[index]);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35, right: 8.0),
        child: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/new-todo-screen');
            },
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color.fromARGB(255, 20, 20, 20),
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
