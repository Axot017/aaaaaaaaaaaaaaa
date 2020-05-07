import 'package:aaaaaaaaaaaaaaa/utils/toast_util.dart';
import 'extentions/string_ext.dart';

bool validateLogin(String email, String password) {
  if (email.isEmpty || password.isEmpty) {
    showErrorToast('Fields cannot be empty');
  } else if (!email.isEmail) {
    showErrorToast('Email is not valid');
  } else {
    return true;
  }
  return false;
}

bool validateRegistration(String email, String password, String repeatPassword) {
  if (email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
    showErrorToast('Fields cannot be empty');
  } else if (!email.isEmail) {
    showErrorToast('Email is not valid');
  } else if (!password.isValidPassword) {
    showErrorToast('Password is to short. (min. 8 chars)');
  } else if (password != repeatPassword) {
    showErrorToast('Passwords are different');
  } else {
    return true;
  }

  return false;
}