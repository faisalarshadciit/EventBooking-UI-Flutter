import 'package:fluttertoast/fluttertoast.dart';
import 'package:event_book_app/constants/app_colors.dart';

class ToastMethod {
  ToastMethod._();

  // region Success Toast
  static void successToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.kSuccessToastColor,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
  // endregion

// region Error Toast
  static void errorToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.kRedCardColor,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
// endregion

// region Simple Toast
  static void simpleToastMessages(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
// endregion
}
