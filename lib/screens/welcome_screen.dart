import 'package:flutter/material.dart';
import 'package:support_client/screens/login_screen.dart';
import '../core/app_theme.dart';
import '../widgets/auth_logo.dart';
import '../widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/itbs_image.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2F7BEA), Color(0xFFA8CDF5)],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Logo + titre + slogan
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AuthLogo(size: 76),
                      SizedBox(height: 24),
                      Text(
                        'DEVMOB\nSUPPORTCLIENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Vos demandes, notre priorité',
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                // Panneau blanc avec les 2 boutons
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    24,
                    24,
                    24,
                    16 + MediaQuery.of(context).padding.bottom,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    PrimaryButton(
                      label: 'Se connecter',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                    ),
                      const SizedBox(height: 12),
                      PrimaryButton(
                        label: 'Créer un compte',
                        outlined: true,
                        onPressed: () {
                          // TODO: naviguer vers la page Créer un compte
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}