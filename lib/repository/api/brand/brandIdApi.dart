// import 'dart:convert';
//
// import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
// import 'package:fursan_cart/repository/api/Api_Cleint.dart';
// import 'package:http/http.dart';
//
// class ApiBrandId {
//   ApiClient apiClient = ApiClient();
//   String basePath = "/product/all?brandId=";
//   Future<List<ProductDetailsModel>> getBrandId() async {
//     print("brand id api worcking>>>>>");
//     Response response = await apiClient.invokeAPI(
//         path: basePath, method: "GET", body: null);
//     print(response.body);
//     return ProductDetailsModel.listFromJson(json.decode(response.body));
//   }
// }