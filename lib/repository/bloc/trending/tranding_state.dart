part of 'tranding_bloc.dart';

@immutable
abstract class TrandingState {}

class TrandingInitial extends TrandingState {}
class TrandingLoading extends TrandingState {}
class TrandingLoaded extends TrandingState {}
class TrandingError extends TrandingState {}
