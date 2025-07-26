import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/utils/naviagtion_helper.dart';
import '../signup_screen.dart';




class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // Create an Account button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              navigateWithFade(context,SignUpScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child:  Text("create".tr(), style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),

        const SizedBox(height: 16),
        const Text("Or", style: TextStyle(color: Colors.grey)),

        const SizedBox(height: 16),

        // Continue with Facebook button
        const SizedBox(height: 12),

        // Continue with Google button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.google),
            label:  Text("google".tr(), style: TextStyle(fontSize: 16, color: Colors.black87)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}
