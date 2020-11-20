String validatePassword(value) {
  if (value.isEmpty) {
    return '*required';
  } else if (value.toString().length < 6) {
    return 'password too short';
  } else {
    return null;
  }
}

String validateEmail(value) {
  if (value.isEmpty) {
    return '*required';
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Invalid email format';
  } else {
    return null;
  }
}
