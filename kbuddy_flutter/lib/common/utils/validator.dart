class Validator {
  static bool hasMinLength(String password){
    return password.length >= 8;
  }

  // name & pwd
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

  static bool isMinLengthId(String text){
    return text.length >= 3;
  }
  static bool isMaxLengthId(String text){
    return text.length <= 20;
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

}