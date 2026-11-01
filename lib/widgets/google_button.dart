import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const GoogleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed ?? () {}, // TODO: Google Sign-In
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'G',
              style: TextStyle(
                color: Color(0xFFEA4335),
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Se connecter avec Google',
              style: TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}