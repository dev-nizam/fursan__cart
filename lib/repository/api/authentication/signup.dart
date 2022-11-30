import 'dart:convert';

import 'package:fursan_cart/model/user/SignupModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:http/http.dart';

class ApiSignUp {
  ApiClient apiClient = ApiClient();
  SignupModel modelClassSignUp = SignupModel();
  final String signUpPath = "/auth/local/user/sign-up";
  Future<SignupModel> getSignup(
      {required username,
        required email,
        required password,
      }) async {
    final body = {
      "username": username,
      "email": email,
      "password": password,
    };
    Response response = await apiClient.invokeAPI(
        path: signUpPath, method: "POST", body: body);
    return SignupModel.fromJson(json.decode(response.body));
  }
}