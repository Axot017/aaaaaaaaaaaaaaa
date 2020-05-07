final emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final passwordPattern = RegExp(r".{8,}");

extension StringExt on String {
  bool get isEmail => emailPattern.hasMatch(this);

  bool get isValidPassword => passwordPattern.hasMatch(this);
}