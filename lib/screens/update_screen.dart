import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class UpdateScreen extends StatefulWidget {
  final Task task;

  const UpdateScreen({super.key, required this.task});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late bool _isDone;
  final TaskService _taskService = TaskService();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descController = TextEditingController(text: widget.task.description);
    _isDone = widget.task.isDone;
  }

  void _updateTask() async {
    if (_titleController.text.trim().isEmpty) return;

    widget.task.title = _titleController.text.trim();
    widget.task.description = _descController.text.trim();
    widget.task.isDone = _isDone;

    await _taskService.updateTask(widget.task);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Task Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Mark as Completed'),
              value: _isDone,
              onChanged: (val) {
                setState(() {
                  _isDone = val ?? false;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _updateTask,
              child: const Text('Update Changes'),
            ),
          ],
        ),
      ),
    );
  }
}