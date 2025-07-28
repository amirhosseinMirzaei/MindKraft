import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/core/theme/app_colors.dart';
import 'package:mindkraft/features/auth/presentation/views/signup_screen.dart';

import '../../../../core/utils/naviagtion_helper.dart';
import '../../../../services/parse_service.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../uploadFile/presentation/views/file_upload_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar('Please fill in all fields');
      return;
    }

    setState(() => isLoading = true);

    final response = await ParseService().login(email: email, password: password);

    setState(() => isLoading = false);

    if (response.success && response.results != null) {
      _showSnackbar('Login successful 🎉');

      navigateWithFade(context, StudyAssistantPage());

    } else {
      _showSnackbar(response.error?.message ?? 'Login failed');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: theme.colorScheme.primary),
                        hintText: 'Email / Username',
                        hintStyle: TextStyle(color: AppColors.surfaceDark.withOpacity(0.5)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: theme.colorScheme.primary),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: AppColors.surfaceDark.withOpacity(0.5)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: isLoading ? null : _handleLogin,
                      icon: isLoading
                          ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.onPrimary,
                          ),
                        ),
                      )
                          : Icon(Icons.login, color: theme.colorScheme.onPrimary),
                      label: Text(
                        isLoading ? 'Logging in...' : 'LOGIN',
                        style: TextStyle(color: theme.colorScheme.onPrimary),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB25F2A),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Or login with'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, color: Colors.green),
                      label: Text('Google'),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.green),
                        foregroundColor: Colors.green,
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  navigateWithFade(context, SignUpScreen());
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
