import 'package:course_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/base_text.dart';

AppBar buildSettingsAppBar(){
  return  AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Container(
        child: reusableText(text: 'Settings'),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function() removeFunction){
  return GestureDetector(
    onTap: () {
      // showDialog ,Shows a Small Dialog with alot of Properties , Returns AlertDialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Do you still want to Log out'),
            actions: [
              TextButton(
                // To return back to the settings Page
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: removeFunction,
                  child: const Text('Confirm Logout')),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/icons/Logout.png',
              ))),
    ),
  );
}