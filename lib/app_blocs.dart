import 'package:bloc_app/app_events.dart';
import 'package:bloc_app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents,AppState>{
  AppBlocs():super(InitStates()){
    on<Increment>((event,emit){
      emit(AppState(counter: state.counter + 1));
      print(state.counter);
    });

    on<Decrement>((event,emit){
      emit(AppState(counter: state.counter - 1));
    });
  }

  

}