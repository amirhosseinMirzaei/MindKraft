import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/core/theme/app_colors.dart';
import 'package:mindkraft/core/utils/naviagtion_helper.dart';
import 'package:mindkraft/features/home/presentation/pages/home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StudyProgramPage extends StatelessWidget {
  const StudyProgramPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "StudyFlow".tr(),
          style: TextStyle(color: AppColors.surfaceLight),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 1,
        leading:  IconButton(onPressed: (){
          navigateWithFade(context, HomePage());
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white70,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:AppColors.info.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                   Icon(Icons.info_outline, color: AppColors.secondary.withOpacity(0.6)),
                   SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'برنامه شما بر اساس پیشرفت نمره‌ای ۶ به نمره ۷.۵ در آزمون آکادمیک با فرض ۳۶ هفته تنظیم شده است.',
                      style:  TextStyle(fontSize: 13),

                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Progress bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("مسیر پیشرفت", style: TextStyle(fontSize: 16)),
                 SizedBox(height: 6),
                LinearPercentIndicator(
                  percent: 0.31,
                  lineHeight: 14,
                  animation: true,
                  barRadius: const Radius.circular(8),
                  backgroundColor: Colors.grey.shade300,
                  progressColor: AppColors.success,
                  center:  Text(
                    "۳۱٪",
                    style: TextStyle(fontSize: 12, color:AppColors.secondary,fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Week selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon:  Icon(Icons.arrow_back_ios, size: 16),
                  label:  Text("هفته‌ی قبل"),
                ),
                 Text(
                  "هفته هشتم",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon:  Icon(Icons.arrow_forward_ios, size: 16),
                  label:  Text("هفته‌ی بعد"),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Week progress
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 40,
                  lineWidth: 8,
                  percent: 0.67,
                  center: const Text("۶۶.۷٪"),
                  progressColor: AppColors.danger,
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("۱۸ فعالیت", style: TextStyle(fontSize: 16)),
                    Text("۵۱ ساعت", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),

             SizedBox(height: 20),

            // Task Cards
            ..._buildTaskCard(
              title: "Collins - Listening for IELTS",
              hours: 3,
              chapter: "فصل ۱۲",
              buttonLabel: "",
              buttonColor: AppColors.secondary,
            ),
            const SizedBox(height: 12),
            ..._buildTaskCard(
              title: "Armani online \"Writing/Speaking (structure)\"",
              hours: 3,
              chapter: "فصل ۷",
              buttonLabel: "",
              buttonColor: AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTaskCard({
    required String title,
    required int hours,
    required String chapter,
    required String buttonLabel,
    required Color buttonColor,
  }) {
    return [
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: buttonColor.withOpacity(0.15),
              child: Icon(Icons.check, color: buttonColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.timelapse, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('$hours ساعت', style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      const Icon(Icons.menu_book, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(chapter,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.visibility,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ];
  }
  }
