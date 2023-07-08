import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar BuildAppBar({required String appBarName,required String pageType}) {
  return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Center(
        child: Container(
          padding: EdgeInsets.only(right:pageType=='Login'?0:50.w,),
          child: Text(
            appBarName,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
          ),
        ),
      ));
}

// We need Context to be Passed as a Paramter for the Bloc
Widget BuildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 24.h,
      ),
      padding: EdgeInsets.only(left: 65.w, right: 65.w,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('apple'),
          _reusableIcons('facebook'),
        ],
      ),
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        'assets/icons/$iconName.png',
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(left: 10.w,bottom: 5.h),
    child: Text(text,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey.withOpacity(0.6))),
  );
}

Widget BuildTextField(String hintText, String textType, String iconName,void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 15.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        // Icon and Container
        Container(
          width: 20.w,
          height: 20.w,
          margin: EdgeInsets.only(left: 10.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),

        // TextField
        Container(
          width: 270.w,
          height: 50.w,
          child: TextField(
            // This to Grab the Value from the user to check
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              // The below Borders to Adjust the borders as the main container has borders too
              // so this is to seprate the above border
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget ForgetPassword(String pageType,) {
  return Container(
    width: 260.w,
    height: pageType=='login'?44.h:7.h,
    margin: EdgeInsets.only(left: 30.w),
    child: GestureDetector(
      onTap: () {},
      child:  Text(
        // Conditions to separate
        pageType=='login'?'Forget Password':'',
        style:const TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            decorationThickness: 1.3),
      ),
    ),
  );
}

Widget buildLoginAndRegisterButton(
  String buttonName,
  String buttonType,
    void Function()? func,
) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      width: 375.w,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == 'Login' ? 40.h : 20.h,
      ),
      decoration: BoxDecoration(
          color: buttonType == 'Login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: buttonType == 'Login'
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.5))
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
          color: buttonType == 'Login'
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontSize: 14.sp,
        ),
      )),
    ),
  );
}
