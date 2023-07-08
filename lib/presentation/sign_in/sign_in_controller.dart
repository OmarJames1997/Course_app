import 'package:course_app/common/values/constants.dart';
import 'package:course_app/common/widgets/flutter_toast.dart';
import 'package:course_app/global.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  // To read the Bloc context
  final BuildContext context;

  const SignInController({required this.context});

  // To be passed as an argument in sign in page

  void handleSignIn(String type,) async {
    context.read<SignInBloc>().add(LoadingEvent());
    try {
      if (type == 'email') {
        // As BlocProvider.of<SignInBloc>(context).state
        // context .read() to read the states inside it
        final state = context.read<SignInBloc>().state;
        //
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          context.read<SignInBloc>().add(SignInErrorEvent('Kindly add an Email'));
          toastInfo(
            msg: 'Kindly add an Email',
          );
          return;
        }
        if (password.isEmpty) {
          context.read<SignInBloc>().add(SignInErrorEvent('Please Enter a Password'));

          toastInfo(
            msg: 'Please Enter a Password',
          );
          return;
        }
        try {
          final credentials =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            // Will pass the Updated Data that are stored from our user
            email: emailAddress,
            password: password,
          );
          if (credentials.user == null) {
            // if user doesnt exist
            context.read<SignInBloc>().add(SignInErrorEvent('User Doesnt Exist'));
            toastInfo(msg: 'User Doesnt Exist',);
            return;
          }
          if (!credentials.user!.emailVerified) {
            // if user is not verified
            toastInfo(
              msg: 'You need to verify your email account',
            );
            return;
          }
          var user = credentials.user;
          if (user != null) {
            // Make the Device Remember that user is logged in
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '123456');

            // we got verified user from firebase and Pushed to Application Page
            Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
            toastInfo(msg: 'Logged in Successfully ',);
          } else {
            // we got error user from firebase
            toastInfo(
              msg: 'Currently you not exist as a user',
            );
          }
        }
        on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            context.read<SignInBloc>().add(SignInErrorEvent('No user found for that email'));
            toastInfo(msg: ' no user found for that email',);
          }
           else if (e.code == 'wrong-password') {
            context.read<SignInBloc>().add(SignInErrorEvent('Wrong password'));
            toastInfo(msg: 'Wrong password');
          }
           else if (e.code == 'invalid-email') {
            context.read<SignInBloc>().add(SignInErrorEvent('Invalid Email'));
            toastInfo(msg: ' Invalid Email');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }


}
