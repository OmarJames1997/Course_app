import 'package:course_app/presentation/application_pages/profile/settings/bloc/settingsEvents.dart';
import 'package:course_app/presentation/application_pages/profile/settings/bloc/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc <SettingsEvents,SettingsStates>{
  SettingsBlocs():super(const SettingsStates()){
  on<TriggerSeettings>(_triggerSeettings);
  }
     _triggerSeettings(SettingsEvents event,Emitter<SettingsStates> emit){
      emit(const SettingsStates());
  }
}