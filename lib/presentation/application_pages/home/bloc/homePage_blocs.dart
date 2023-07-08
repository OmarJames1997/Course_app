import 'package:course_app/presentation/application_pages/home/bloc/homePage_events.dart';
import 'package:course_app/presentation/application_pages/home/bloc/homePage_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageStates>{
  HomePageBlocs():super(HomePageStates()){

    on<HomepageDots>(_homePageDots);
  }
  void _homePageDots(HomepageDots event,Emitter emit){
    emit(state.copywith(index: event.index));

  }



}