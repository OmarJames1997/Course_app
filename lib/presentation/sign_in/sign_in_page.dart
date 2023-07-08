import 'package:course_app/common/values/colors.dart';
import 'package:course_app/common/widgets/flutter_toast.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_events.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_states.dart';
import 'package:course_app/presentation/sign_in/sign_in_controller.dart';
import 'package:course_app/presentation/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInStates>(
      builder: (context, state) {
        if (state is SignInLoadingState) {
          // If the state is loading, show the circular progress indicator
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryElement),
            ),
          );
        }
        // else if(State is SignInErrorState){
        //
        // }
        {
          return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: BuildAppBar(appBarName: 'Log In',pageType: 'Login'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildThirdPartyLogin(context),
                    Center(
                        child: reusableText(
                      'Or Use your Email account login',
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          // Text Fields for email and passwords
                          BuildTextField(
                              'Enter your email Address', 'email', 'user',
                              (value) {
                            // This method is to Grab the Value from the Component
                            // add value to the email events and then it gets triggered
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          BuildTextField(
                              'Enter your Password', 'password', 'lock',
                              (value) {
                            // This line is to
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    ForgetPassword('login'),
                    buildLoginAndRegisterButton(
                      'Log In',
                      'Login',
                      () {
                        SignInController(context: context).handleSignIn('email');
                      },
                    ),
                    buildLoginAndRegisterButton('Register', 'Register',() {
                        Navigator.of(context).pushNamed('/register');
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
        }
      },
    );
  }
}
