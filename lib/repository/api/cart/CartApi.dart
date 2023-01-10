import 'dart:convert';



import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/cart/CartAddModel.dart';
import 'package:fursan_cart/model/cart/CartViewModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';
import 'package:fursan_cart/model/favorites/FavoritesModelId.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCart {
  ApiClient apiClient = ApiClient();
  Future <CartAddModel> GetCartAdd({required productid,required price,required quantity} ) async {
    print(productid);


    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map body =  {
      "totalPrice": price,
      "userId":prefs.getString("userId"),
      "items":[
        {
          "productId":productid,
          "price":price,
          "quantity":int.parse(quantity)
        }

      ]

    };
    String path = "/product/add-to-cart";
    Response response =
    await apiClient.invokeAPI(path: path, method: 'POST', body:body);

    return CartAddModel.fromJson(jsonDecode(response.body));
  }

  // Future<List<FavoriteModel>> GetFavoritesview() async {
  //   String basePath = "/product/wishlist/get";
  //   Response response =
  //   await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
  //   return FavoriteModel.listFromJson(json.decode(response.body));
  // }
  Future< CartViewModel> getCartView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString("userId")!;
    print("CartView Api working");
    String basePath = "/product/cart/$userid";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print(response.body);
    return CartViewModel.fromJson(jsonDecode(response.body));
  }

}

