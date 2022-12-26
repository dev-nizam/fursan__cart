part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}
class  FavoriteLoading extends FavoritesState {}
class  FavoriteLoaded extends FavoritesState {}
class  FavoriteError extends FavoritesState {}