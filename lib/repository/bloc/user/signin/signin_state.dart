part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninLoading extends SigninState {}
class SigninLoaded extends SigninState {
  String Token ;
  SigninLoaded( {required this.Token});
}
class SigninError extends SigninState {}
