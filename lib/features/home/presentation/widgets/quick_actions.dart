import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionCard(icon: Icons.schedule, label: 'برنامه درسی'),
        _ActionCard(icon: Icons.quiz, label: 'آزمون‌ها'),
        _ActionCard(icon: Icons.book, label: 'منابع'),
        _ActionCard(icon: Icons.bar_chart, label: 'آمار'),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
