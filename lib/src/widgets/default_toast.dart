import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultToast {
  DefaultToast._();

  static Future<bool?> showToast(
    String msg, {
    bool? isError,
    Toast? toastLength,
  }) async {
    return await Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ??
          (msg.length > 60 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT),
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError == true ? CoreColors.red : null,
      textColor: CoreColors.white,
      fontSize: 14.0,
    );
  }
}
