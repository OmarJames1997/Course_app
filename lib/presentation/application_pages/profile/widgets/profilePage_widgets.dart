import 'package:course_app/common/routes/names.dart';
import 'package:course_app/common/routes/routes.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/base_text.dart';

AppBar buildAppBarProfile() {
  return AppBar(
    elevation: 0,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 12.h,
            width: 18.w,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText(text: 'Profile'),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),

  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: const DecorationImage(
            image: AssetImage('assets/icons/headpic.png'))),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

var imageInfo = <String, String>{
  'Settings': 'settings.png',
  'Payment Details': 'credit-card.png',
  'Achievement': 'award.png',
  'Love': 'heart(1).png',
  'Reminders': 'cube.png',
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [

      // Spread Opreator To Generate a list that returns widgets
      ...List.generate(
          imageInfo.length,
          (index) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.h),
                          color: AppColors.primaryElement,
                        ),
                        // This will make the values added dynamically with .elementAt and the index shall be passed form the map
                        child: Image.asset(
                            'assets/icons/${imageInfo.values.elementAt(index)}'),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        imageInfo.keys.elementAt(index),
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}
