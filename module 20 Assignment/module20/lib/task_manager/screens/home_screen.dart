import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../data/models/task_model.dart';
import '../widget/task_card.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({
    super.key,
    required this.token,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController =
      TaskController();

  List<TaskModel> tasks = [];

  bool loading = true;

  Future<void> loadTasks() async {
    setState(() {
      loading = true;
    });

    final result =
        await taskController.getTasks(
      'New',
      widget.token,
    );

    setState(() {
      tasks = result;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddTaskScreen(
                token: widget.token,
              ),
            ),
          );

          loadTasks();
        },
        child: const Icon(Icons.add),
      ),

      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : tasks.isEmpty
              ? const Center(
                  child: Text('No tasks found'),
                )
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                    );
                  },
                ),
    );
  }
}