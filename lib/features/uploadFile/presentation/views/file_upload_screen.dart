import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../../../../shared/widgets/bottom_navigation.dart';

class StudyAssistantPage extends StatefulWidget {
  const StudyAssistantPage({super.key});

  @override
  State<StudyAssistantPage> createState() => _StudyAssistantPageState();
}

class _StudyAssistantPageState extends State<StudyAssistantPage> {
  File? selectedFile;
  bool isLoading = false;
  String? summary;
  List<String>? resources;
  List<String>? studyPlan;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });

      await processFile();
    }
  }

  Future<void> processFile() async {
    if (selectedFile == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      // فایل را به API بفرست (مثلاً ParsServer یا API هوش مصنوعی مثل OpenAI یا یک بک‌اند شخصی‌سازی شده)
      // این قسمت نمونه‌سازی شده است:
      await Future.delayed(const Duration(seconds: 2)); // شبیه‌سازی پردازش

      // خروجی شبیه‌سازی شده:
      setState(() {
        summary = "این فایل درباره فیزیک الکترومغناطیس است و شامل مفاهیم میدان‌های الکتریکی و مغناطیسی می‌باشد.";
        resources = [
          "ویدئوی Khan Academy درباره الکترومغناطیس",
          "کتاب خلاصه شده الکترومغناطیس گریفیث",
          "پادکست فیزیک برای مبتدی‌ها – فصل ۲"
        ];
        studyPlan = [
          "روز 1: مرور کلی مطالب + مشاهده ویدئو",
          "روز 2: مطالعه میدان‌های الکتریکی",
          "روز 3: تمرین‌ها و یادداشت‌برداری",
          "روز 4: مرور منابع مکمل",
          "روز 5: تست‌های دوره‌ای",
          "روز امتحان: مرور سریع خلاصه"
        ];
      });
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Study Assistant")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: pickFile,
              icon: const Icon(Icons.upload_file),
              label: const Text("آپلود فایل یا عکس"),
            ),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),

            if (summary != null) ...[
              const SizedBox(height: 20),
              const Text("خلاصه:", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(summary!),
              const SizedBox(height: 10),
              const Text("منابع مکمل:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...resources!.map((r) => Text("- $r")),
              const SizedBox(height: 10),
              const Text("برنامه‌ریزی روزانه:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...studyPlan!.map((p) => Text("- $p")),
            ]
          ],
        ),
      ),
    );
  }
}
