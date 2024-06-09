class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    final nameRegExp = RegExp(r'^[A-Za-z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }

    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    }

    if (age < 0) {
      return 'Age cannot be negative';
    }

    if (age < 5 || age > 100) {
      return 'Please enter an age between 5 and 100';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validateContactNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact number is required';
    }
    final contactRegExp = RegExp(r'^\d{10}$');
    if (!contactRegExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit contact number';
    }

    return null;
  }
}
