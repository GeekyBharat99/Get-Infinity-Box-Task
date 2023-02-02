extension ExtString on String {
  bool get isValidUserName {
    return length < 2;
  }

  bool get isValidPassword {
    return length < 6;
  }

  bool get isNotNull {
    return this != null;
  }
}
