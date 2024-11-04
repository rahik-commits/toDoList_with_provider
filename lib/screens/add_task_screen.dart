import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/Provider_data.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<taskProvider>(
      builder: (context, taskProvider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'ADD A NEW TASK',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(labelText: 'Task Subtitle'),
              ),
              ElevatedButton(
                autofocus: true,
                onPressed: () => _addTask(taskProvider),
                child: const Text('ADD TASK'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTask(taskProvider) {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard

    final title = titleController.text;
    final subtitle = subtitleController.text;

    // Check if the title or subtitle is empty before adding
    if (title.isNotEmpty && subtitle.isNotEmpty) {
      taskProvider.addTask(title, subtitle);
      titleController.clear();
      subtitleController.clear(); // Clear fields after adding
    } else {
      // Optionally show a snackbar or dialog to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both title and subtitle')),
      );
    }
  }
}
