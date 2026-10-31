import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class AuthLogo extends StatelessWidget {
  final double size;
  const AuthLogo({super.key, this.size = 64});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Icon(Icons.school, color: Colors.white, size: size * 0.5),
    );
  }
}