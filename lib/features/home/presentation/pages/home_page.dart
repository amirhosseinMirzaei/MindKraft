import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindkraft/core/utils/naviagtion_helper.dart';
import 'package:mindkraft/features/home/presentation/pages/study_program_page.dart';

import '../../../../shared/widgets/header.dart';
import '../../data/study_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StudyData? studyData;

  @override
  void initState() {
    super.initState();
    loadData();
  }
  int readCount = 0;
  int remainingCount = 0;

  Future<void> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final data = StudyData.fromJson(jsonMap);

    int totalRead = 0;
    int totalRemain = 0;

    for (final subject in data.subjects) {
      for (final chapter in subject.chapters) {
        if (chapter.isRead) {
          totalRead++;
        } else {
          totalRemain++;
        }
      }
    }

    setState(() {
      studyData = data;
      readCount = totalRead;
      remainingCount = totalRemain;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (studyData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageSwitcher(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/img/user.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Stats (optional demo)
              Row(
                children: [
                  _StatCard(
                    value: '$readCount',
                    label: 'Studied cards',
                    color: const Color(0xFF4CB8AC).withOpacity(0.3),
                    textColor: const Color(0xFF4CB8AC),
                  ),
                  const SizedBox(width: 16),
                  _StatCard(
                    value: '$remainingCount',
                    label: 'Remain cards',
                    color: const Color(0xFFFFF2E5),
                    textColor: const Color(0xFFFFA451),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'Subjects',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Dynamically Loaded Subject Cards
              Column(
                children: studyData!.subjects.map((subject) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ClassCard(
                      category: subject.category,
                      title: subject.title,
                      author: "Generated", // Placeholder
                      image: 'assets/img/user1.jpg', // static image
                      color: Colors.blueAccent,
                      onTap: () {
                        navigateWithFade(context, StudyProgramPage(subject:subject ));
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final Color textColor;

  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ClassCard extends StatelessWidget {
  final String category;
  final String title;
  final String author;
  final String image;
  final Color color;
  final VoidCallback onTap;

  const _ClassCard({
    required this.category,
    required this.title,
    required this.author,
    required this.image,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(width: 8),
                Text(
                  author,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
