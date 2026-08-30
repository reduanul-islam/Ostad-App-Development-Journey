import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskStatistics extends StatelessWidget {
  const TaskStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total',
                provider.totalTasks,
                Icons.list_alt,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildStatCard(
                'Completed',
                provider.completedTasks,
                Icons.check_circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildStatCard(
                'Pending',
                provider.pendingTasks,
                Icons.pending,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    int value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 8),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}