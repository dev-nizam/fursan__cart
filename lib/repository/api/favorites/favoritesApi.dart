import 'dart:convert';



import 'package:fursan_cart/model/favorites/FavoriteModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiFavorites {
  ApiClient apiClient = ApiClient();
  final String basePath = "/product/wishlist/";
  Future<FavoriteModel> GetFavorites(String userid,String productid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String path = '/product/wishlist/${prefs.getString('userId')}';
    Response response =
    await apiClient.invokeAPI(path: path, method: 'GET', body: null);
    return FavoriteModel.fromJson(jsonDecode(response.body));
  }
  Future<FavoriteModel> GetFavoritesview() async {
    print(">>>>>>>>>>>>>>>ApiFavorite Loaded>>>>>>>>");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String path = '/product/wishlist/get';
    Response response =
    await apiClient.invokeAPI(path: path, method: 'GET', body: null);
    return FavoriteModel.fromJson(jsonDecode(response.body));
  }
}
