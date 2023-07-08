import 'package:course_app/presentation/application_pages/bloc/app%20states.dart';
import 'package:course_app/presentation/application_pages/bloc/app_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent,AppStates>{
  AppBlocs():super(const AppStates()){
    on<TriggerAppEvent>(_triggerAppEvent);
  }
  void _triggerAppEvent(TriggerAppEvent event,Emitter<AppStates> emit){
    emit(AppStates(index: event.index));
  }

}