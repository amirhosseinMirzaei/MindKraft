import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/core/theme/app_colors.dart';

class TaskDetailPage extends StatelessWidget {
  final String summary;

  const TaskDetailPage({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary of Lesson', style: TextStyle(color: AppColors.surfaceLight)),
        backgroundColor: AppColors.primary,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.white), // این خط باعث میشه آیکون‌ها سفید بشن
      ),
      backgroundColor: Colors.grey[100], // پس‌زمینه ملایم‌تر
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            summary,
            style: TextStyle(
              fontSize: 18,
              height: 1.5, // فاصله بین خطوط برای خوانایی بهتر
              color: Colors.grey[800], // رنگ متن ملایم
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify, // تراز بندی دو طرفه برای ظاهر تمیزتر
          ),
        ),
      ),
    );
  }
}
