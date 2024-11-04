import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_tile.dart'; // Make sure to import your TaskTile
import 'package:todo_provider/models/Provider_data.dart'; // Adjust import according to your structure

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<taskProvider>(
      builder: (context, taskProvider, child) {
        // Get the list of tasks
        final tasks = taskProvider.getData();

        // Check if the list is empty and display a message if it is
        if (tasks.isEmpty) {
          return Center(child: Text('No tasks available'));
        }

        return ListView.builder(
          itemCount: tasks.length, // Get the count of tasks
          itemBuilder: (context, index) {
            final task = tasks[index]; // Get the task at the current index

            return TaskTile(
              title: task['title'] ?? 'No Title', // Access title
              subtitle: task['subtitle'] ?? 'No Subtitle', // Access subtitle
              isChecked:
                  false, // You can replace this with a real checkbox state
              onChanged: (value) {
                // Handle checkbox change logic if needed
              },
              onDelete: () {
                // Call deleteTask method from taskProvider
                taskProvider.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
