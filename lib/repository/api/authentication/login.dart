import 'dart:convert';

import 'package:fursan_cart/model/user/SigninModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  ApiClient apiClient = ApiClient();
  SigninModel  modelClassLogin = SigninModel();

  final String loginPath = "/auth/local/user/login";
  Future<SigninModel> getLogin({required Email, required password}) async {
    final body = {
      "email": Email,
      "password": password,
    };
    //final body = "{\"mob_no\": \"$mobile\", \"password\": \"$password\"}";

    print("getlogin....");
    Response response =
    await apiClient.invokeAPI(path: loginPath, method: "POST_", body: body);

    print("response worked");
    return SigninModel.fromJson(json.decode(response.body));
  }
}