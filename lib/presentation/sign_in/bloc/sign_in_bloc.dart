import 'package:course_app/presentation/sign_in/bloc/sign_in_events.dart';
import 'package:course_app/presentation/sign_in/bloc/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  SignInBloc() : super(SignInStates()) {
    on<EmailEvent>(_emailEvent); //email event handler
    on<PasswordEvent>(_passwordEvent);//password event handler
    on<LoadingEvent>(_loadingEvent);//password event handler
    on<ResetSignInEvent>(_resetStates);//password event handler
    on<SignInErrorEvent>(_errorHandling);//password event handler
  }

  void _emailEvent(
      // Constructors for Specefic Event Triggered with its Emitter
    EmailEvent event,
    Emitter<SignInStates> emit,
  ) {
    emit(state.copyWith(email: event.email));// Where we Emit the state to be called in UI
  }

  void _passwordEvent(
    PasswordEvent event,
    Emitter<SignInStates> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _loadingEvent(LoadingEvent event,Emitter<SignInStates> emit){
    emit(SignInLoadingState());
  }

  void _resetStates(ResetSignInEvent event,Emitter<SignInStates> emit){
    emit(ResetSignInStateState());
  }

  void _errorHandling(SignInErrorEvent event,Emitter<SignInStates> emit){
    emit(SignInErrorState(errorMessage: event.errorMessage));
  }

}
