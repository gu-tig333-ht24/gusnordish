import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/save_task.dart';

// Huvudsida:

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          title: Text(
            style: TextStyle(color: Colors.white),
            'Home Page',
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('all')),
                PopupMenuItem(child: Text('done')),
                PopupMenuItem(child: Text('undone')),
              ],
            ),
          ],
        ),
        body: Consumer<SaveTask>(
          builder: (context, task, child) {
            return ListView.builder(
                itemCount: task.tasks.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(
                      style: TextStyle(
                          decoration: task.tasks[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationThickness: 2.0),
                      task.tasks[index].title,
                    ),
                    trailing: Wrap(
                      children: [
                        Checkbox(
                            activeColor: Colors.white,
                            value: task.tasks[index].isCompleted,
                            onChanged: (_) {
                              context.read<SaveTask>().isChecked(index);
                            }),
                        IconButton(
                          onPressed: () {
                            context.read<SaveTask>().deleteTask(
                                  task.tasks[index],
                                );
                          },
                          icon: Icon(Icons.delete), // Corrected this line
                        )
                      ],
                    ),
                  );
                });
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
              child: Icon(Icons.add),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
