import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/validators.dart';
import '../widgets/auth_background.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

/// 04 - Mot de passe oublié
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    // TODO: appel API (envoi du lien de réinitialisation)
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lien envoyé à ${_emailCtrl.text.trim()} (simulation)'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Forme claire en bas à droite (comme la maquette)
          Positioned(
            bottom: -90,
            right: -90,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.blob,
                shape: BoxShape.circle,
              ),
            ),
          ),
          AuthBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Bouton retour
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 2,
                        shadowColor: AppColors.primary.withOpacity(0.25),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () => Navigator.of(context).maybePop(),
                          child: const SizedBox(
                            width: 38,
                            height: 38,
                            child: Icon(Icons.chevron_left,
                                color: AppColors.primary, size: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Cercle + cadenas
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE0E1F7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lock,
                        size: 64,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 28),

                    const Text(
                      'Mot de passe oublié ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Entrez votre e-mail .\n'
                      'Nous vous enverrons un lien pour\n'
                      'réinitialiser votre mot de passe.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Label E-mail universitaire
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail_outline,
                              size: 18, color: AppColors.dark),
                          SizedBox(width: 8),
                          Text(
                            'E-mail universitaire',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: _emailCtrl,
                      hint: 'exemple@universite.tn',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 32),

                    PrimaryButton(
                      label: 'Envoyer le lien',
                      isLoading: _loading,
                      onPressed: _submit,
                    ),
                    const SizedBox(height: 20),

                    // Retour à la connexion
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back,
                              size: 14, color: AppColors.primary),
                          SizedBox(width: 6),
                          Text(
                            'Retour à la connexion',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}