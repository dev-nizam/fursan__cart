import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';
import 'package:fursan_cart/model/favorites/FavoritesModelId.dart';

import 'package:fursan_cart/repository/api/favorites/favoritesApi.dart';


import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  late List<FavoriteModel> favoritesModel;
  ProductDetailsModel? productDetailsModel;
  late FavoritesModelId favoritesModelId;
  ApiFavorites apiFavorites;
  FavoritesBloc(this.apiFavorites) : super(FavoritesInitial()) {
    on<Fetchfavorites>((event, emit)async {
      emit( FavoriteLoading());
      print(">>>>>>>>>>>>>>>FavoriteLoading>>>>>>>>");
      try {
        favoritesModelId =
            await apiFavorites.GetFavorites(event.productid);
        emit( FavoriteLoaded());
        print(">>>>>>>>>>>>>>>>FavoriteLoaded>>>>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit( FavoriteError());
      // TODO: implement event handler
    }}
    );
    on<Fetchfavoritesview>((event, emit)async {
      emit( FavoriteLoading());
      print(">>>>>>>>>>>>>>>FavoriteLoading>>>>>>>>");
      try {
        favoritesModel =
        await apiFavorites.GetFavoritesview();
        emit( FavoriteLoaded());
        print(">>>>>>>>>>>>>>>>FavoriteLoaded>>>>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit( FavoriteError());
        // TODO: implement event handler
      }}
    );
    on<FetchFavouritesProductDetails>((event, emit) async {
      emit(FavoriteLoading());
      try {
        productDetailsModel = await apiFavorites.getFavouritesProductDetails(event.productssId);
        emit(FavoriteLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(FavoriteError());
      }
    });

  }
}
