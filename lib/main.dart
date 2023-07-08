import 'package:bloc/bloc.dart';
import 'package:course_app/common/routes/pages.dart';
import 'package:course_app/common/routes/routes.dart';
import 'package:course_app/common/values/colors.dart';
import 'package:course_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  //Call the Global Method
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Comment

  @override
  Widget build(BuildContext context) {
    // dependency injection
    return MultiBlocProvider(
                    //This is to Cast All The block Providers in App Pages class
              //These 3 below dots is to access them here
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375,812),
        builder: (context, child) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This App bar will be in all of the app
            appBarTheme:const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              backgroundColor: Colors.white,
              elevation: 0,

            ),
          ),
          // home: WelcomePage(),
           onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}

