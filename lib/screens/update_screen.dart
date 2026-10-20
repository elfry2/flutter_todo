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
  DateTime? _selectedDate;
  final TaskService _taskService = TaskService();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descController = TextEditingController(text: widget.task.description);
    _isDone = widget.task.isDone;
    _selectedDate = widget.task.deadline;
  }

  Future<void> _pickDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _updateTask() async {
    if (_titleController.text.trim().isEmpty) return;

    widget.task.title = _titleController.text.trim();
    widget.task.description = _descController.text.trim();
    widget.task.isDone = _isDone;
    widget.task.deadline = _selectedDate;

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
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No deadline chosen'
                        : 'Deadline: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _pickDueDate(context),
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Change Date'),
                ),
                if (_selectedDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.red),
                    onPressed: () => setState(() => _selectedDate = null),
                  ),
              ],
            ),
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