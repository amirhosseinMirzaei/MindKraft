import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const HeaderWidget({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      elevation: 0,
      title: Text(title.tr(), style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [LanguageSwitcher(), if (actions != null) ...actions!],
    );
  }
}







class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<_FlagItem> flags = [
    _FlagItem(locale: const Locale('en'), asset: 'assets/img/flags/en.png'),
    _FlagItem(locale: const Locale('fa'), asset: 'assets/img/flags/fa.png'),
    _FlagItem(locale: const Locale('de'), asset: 'assets/img/flags/de.png'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleMenu() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? _controller.forward() : _controller.reverse();
    });
  }

  void changeLocale(Locale locale) {
    context.setLocale(locale);
    toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // آیکون اصلی
        IconButton(
          icon: const Icon(Icons.language, color: Color(0xFF014242)),
          onPressed: toggleMenu,
        ),

        // انیمیشن پرچم‌ها (سمت راست آیکون)
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Row(
            children: flags
                .map((flag) => GestureDetector(
              onTap: () => changeLocale(flag.locale),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: CircleAvatar(
                  backgroundImage: AssetImage(flag.asset),
                  radius: 14,
                  backgroundColor: Colors.white,
                ),
              ),
            ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _FlagItem {
  final Locale locale;
  final String asset;

  _FlagItem({required this.locale, required this.asset});
}


