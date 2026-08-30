import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;

  const TaskItem({
    super.key,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
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
            fontSize: 17,
            fontWeight: FontWeight.bold,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(task.description),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            context.read<TaskProvider>().deleteTask(index);
          },
        ),
      ),
    );
  }
}