import 'package:flutter/material.dart';
import 'package:mindkraft/core/theme/app_colors.dart';

enum NotificationType { success, error, warning }

class AppNotifier {
  static void show({required BuildContext context, required String message, required NotificationType type}) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case NotificationType.success:
        backgroundColor = AppColors.success;
        icon = Icons.check_circle_outline;
        break;
      case NotificationType.error:
        backgroundColor = AppColors.danger;
        icon = Icons.error_outline;
        break;
      case NotificationType.warning:
        backgroundColor = AppColors.warning;
        icon = Icons.warning_amber_outlined;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(children: [Icon(icon, color: Colors.white), const SizedBox(width: 12), Expanded(child: Text(message))]),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
