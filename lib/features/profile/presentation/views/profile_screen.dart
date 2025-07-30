import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:mindkraft/features/auth/presentation/views/splash_screen.dart';
import 'package:mindkraft/main.dart';
import 'package:mindkraft/services/parse_service.dart';

import '../../../../core/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.onPrimary, // رنگ نوار وضعیت (Status bar)
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFE1F5ED),
        body: Column(
          children: [
            // نوار بالا + هدر سبز
            Container(
              width: width,
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 800),
                      builder: (context, value, child) {
                        return Transform.scale(scale: value, child: child);
                      },
                      child: const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/img/user.jpg'), backgroundColor: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    const Text('Gracia Tya', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    const SizedBox(height: 6),
                    const Text('Flutter Developer', style: TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  ProfileListCard(
                    options: [
                      ProfileOption(icon: Icons.edit, text: 'Edit Profile Name'),
                      ProfileOption(icon: Icons.list_alt, text: 'Projects'),
                      ProfileOption(icon: Icons.lock_outline, text: 'Change Password'),
                      ProfileOption(icon: Icons.email_outlined, text: 'Change Email Address'),
                      ProfileOption(icon: Icons.settings_outlined, text: 'Settings'),
                      ProfileOption(icon: Icons.tune, text: 'Preferences'),
                      ProfileOption(
                        onTap: () async {
                          await ParseService().logout();
                          Phoenix.rebirth(context);
                        },
                        icon: Icons.logout,
                        text: 'Logout',
                        iconColor: Colors.red,
                        textColor: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListCard extends StatelessWidget {
  final List<ProfileOption> options;

  const ProfileListCard({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            options.map((option) {
              final isLast = options.indexOf(option) == options.length - 1;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(option.icon, color: option.iconColor ?? Theme.of(context).primaryColor, size: 28),
                    title: Text(option.text, style: TextStyle(color: option.textColor ?? Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                    onTap: option.onTap,
                  ),
                  if (!isLast) const Divider(height: 1, indent: 20, endIndent: 20),
                ],
              );
            }).toList(),
      ),
    );
  }
}

class ProfileOption {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback? onTap;

  ProfileOption({required this.icon, required this.text, this.iconColor, this.textColor, this.onTap});
}
