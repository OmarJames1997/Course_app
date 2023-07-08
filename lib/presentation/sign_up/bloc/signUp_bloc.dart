import 'package:course_app/presentation/sign_up/bloc/signUp_events.dart';
import 'package:course_app/presentation/sign_up/bloc/signUp_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents,SignUpStates>{
   SignUpBloc():super( const SignUpStates()){
     on<UserNameEvents>(_userNameEvents);
     on<EmailEvents>(_emailEvents);
     on<PasswordEvents>(_passwordEvents);
     on<RePasswordEvents>(_rePasswordEvents);
   }

   void _userNameEvents(UserNameEvents event,Emitter<SignUpStates> emit){
     print('${event.userName}');
      emit(state.copyWith(userName: event.userName));
   }
   void _emailEvents(EmailEvents event,Emitter<SignUpStates> emit){
      emit(state.copyWith(email: event.email));
   }
   void _passwordEvents(PasswordEvents event,Emitter<SignUpStates> emit){
      emit(state.copyWith(password: event.password));
   }
   void _rePasswordEvents(RePasswordEvents event,Emitter<SignUpStates> emit){
      emit(state.copyWith(rePassword: event.rePassword));
   }
}