import 'dart:convert';


import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class ApiBanner {
  ApiClient apiClient = ApiClient();
  String basePath = "/banner/all";
  Future<List<BannerModel>> getBanner() async {
    print("api worcking>>>>>");
    Response response = await apiClient.invokeAPI(
        path: basePath, method: "GET", body: null);

    return BannerModel.listFromJson(json.decode(response.body));
}
}