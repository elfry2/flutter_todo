import 'package:flutter/material.dart';
import '../models/task.dart';

class ReadScreen extends StatelessWidget {
  final Task task;

  const ReadScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final formattedDate = task.deadline != null
        ? task.deadline!.toLocal().toString().split(' ')[0]
        : 'No deadline';

    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Status: ${task.isDone ? "Completed" : "Pending"}',
                  style: TextStyle(
                    color: task.isDone ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Due: $formattedDate',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey),
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              task.description.isEmpty ? 'No description provided.' : task.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}