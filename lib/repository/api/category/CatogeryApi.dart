import 'dart:convert';


import 'package:fursan_cart/model/category/CatogeryModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class CatogeryApi {
  ApiClient apiClient = ApiClient();
  String basePath = "/category/all";
  Future<List<CatogeryModel>> getCatogery() async {
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print(response.body);
    return CatogeryModel.listFromJson(json.decode(response.body));
  }
}
