import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showErrorToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.ERROR_COLOR,
    textColor: AppColors.BACKGROUND_COLOR,
    toastLength: Toast.LENGTH_LONG,
  );
}