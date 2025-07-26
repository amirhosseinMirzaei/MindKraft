import 'dart:async';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/features/auth/presentation/views/widgets/AuthButtons.dart';
import 'package:mindkraft/shared/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _contentController;

  late Animation<Offset> _imageOffsetAnimation;
  late Animation<Offset> _contentOffsetAnimation;
  late AnimationController _dotsController;
  bool showContent = false;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );



    _imageOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOut,
    ));
    _dotsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    )..repeat();

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _contentOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOut,
    ));

    // Start image animation
    _imageController.forward();

    // Delay content reveal
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => showContent = true);
      _contentController.forward();
    });

    _imageController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {}); // تا بتونه نقطه‌ها رو نشون بده
      }
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header (Login + Language)
            AnimatedOpacity(
              opacity: showContent ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: SlideTransition(
                position: _contentOffsetAnimation,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(39, 30, 28, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login".tr(), style: theme.textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF014242),
                        fontWeight: FontWeight.bold,
                      )),
                      const Spacer(),
                      const LanguageSwitcher(),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Welcome Text
            AnimatedOpacity(
              opacity: showContent ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: SlideTransition(
                position: _contentOffsetAnimation,
                child: Text("Welcome to Mind Kraft",
                    style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold)),
              ),
            ),

            const Spacer(),

            // Animated Image
            Column(
              children: [
                SlideTransition(
                  position: _imageOffsetAnimation,
                  child: FadeTransition(
                    opacity: _imageController,
                    child: Image.asset("assets/img/study.png", width: 300),
                  ),
                ),
                if (_imageController.isCompleted && !showContent)
                  LoadingDots(),
                  // AnimatedBuilder(
                  //   animation: _dotsController,
                  //   builder: (context, child) {
                  //     int tick = (_dotsController.value * 3).floor() % 4;
                  //     String dots = '.' * tick;
                  //     return Text(
                  //       dots,
                  //       style: const TextStyle(fontSize: 24, letterSpacing: 2),
                  //     );
                  //   },
                  // ),
              ],
            ),

            const SizedBox(height: 20),

            // Auth Buttons
            AnimatedOpacity(
              opacity: showContent ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: SlideTransition(
                position: _contentOffsetAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const AuthButtons(),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}


class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        final offset = sin(_animation.value + index * 0.5) * 6;
        return Transform.translate(
          offset: Offset(0, -offset),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.teal, // کله‌غازی مثلا
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, _buildDot),
    );
  }
}

