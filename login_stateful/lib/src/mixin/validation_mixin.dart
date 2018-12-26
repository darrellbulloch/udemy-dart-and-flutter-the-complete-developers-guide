class ValidationMixin {
  // Return null if valid; otherwise a string with error message
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Return null if valid; otherwise a string with error message
  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least four (4) characters.';
    }

    return null;
  }
}
