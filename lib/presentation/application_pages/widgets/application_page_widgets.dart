
// Bottom Nav Bar Building
import 'package:course_app/common/values/colors.dart';
import 'package:course_app/presentation/application_pages/home/home_screen.dart';
import 'package:course_app/presentation/application_pages/profile/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index){
  List<Widget> _widget=[
    const HomePage() ,
    const Center(
        child: Text(
          'Search Page',
          style: TextStyle(color: Colors.black),
        )),
    const Center(
        child: Text(
          'play page',
          style: TextStyle(color: Colors.black),
        )),
    const Center(
        child: Text(
          'Chat Page',
          style: TextStyle(color: Colors.black),
        )),
    const Center(
        child:ProfilePage()),

  ];
  return _widget[index];
}

var bottomTabs=[
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/home.png'),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/home.png',
          color: AppColors.primaryElement),
    )),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/search2.png'),
    ),
    label: 'Search',
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/search2.png',
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    label: 'Play',
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/play-circle1.png',
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset('assets/icons/message-circle.png'),
      ),
      label: 'Chat',
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset('assets/icons/message-circle.png',
            color: AppColors.primaryElement),
      )),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/person2.png'),
    ),
    label: 'Profile',
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset('assets/icons/person2.png',
          color: AppColors.primaryElement),
    ),
  ),
];