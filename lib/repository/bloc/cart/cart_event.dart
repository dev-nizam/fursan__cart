part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class FetchCartAdd extends CartEvent{
  final String  productid;
  final String productprice;
  final String  productquantity;


FetchCartAdd({required this.productid,required this.productquantity, required this.productprice} );
}
class FetchCartView extends CartEvent {
}
// class FetchFavouritesProductDetails extends CartEvent {
//   final productssId;
//   FetchFavouritesProductDetails( this.productssId);
// }