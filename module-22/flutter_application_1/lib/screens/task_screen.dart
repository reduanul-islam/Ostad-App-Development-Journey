import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TextField
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Enter Task',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String title = taskController.text;

                  context.read<TaskProvider>().addTask(title);

                  taskController.clear();
                },
                child: const Text('Add Task'),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, provider, child) {
                  if (provider.tasks.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Tasks Available',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = provider.tasks[index];

                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (value) {
                              context.read<TaskProvider>().toggleTask(index);
                            },
                          ),

                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),

                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<TaskProvider>().deleteTask(index);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
