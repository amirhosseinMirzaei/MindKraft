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

class _LanguageSwitcherState extends State<LanguageSwitcher> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;

  final List<_FlagItem> flags = [
    _FlagItem(locale: const Locale('en'), asset: 'assets/img/flags/en.png'),
    _FlagItem(locale: const Locale('fa'), asset: 'assets/img/flags/fa.png'),
    _FlagItem(locale: const Locale('de'), asset: 'assets/img/flags/de.png'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  void toggleMenu() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void changeLocale(Locale locale) {
    context.setLocale(locale);
    toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // کمی بزرگ‌تر برای فضای باز شدن دکمه‌ها
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // دکمه‌های پرچم
          ...List.generate(flags.length, (index) {
            final angle = pi / 2 + (index * pi / (flags.length - 1)); // نیم‌دایره
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final offset = Offset.fromDirection(
                  angle,
                  _controller.value * 50, // شعاع دکمه‌ها
                );
                return Positioned(
                  left: 30 + offset.dx,
                  top: 30 - offset.dy,
                  child: IgnorePointer(
                    ignoring: _controller.value == 0,
                    child: Opacity(
                      opacity: _controller.value,
                      child: GestureDetector(
                        onTap: () => changeLocale(flags[index].locale),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(flags[index].asset),
                          radius: 16,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // دکمه اصلی
          IconButton(
            icon: const Icon(Icons.language, color: Color(0xFF014242)),
            onPressed: toggleMenu,
            iconSize: 28,
          ),
        ],
      ),
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

