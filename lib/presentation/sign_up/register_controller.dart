import 'dart:math';

import 'package:course_app/common/widgets/flutter_toast.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  void handleEmailRegister() async {
    // This is to read all the contexts in SignUp bloc
    final state = context.read<SignUpBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePasword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name cant be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email cant be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password cant be empty');
      return;
    }
    if (rePasword.isEmpty) {
      toastInfo(msg: 'Your Password confirmation is Wrong');
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(credentials.user!=null) {
        // to send the user an email verification
        await credentials.user?.sendEmailVerification();

        // To update the user DisplayName
        await credentials.user?.updateDisplayName(userName);
        toastInfo(msg: 'An Email Has been Sent to your registered email to activate it please check your email inbox and click on the linl');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The Password provided is too Weak');
        return;
      }
      if (e.code == 'invalid-email') {
        toastInfo(msg: 'The email format is invalid ');
        return;
      }
      if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email already in use');
        return;
      }
    }
  }
}
