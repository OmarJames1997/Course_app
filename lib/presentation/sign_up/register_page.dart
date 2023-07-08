import 'package:course_app/presentation/sign_in/widgets/sign_in_widgets.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_bloc.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_events.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_states.dart';
import 'package:course_app/presentation/sign_up/register_controller.dart';
import 'package:course_app/presentation/sign_up/widgets/sign_up_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc,SignUpStates>(
      builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: BuildAppBar(appBarName: 'Sign Up',pageType: ''),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7.h),
                  Center(
                      child: reusableText(
                        'Enter your details below to sign up',
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text Fields for email and passwords
                        reusableText('Full Name'),
                        BuildTextField(
                            'Enter your Full Name', 'email', 'user',
                                (value) {
                              // This method is to Grab the Value from the Component
                              // add value to the email events and then it gets triggered
                              context.read<SignUpBloc>().add(UserNameEvents(value));
                            }),
                        SizedBox(
                          height: 5.h,
                        ),
                        reusableText('Email'),
                        SizedBox(
                          height: 5.h,
                        ),
                        BuildTextField(
                            'Enter your email Address', 'email', 'user',
                                (value) {
                              // This method is to Grab the Value from the Component
                              // add value to the email events and then it gets triggered
                              context.read<SignUpBloc>().add(EmailEvents(value));
                            }),
                        reusableText('Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        BuildTextField(
                          'Enter your Password', 'password', 'lock',(value) {
                          context.read<SignUpBloc>().add(PasswordEvents(value));

                        },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        reusableText('Confirm Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        BuildTextField(
                          'Confirm Your password here', 'password', 'lock',(value) {
                          context.read<SignUpBloc>().add(RePasswordEvents(value));

                        },
                        ),

                      ],
                    ),
                  ),
                  reusableText('By Filling the above form you agree on the terms and conditions'),
                  buildRegisterButton(buttonName: 'Sign Up',func: () {

                    RegisterController(context: context).handleEmailRegister();
                  },),
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}
