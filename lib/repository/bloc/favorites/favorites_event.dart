part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}
class Fetchfavorites extends FavoritesEvent {
  final dynamic productid;
  final dynamic userid;

  Fetchfavorites({required this.productid, required this.userid});
}
class Fetchfavoritesview extends FavoritesEvent {
  }