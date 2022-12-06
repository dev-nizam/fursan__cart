import 'dart:convert';

import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class ProductDetailsApi {
  ApiClient apiClient = ApiClient();
  String basePath = "/product/all?tag=trending";
  Future<List<ProductDetailsModel>> getProductDetails() async {
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    return ProductDetailsModel.listFromJson(json.decode(response.body));
  }
}
