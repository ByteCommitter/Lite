import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {





  final List<Map<String, String>> tasks = [
    {'time': '08:00', 'task': 'Breakfast'},
    {'time': '09:00', 'task': 'Work'},
    {'time': '12:00', 'task': 'Lunch'},
    {'time': '13:00', 'task': 'Work'},
    {'time': '18:00', 'task': 'Dinner'},
    {'time': '20:00', 'task': 'Relax'},
    {'time': '18:00', 'task': 'Dinner'},
  ];
/*
  final List<Map<String, String>> day26 = [
    {'time': '08:00', 'task': 'Breakfast'},
    {'time': '09:00', 'task': 'Work'},
    {'time': '12:00', 'task': 'Lunch'},
    {'time': '13:00', 'task': 'Work'},
    {'time': '18:00', 'task': 'Dinner'},
    {'time': '20:00', 'task': 'Relax'},
    {'time': '18:00', 'task': 'Dinner'},
  ];
final List<Map<String, String>> tasks = [
    {'time': '08:00', 'task': 'Breakfast'},
    {'time': '09:00', 'task': 'Work'},
    {'time': '12:00', 'task': 'Lunch'},
    {'time': '13:00', 'task': 'Work'},
    {'time': '18:00', 'task': 'Dinner'},
    {'time': '20:00', 'task': 'Relax'},
    {'time': '18:00', 'task': 'Dinner'},
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(tasks[index]['time']!),
            title: Text(tasks[index]['task']!),
          );
        },
      ),
    );
  }
}