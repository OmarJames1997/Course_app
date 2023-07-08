import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRegisterButton(
{required String buttonName,
  void Function()? func,}
    ) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      width: 375.w,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: 40.h,
      ),
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: AppColors.primaryFourElementText),),
      child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 14.sp,
            ),
          )),
    ),
  );
}
