import 'package:course_app/presentation/welocme/bloc/welcome_events.dart';
import 'package:course_app/presentation/welocme/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBlocs extends Bloc<WelcomeEvent,WelcomeStates>{
   WelcomeBlocs():super(WelcomeStates()){
     // Register the Event with On method and add the Event as a generic Type
     on<WelcomeEvent>((event, emit) {
       // to Make it Reactive will use emit(); , To access the states will use //state.//
       emit(WelcomeStates(page: state.page));
     },);
   }

}