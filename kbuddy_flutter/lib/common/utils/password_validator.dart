class PasswordValidator {
  static bool hasMinLength(String password){
    return password.length >= 8;
  }

  static bool isMaxLength(String password){
    return password.length <= 30;
  }

  static bool hasDigit(String password){
    return password.contains(RegExp(r'\d'));
  }

  static bool hasUpperCase(String password){
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool hasLowerCase(String password){
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool hasSpecialChar(String password){
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool passwordsMatch(String password, String confirmPassword){
    return password == confirmPassword;
  }
}