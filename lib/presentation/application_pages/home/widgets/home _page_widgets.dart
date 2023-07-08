import 'package:course_app/common/values/colors.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_blocs.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_events.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/base_text.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/icons/person.png'),
              )),
            ),
          ),
        ],
      ),
    ),
  );
}

// Reusable text widgets
Widget homePageTexts(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(
              color: AppColors.primaryFourElementText,
            )),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.h),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // This to Grab the Value from the user to check
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  // To Center the Content in the bar
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  hintText: 'Search Your Course',
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  // The below Borders to Adjust the borders as the main container has borders too
                  // so this is to seprate the above border
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          margin: EdgeInsets.only(left: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
            color: AppColors.primaryElement,
          ),
          child: Image.asset(
            'assets/icons/options.png',
          ),
        ),
      ),
    ],
  );
}

// For Sliders view

Widget slidersView(BuildContext context, HomePageStates states) {
  return Column(
    children: [
      //Sliders
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            // Reading the bloc to add the Event
            context.read<HomePageBlocs>().add(HomepageDots(value));
          },
          children: [
            _sliderContainer(imagePath: 'assets/icons/Art.png'),
            _sliderContainer(imagePath: 'assets/icons/Image(1).png'),
            _sliderContainer(imagePath: 'assets/icons/Image(2).png'),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: states.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              )),
        ),
      ),
    ],
  );
}

//Sliders Widget

Widget _sliderContainer({String imagePath = 'assets/icons/Art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            imagePath,
          )),
    ),
  );
}

// menu view to show items

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(
          top: 15.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText(text: 'Choose your course'),
            GestureDetector(
              onTap: () {},
              child: reusableText(
                text: 'See All',
                color: AppColors.primaryThreeElementText,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 18.w),
        child: Row(
          children: [
            _reusableMenuText('All'),
            _reusableMenuText('Popular',textColor: AppColors.primaryThreeElementText,backgroundColor: Colors.white),
            _reusableMenuText('Newest',textColor: AppColors.primaryThreeElementText,backgroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}




Widget _reusableMenuText(String text,{Color textColor=AppColors.primaryElementText,Color backgroundColor=AppColors.primaryElement}){
  return Container(
    margin: EdgeInsets.only(top: 18.w),
    child: Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.only(
          left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(7.w)),
        // border: Border.all(color: AppColors.primaryElement),
      ),
      child: reusableText(
        text: text,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 11,
      ),
    ),
  );
}

// For Course gridView
Widget courseGrid(){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/icons/Image(2).png')
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          'Best Course For IT and Engineering',style: TextStyle(
          fontSize: 11.sp,
          color: AppColors.primaryElementText,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          'Flutter Best Course',style: TextStyle(
          fontSize: 8.sp,
          color: AppColors.primaryFourElementText,
          fontWeight: FontWeight.normal,
        ),
        ),
      ],
    ),
  );
}




