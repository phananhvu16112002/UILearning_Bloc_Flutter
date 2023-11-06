import 'package:bloc_app/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeStates>{
  WelcomeBloc():super(WelcomeStates()){
    on<WelcomeEvent>((event,emit){
      emit(WelcomeStates(page:state.page));
    });
  }
}