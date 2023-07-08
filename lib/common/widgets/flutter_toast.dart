import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
Color backgroundColor = Colors.black,
Color textColor=Colors.white,
}){
  return Fluttertoast.showToast(
      msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor,
    textColor: textColor,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 3,
    fontSize: 16.sp,

  );
}
