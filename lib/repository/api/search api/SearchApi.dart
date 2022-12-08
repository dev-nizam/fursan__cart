import 'dart:convert';


import 'package:fursan_cart/model/search/SearchModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';

class SearchApi {
  ApiClient apiClient = ApiClient();
  Future<List<SearchModel>> getSearch(String Products) async {
    String path = "/product/search?s=";
    Response response = await apiClient.invokeAPI(
        path: path + Products, method: "GET", body: null);
    print(response.body);
    return SearchModel.listFromJson(json.decode(response.body));
  }
}
