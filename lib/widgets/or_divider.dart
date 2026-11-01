import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Ou', style: TextStyle(color: AppColors.grey, fontSize: 12)),
        ),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }
}