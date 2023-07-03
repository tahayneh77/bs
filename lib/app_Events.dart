class AppEvents{}

class Increment extends AppEvents{}
class Decrement extends AppEvents{}

class WelcomeEvent{}

abstract class SigninEvent {
  const SigninEvent();
}

class EmailEvent extends SigninEvent{
  final String email;
  const EmailEvent(this.email);
}
class PasswordEvent extends SigninEvent{
  final String password;
  const PasswordEvent(this.password);
}