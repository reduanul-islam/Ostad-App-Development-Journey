import 'package:flutter/material.dart';

import '../controller/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  final String token;

  const AddTaskScreen({
    super.key,
    required this.token,
  });

  @override
  State<AddTaskScreen> createState() {
    return _AddTaskScreenState();
  }
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  final TaskController taskController =
      TaskController();

  bool loading = false;

  Future<void> createTask() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter title and description'),
        ),
      );

      return;
    }

    setState(() {
      loading = true;
    });

    final success = await taskController.createTask(
      titleController.text.trim(),
      descriptionController.text.trim(),
      widget.token,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      loading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task created successfully'),
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task creation failed'),
        ),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: loading ? null : createTask,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Create Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}