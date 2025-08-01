import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String summary;

  const TaskDetailPage({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('جزئیات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(summary),
      ),
    );
  }
}
