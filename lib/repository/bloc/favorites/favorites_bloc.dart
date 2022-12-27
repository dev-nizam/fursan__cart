import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';

import 'package:fursan_cart/repository/api/favorites/favoritesApi.dart';


import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  late FavoriteModel favoritesModel;
  ApiFavorites apiFavorites;
  FavoritesBloc(this.apiFavorites) : super(FavoritesInitial()) {
    on<Fetchfavorites>((event, emit)async {
      emit( FavoriteLoading());
      print(">>>>>>>>>>>>>>>FavoriteLoading>>>>>>>>");
      try {
        favoritesModel =
            await apiFavorites.GetFavorites(event.productid,event.userid);
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
  }
}
