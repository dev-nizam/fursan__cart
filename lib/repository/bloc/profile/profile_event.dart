part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class FatchProfile extends ProfileEvent {
  String id;
  FatchProfile({required this.id});
}
class FatchProfileEdit extends ProfileEvent {
  String id;
  FatchProfileEdit({required this.id});
}