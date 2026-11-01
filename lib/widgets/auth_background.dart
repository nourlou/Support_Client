import 'package:flutter/material.dart';
import '../core/app_theme.dart';

/// Fond blanc avec la forme claire en haut à gauche (comme la maquette)
class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -90,
          left: -90,
          child: Container(
            width: 280,
            height: 280,
            decoration: const BoxDecoration(
              color: AppColors.blob,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}