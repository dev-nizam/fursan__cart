part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {}
class ProfileError extends ProfileState {}

class ProfileEditLoading extends ProfileState {}
class ProfileEditLoaded extends ProfileState {}
class ProfileEditError extends ProfileState {}