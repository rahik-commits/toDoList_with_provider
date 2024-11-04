import 'package:flutter/material.dart';

class taskProvider extends ChangeNotifier {
  List<Map<String, String>> _mdata = [];

  //events

  // Method to add data
  void addTask(String title, String subtitle) {
    _mdata.add({'title': title, 'subtitle': subtitle});
    print('Added task: $title, $subtitle'); // Debug statement

    notifyListeners(); // Notify listeners to rebuild
  }

  // Method to update a task by index
  void updateTask(int index, String newTitle, String newSubtitle) {
    if (index >= 0 && index < _mdata.length) {
      _mdata[index] = {'title': newTitle, 'subtitle': newSubtitle};
      notifyListeners(); // Notify listeners to rebuild
    }
  }

  // Method to delete data by index
  void deleteTask(int index) {
    if (index >= 0 && index < _mdata.length) {
      _mdata.removeAt(index);
      notifyListeners(); // Notify listeners to rebuild
    }
  }

  // Optional: Method to fetch all data
  List<Map<String, String>> getData() {
    return _mdata;
  }
}
