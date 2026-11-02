import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/validators.dart';
import '../models/user_role.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_logo.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/google_button.dart';
import '../widgets/or_divider.dart';
import '../widgets/primary_button.dart';
import '../widgets/role_card.dart';
import 'login_screen.dart';

/// 03 - Créer un compte
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  UserRole _role = UserRole.client;
  bool _accepted = true;
  bool _termsError = false;
  bool _loading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final formOk = _formKey.currentState!.validate();
    setState(() => _termsError = !_accepted);
    if (!formOk || !_accepted) return;

    setState(() => _loading = true);
    // TODO: appel API (register) avec _nameCtrl, _emailCtrl, _passCtrl, _role
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Compte créé (simulation)')),
    );
  }

  void _goToLogin() {
    // Si on vient de la page Connexion, on revient simplement en arrière
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
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
                        child: Icon(
                          Icons.chevron_left,
                          color: AppColors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),

                const AuthLogo(size: 64),
                const SizedBox(height: 12),
                const Text(
                  'Créer un compte',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Rejoignez DEVMOB SupportClient',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 24),

                // Nom et prénom
                CustomTextField(
                  controller: _nameCtrl,
                  hint: 'Nom et prénom',
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: Validators.fullName,
                ),
                const SizedBox(height: 14),

                // E-mail
                CustomTextField(
                  controller: _emailCtrl,
                  hint: 'E-mail',
                  icon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validators.email,
                ),
                const SizedBox(height: 14),

                // Mot de passe
                CustomTextField(
                  controller: _passCtrl,
                  hint: 'Mot de passe',
                  icon: Icons.lock,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  validator: Validators.password,
                ),
                const SizedBox(height: 14),

                // Confirmation (rebuild via ListenableBuilder pour comparer au mot de passe)
                ListenableBuilder(
                  listenable: _passCtrl,
                  builder: (_, __) => CustomTextField(
                    controller: _confirmCtrl,
                    hint: 'Confirmer le Mot de passe',
                    icon: Icons.lock,
                    isPassword: true,
                    validator: Validators.confirmPassword(_passCtrl.text),
                  ),
                ),
                const SizedBox(height: 20),

                // Je suis...
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.group, size: 18, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text(
                        'Je suis...',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RoleCard(
                        icon: Icons.school,
                        title: 'Client',
                        subtitle: '(Étudiant)',
                        selected: _role == UserRole.client,
                        onTap: () => setState(() => _role = UserRole.client),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RoleCard(
                        icon: Icons.headset_mic_outlined,
                        title: 'Support',
                        subtitle: '(Administrateur)',
                        selected: _role == UserRole.support,
                        onTap: () => setState(() => _role = UserRole.support),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Conditions d'utilisation
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _accepted,
                        activeColor: AppColors.primary,
                        onChanged: (v) => setState(() {
                          _accepted = v ?? false;
                          if (_accepted) _termsError = false;
                        }),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: ouvrir les conditions d'utilisation
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "J'accepte les ",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: "conditions d'utilisation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_termsError)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Vous devez accepter les conditions d'utilisation",
                        style: TextStyle(color: Colors.red, fontSize: 11),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                PrimaryButton(
                  label: 'Créer mon compte',
                  isLoading: _loading,
                  onPressed: _submit,
                ),
                const SizedBox(height: 14),
                const OrDivider(),
                const SizedBox(height: 14),
                const GoogleButton(),
                const SizedBox(height: 14),

                // Déjà un compte ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Déjà un compte ? ',
                        style: TextStyle(fontSize: 12)),
                    GestureDetector(
                      onTap: _goToLogin,
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}