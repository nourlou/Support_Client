class Validators {
  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'E-mail obligatoire';
    final ok = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$').hasMatch(v.trim());
    return ok ? null : 'E-mail invalide';
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Mot de passe obligatoire';
    if (v.length < 6) return 'Minimum 6 caractères';
    return null;
  }
}