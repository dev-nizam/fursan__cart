part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class FatchProfile extends ProfileEvent {
  String id;
  FatchProfile({required this.id});
}
class FatchProfileEditusername extends ProfileEvent {
  String username;

  FatchProfileEditusername({required this.username,});
}
class FatchProfileEditphone extends ProfileEvent {

  String phone;

  FatchProfileEditphone({required this.phone,});
}
class FatchProfileEditemail extends ProfileEvent {
  String email;
  FatchProfileEditemail({required this.email,});
}