import 'package:course_app/common/routes/routes.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:course_app/common/values/constants.dart';
import 'package:course_app/global.dart';
import 'package:course_app/presentation/sign_in/sign_in_page.dart';
import 'package:course_app/presentation/welocme/bloc/welcome_blocs.dart';
import 'package:course_app/presentation/welocme/bloc/welcome_events.dart';
import 'package:course_app/presentation/welocme/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _WelcomePageController = PageController(initialPage: 0,);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
          body: BlocBuilder<WelcomeBlocs, WelcomeStates>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 45.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: _WelcomePageController,
                      onPageChanged: (index) {
                        state.page = index;
                        // To update the bloc with the new value with add() method
                        BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvent());
                      },
                      scrollDirection: Axis.horizontal,
                      children: [
                        _pages(
                          index: 1,
                          title: 'This is the First Page',
                          buttonName: 'Next',
                          context: context,
                          imagePath: 'assets/images/reading.png',
                          subText: 'This is the first Sub text in the first page ',
                        ),
                        _pages(
                          index: 2,
                          title: 'This is the Second Page',
                          buttonName: 'Next',
                          context: context,
                          imagePath: 'assets/images/boy.png',
                          subText: 'This is the second Sub text in the first page ',),

                        _pages(
                          index: 3,
                          title: 'This is the third Page',
                          buttonName: 'Get Started',
                          context: context,
                          imagePath: 'assets/images/man.png',
                          subText: 'This is the Third Sub text in the first page ',)

                      ],
                    ),
                    Positioned(
                        bottom: 120.h,
                        child: DotsIndicator(
                          // Which Position Should  be Alligned
                          position: state.page,
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: AppColors.primaryThreeElementText,
                              activeColor: AppColors.primaryElement,
                              size: const Size.square(8.0),
                              activeSize: const Size(18, 8.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                        )),

                  ],
                ),
              );
            },)
      ),
    );
  }

  Widget _pages({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subText,
    required String imagePath}) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 375.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(title,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal)),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(subText,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal)),
        ),
        // Button injection
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _WelcomePageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 700),
                curve: Curves.linear,);
            } else {
              // To make the app memorise these pages and cache them
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              // Pushed to Sign in Page after 3 pages
                Navigator.of(context).pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            width: 375.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }
}
