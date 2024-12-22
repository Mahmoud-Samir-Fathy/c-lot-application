
class AppValidator {
  static noValidation() {
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Please enter your email in the right format";
    }
    return null;
  }
  static String? passwordValidation(String? value) {
    final symbolRegex = RegExp(r'[!@#$&*~]');
    final numberRegex = RegExp(r'[0-9]');

    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!numberRegex.hasMatch(value)) {
      return "Password must contain numbers";
    }
    if (!symbolRegex.hasMatch(value)) {
      return "Password must contain symbols";
    }
    return null;
  }

  static String? firstNameValidation(String? name , ) {
    if (name == null || name.isEmpty) {
      return "Please Enter Your First Name";
    }
    return null;
  }
  static String? lastNameValidation(String? name , ) {
    if (name == null || name.isEmpty) {
      return "Please Enter Your Last Name";
    }
    return null;
  }

}