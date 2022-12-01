part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class FetchLogin extends SigninEvent {
  String Email;
  String password;
  FetchLogin({required this.Email, required this.password});
}

class FetchToken extends SigninEvent {
  // String number;
  // String password;
  // FetchLogin({required this.number, required this.password});
}
class FacebookLogin extends SigninEvent{

}
class GoogleLogin extends SigninEvent{

}