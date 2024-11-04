import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged; // To handle checkbox state
  final VoidCallback onDelete; // Callback for delete action

  const TaskTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(
                Colors.teal[50]), // Set your preferred active color here
          ),
        ),
        child: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          // activeColor is set in the Theme, so it's not necessary here
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.teal[100]), // Delete icon
        onPressed: onDelete, // Trigger delete when pressed
      ),
    );
  }
}
