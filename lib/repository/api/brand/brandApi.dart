import 'dart:convert';

import 'package:fursan_cart/model/brand/BrandModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class ApiBrand {
  ApiClient apiClient = ApiClient();
  String basePath = "/brand/all";
  Future<List<BrandModel>> getBrand() async {
    print("brand api worcking>>>>>");
    Response response = await apiClient.invokeAPI(
        path: basePath, method: "GET", body: null);
    print(response.body);
    return BrandModel.listFromJson(json.decode(response.body));
  }
}