import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_item.dart';
import '../widgets/task_statistics.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AddTaskDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TaskStatistics(),
          ),

          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, provider, child) {
                if (provider.tasks.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.task_alt,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'No tasks available',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Tap + to add a new task',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      task: provider.tasks[index],
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}