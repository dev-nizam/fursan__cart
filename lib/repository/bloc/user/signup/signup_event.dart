part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class FetchSignUp extends SignupEvent {
  final String userName;
  final String email;
  final String password;

  FetchSignUp(
      {required this.userName,
        required this.email,
        required this.password,});
}
