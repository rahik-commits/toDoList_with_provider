import 'package:flutter/material.dart';
import 'package:todo_provider/screens/add_task_screen.dart';
import 'package:todo_provider/widgets/task_list.dart';

class task_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bottomsheet(BuildContext context) {
      //this bottomsheet fn takes context as parameter;
      return AddTask(); //the fn returns a container;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
            context:
                context, //it takes context which is already build in task_screen builder;
            builder:
                bottomsheet, //builder takes a widget function, we made it with the name 'bottomsheet';
          ); //the bottom sheet fn is defined in the build part;
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        leading: Icon(
          Icons.list,
          color: Colors.white,
        ),
        title: Text(
          'ALL TASKS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: TaskList(),
      backgroundColor: Colors.teal[900],
    );
  }
}
