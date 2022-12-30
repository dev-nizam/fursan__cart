import 'dart:convert';



import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';
import 'package:fursan_cart/model/favorites/FavoritesModelId.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiFavorites {
  ApiClient apiClient = ApiClient();
  // final String basePath = "/product/wishlist/";
  Future <FavoritesModelId> GetFavorites( productid) async {
print(productid);


    SharedPreferences prefs = await SharedPreferences.getInstance();

    String path = "/product/wishlist/add";
    Response response =
    await apiClient.invokeAPI(path: path, method: 'POST', body:{
      "productId": productid,
      "userId": prefs.getString("userId")
      // "token": preference.getString("token"),
    });

    return FavoritesModelId.fromJson(jsonDecode(response.body));
  }

  Future<List<FavoriteModel>> GetFavoritesview() async {
    String basePath = "/product/wishlist/get";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    return FavoriteModel.listFromJson(json.decode(response.body));
  }
  Future< ProductDetailsModel> getFavouritesProductDetails(String productssId) async {
    print("FavouritesProductDetails Api working");
    String basePath = "/product/$productssId";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print(response.body);
    return ProductDetailsModel.fromJson(jsonDecode(response.body));
  }
}

