import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_Events.dart';
import 'init_state.dart';

class AppBloc extends Bloc<AppEvents,AppStates>{
  AppBloc():super(InitStates()){
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter+1));
      print(state.counter);
    });
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter-1));
      print(state.counter);
    });
  }
  

}

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>((event ,emit){
      emit(WelcomeState(page : state.page));
    });
  }
}


class SignInBloc extends Bloc<SigninEvent,SigninState>{
  SignInBloc():super(SigninState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    print('${event.password}');
    emit(state.copyWith(password: event.password));
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    print('${event.email}');
    emit(state.copyWith(email: event.email));
  }
}