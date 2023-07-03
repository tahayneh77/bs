class AppStates{
  int counter ;
  AppStates({required this.counter});
}
class InitStates extends AppStates{
  InitStates():super(counter:0);
}
class WelcomeState{
  int page;

  WelcomeState({this.page=0});
}

class SigninState {
  final String email;
  final String password;

  SigninState({this.email = "",this.password = ""});

  SigninState copyWith({ String? email , String? password}){
    return SigninState(
      email: email??this.email,
      password: password??this.password
    );
  }
}