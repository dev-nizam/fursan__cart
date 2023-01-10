import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/cart/CartAddModel.dart';
import 'package:fursan_cart/model/cart/CartViewModel.dart';
import 'package:fursan_cart/repository/api/cart/CartApi.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  late CartAddModel cartAddModel;
  late CartViewModel cartViewModel;
  ApiCart apiCart=ApiCart();
  CartBloc() : super(CartInitial()) {
    on<FetchCartAdd>((event, emit)async {
      emit( CartLoading());
      print(">>>>>>>>>>>>>>>FavoriteLoading>>>>>>>>");
      try {
        cartAddModel =
        await apiCart.GetCartAdd( productid: event.productid, price: event.productprice, quantity: event.productquantity,);
        emit( CartLoaded());
        print(">>>>>>>>>>>>>>>>FavoriteLoaded>>>>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit( CartError());
        // TODO: implement event handler
      }}
    );
    on<FetchCartView>((event, emit)async {
      emit( CartLoading());
      print(">>>>>>>>>>>>>>>FavoriteLoading>>>>>>>>");
      try {
        cartViewModel =
        await apiCart.getCartView( );
        emit( CartLoaded());
        print(">>>>>>>>>>>>>>>>FavoriteLoaded>>>>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit( CartError());
        // TODO: implement event handler
      }}
    );
  }
}
