import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/features/Login/presentation/widgets/AuthButtons.dart';
import 'package:mindkraft/shared/widgets/header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Login".tr(),style: TextStyle(color: Color(0xFF014242),fontWeight:FontWeight.bold,fontSize: 18),), LanguageSwitcher()],
            ),
            SizedBox(height: 20,),
            Text("Welcome to Mind Kraft", style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
              Image.asset("assets/img/study.png",width: 300,),
            AuthButtons()

          ],
        ),
      ),
    );
  }
}
