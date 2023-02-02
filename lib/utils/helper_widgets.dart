import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getinfinitybox/utils/text_styles.dart';

import 'colors.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

customToast({
  required text,
  required isLong,
}) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

dynamic loading(
    {@required bool? value, String? title, bool closeOverlays = false}) {
  if (value!) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..maskColor = Colors.blue.withOpacity(.2)

      /// custom style
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.blue
      ..indicatorColor = Colors.blue
      ..backgroundColor = AppColors.white
      ..textColor = Colors.black
      ..textStyle = AppTextStyles.dmSans.copyWith(fontWeight: FontWeight.w500)

      ///
      ..userInteractions = false
      ..animationStyle = EasyLoadingAnimationStyle.offset
      ..dismissOnTap = false;
    EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
      status: "Loading...",
      dismissOnTap: false,
    );
  } else {
    EasyLoading.dismiss();
  }
}
