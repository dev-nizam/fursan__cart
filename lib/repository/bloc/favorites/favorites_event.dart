part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}
class Fetchfavorites extends FavoritesEvent {
  final  productid;


  Fetchfavorites( this.productid);
}
class Fetchfavoritesview extends FavoritesEvent {
  }
class FetchFavouritesProductDetails extends FavoritesEvent {
  final productssId;
  FetchFavouritesProductDetails( this.productssId);
}