part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class FatchProfile extends ProfileEvent {
  String id;
  FatchProfile({required this.id});
}
class FatchProfileEdit extends ProfileEvent {
  String userName;
  String MobileNumber;
  String Email;
  FatchProfileEdit({required this.userName,required this.MobileNumber,required this.Email,});
}