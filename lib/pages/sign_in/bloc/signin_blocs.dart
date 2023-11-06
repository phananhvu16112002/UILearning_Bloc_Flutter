import 'package:bloc_app/pages/sign_in/bloc/signin_events.dart';
import 'package:bloc_app/pages/sign_in/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInStates> {
  SignInBlocs() : super(const SignInStates()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void_passwordEvent(PasswordEvent event, Emitter<SignInStates> emit){
    emit(state.copyWith(password: event.password));
  }


}
