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

  /// Nom et prénom (au moins 2 caractères)
  static String? fullName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Nom et prénom obligatoires';
    if (v.trim().length < 2) return 'Nom trop court';
    return null;
  }

  /// Confirmation : doit être identique au mot de passe saisi
  static String? Function(String?) confirmPassword(String original) {
    return (String? v) {
      if (v == null || v.isEmpty) return 'Confirmation obligatoire';
      if (v != original) return 'Les mots de passe ne correspondent pas';
      return null;
    };
  }
}