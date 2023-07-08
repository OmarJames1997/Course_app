import 'package:course_app/common/routes/names.dart';
import 'package:course_app/common/routes/routes.dart';
import 'package:course_app/common/values/constants.dart';
import 'package:course_app/presentation/application_pages/bloc/app_bloc.dart';
import 'package:course_app/presentation/application_pages/bloc/app_event.dart';
import 'package:course_app/presentation/application_pages/profile/settings/bloc/settingsBlocs.dart';
import 'package:course_app/presentation/application_pages/profile/settings/bloc/settingsStates.dart';
import 'package:course_app/presentation/application_pages/profile/settings/widgets/settings_widgets.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeData(){
    // to Remove any State till it Reaches SignIn Page
    context.read<SignInBloc>().add(ResetSignInEvent());

    // To Reset the Index once Logged Out
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    // Push to the SignInPage
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
    // Remove The User Token Key to log out
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context,removeData) ,
              ],
            ),
          );
        },
      )),
    );
  }
}
