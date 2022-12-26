import 'dart:convert';

import 'package:fursan_cart/model/favorites/FavoritesModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiFavorites {
  ApiClient apiClient = ApiClient();
  final String basePath = "/product/wishlist/";
  Future<FavoritesModel> GetFavorites(String userid,String productid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String path = '/product/wishlist/${prefs.getString('userId')}';
    Response response =
    await apiClient.invokeAPI(path: path, method: 'GET', body: null);
    return FavoritesModel.fromJson(jsonDecode(response.body));
  }
}
