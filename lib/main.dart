import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const DevmobApp());
}

class DevmobApp extends StatelessWidget {
  const DevmobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVMOB SupportClient',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}