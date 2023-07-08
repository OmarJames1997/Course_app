

import 'package:course_app/common/routes/names.dart';
import 'package:course_app/common/routes/routes.dart';
import 'package:course_app/global.dart';
import 'package:course_app/presentation/application_pages/application_page.dart';
import 'package:course_app/presentation/application_pages/bloc/app_bloc.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_blocs.dart';
import 'package:course_app/presentation/application_pages/home/home_screen.dart';
import 'package:course_app/presentation/application_pages/profile/settings/bloc/settingsBlocs.dart';
import 'package:course_app/presentation/application_pages/profile/settings/settings_page.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:course_app/presentation/sign_in/sign_in_page.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_bloc.dart';
import 'package:course_app/presentation/sign_up/register_page.dart';
import 'package:course_app/presentation/welocme/bloc/welcome_blocs.dart';
import 'package:course_app/presentation/welocme/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Combine and Unify BlockProvidr and Pages and Routes at the Main Page.dart
class AppPages {
  static List<PageEntity> routes (){
    return  [
      PageEntity(
        route:AppRoutes.Intial,
        page:const WelcomePage(),
        bloc:BlocProvider(create: (_) => WelcomeBlocs() ,),),
      PageEntity(
        route:AppRoutes.SIGN_IN,
        page:const SignInPage(),
        bloc:BlocProvider(create: (_) => SignInBloc() ,),),
      PageEntity(
        route:AppRoutes.SIGN_UP,
        page:const RegisterScreen(),
        bloc:BlocProvider(create: (_) => SignUpBloc() ,),),
      PageEntity(
        route:AppRoutes.APPLICATION,
        page:const ApplicationPage(),
        bloc:BlocProvider(create: (_) => AppBlocs() ,),),
      PageEntity(
        route:AppRoutes.HOME_PAGE,
        page:const HomePage(),
        bloc:BlocProvider(create: (_) => HomePageBlocs(),),),
      PageEntity(
        route:AppRoutes.SETTINGS,
        page:const SettingsPage(),
        bloc:BlocProvider(create: (_) => SettingsBlocs(),),),
    ];
  }

      // function to Return all the block providers after looping on each item in the dynamic list
      // Called in main.dart
      static List<dynamic> allBlocProviders(BuildContext context) {
    // Initialize list of blocProviders for the Multi block provider in main

      List<dynamic> blocProviders =<dynamic>[];
      for(var blocs in routes()){
          blocProviders.add(blocs.bloc);
        }
        return blocProviders;
  }


      // Function to generate and loop on all routes from settings
      //        It Detects which Navigator is triggered in UI
      //                  onGenerateRoute Parameter in main
      static MaterialPageRoute generateRouteSettings(RouteSettings settings){
        if(settings.name != null){

          // checks if the routes are triggered after checking if it exist in the routes method above
          var result=routes().where((element) => element.route==settings.name);

          // Condition to cache the local storage for storageServices
          if(result.isNotEmpty){

            // Shared Preferences to unify with which Page not to show again
            bool deviceFirstOpen=Global.storageService.getDeviceFirstOpen();

            // If Condtion to Check if user has opened the app before or not
            if(result.first.route==AppRoutes.Intial&& deviceFirstOpen){

              // Variable to save if user logged in before or not
              bool isLoggedIn =Global.storageService.getIsLoggedIn();

              // Go to Application once logged in once
              if(isLoggedIn){
                return MaterialPageRoute(builder: (_)=>const ApplicationPage());
              }

            return MaterialPageRoute(builder: (_)=>const SignInPage(),settings: settings);

            }
            return MaterialPageRoute(builder: (_) => result.first.page, settings: settings );
          }

        }
        return MaterialPageRoute(builder: (_)=>const SignInPage(),settings: settings,);
      }
}

class PageEntity {

  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}




