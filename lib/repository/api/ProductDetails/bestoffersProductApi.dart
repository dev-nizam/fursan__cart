import 'dart:convert';

import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class BestoffersProductApi {
  ApiClient apiClient = ApiClient();

  Future<List<ProductDetailsModel>> getBestoffersProduct(String tag,String subId) async {
    String basePath = "/product/all?tag=$tag&subId=$subId";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    return ProductDetailsModel.listFromJson(json.decode(response.body));
  }
  Future<List<ProductDetailsModel>> getBrandProduct(String Brandid) async {
    String basePath = "/product/all?brandId=$Brandid";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    return ProductDetailsModel.listFromJson(json.decode(response.body));
  }
}
