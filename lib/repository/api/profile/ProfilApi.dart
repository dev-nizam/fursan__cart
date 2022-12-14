import 'dart:convert';

import 'package:fursan_cart/model/profile/ProfileModel.dart';
import 'package:fursan_cart/repository/api/Api_Cleint.dart';
import 'package:fursan_cart/repository/api/MultiPartFileApiClient.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProfile {
  ApiClient apiClient = ApiClient();
  MultiPartFileApiClient multiPartFileApiClient =MultiPartFileApiClient();

  Future <ProfileModel> getProfil(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id= prefs.getString("id")!;
    String basePath = "/user/$id";

    print("api worcking>>>>>");
    Response response = await apiClient.invokeAPI(
        path: basePath, method: "GET", body: null);

    return ProfileModel.fromJson(jsonDecode(response.body));
  }
  Future <ProfileModel> getProfileEditusername( {required String username,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id= prefs.getString("id")!;
    String basePath = "/user/update/$id";
    // var map = new Map<String, dynamic>();
    // map['phone'] = phone;
    //  map = new Map<String, dynamic>();
    // map["phone"] = phone;
    // Map body = {
    //  "username": username,
    //  "email": email,
    //   "phone": phone,
    // };
    print("api worcking>>>>>");
    Response response = await multiPartFileApiClient.invokeApi(
       filepath:null, basePath: basePath, method: 'PATCH', body: { "username": username,
      });
print(response);
    return ProfileModel.fromJson(jsonDecode(response.body));
  }
  Future <ProfileModel> getProfileEditphone( {required String phone,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id= prefs.getString("id")!;
    String basePath = "/user/update/$id";
    // var map = new Map<String, dynamic>();
    // map['phone'] = phone;
    //  map = new Map<String, dynamic>();
    // map["phone"] = phone;
    // Map body = {
    //  "username": username,
    //  "email": email,
    //   "phone": phone,
    // };
    print("api worcking>>>>>");
    Response response = await multiPartFileApiClient.invokeApi(
        filepath:null, basePath: basePath, method: 'PATCH', body: {
      "phone": phone,});
    print(response);
    return ProfileModel.fromJson(jsonDecode(response.body));
  }
  Future <ProfileModel> getProfileEditemail( {required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id= prefs.getString("id")!;
    String basePath = "/user/update/$id";
    // var map = new Map<String, dynamic>();
    // map['phone'] = phone;
    //  map = new Map<String, dynamic>();
    // map["phone"] = phone;
    // Map body = {
    //  "username": username,
    //  "email": email,
    //   "phone": phone,
    // };
    print("api worcking>>>>>");
    Response response = await multiPartFileApiClient.invokeApi(
        filepath:null, basePath: basePath, method: 'PATCH', body: {
      "email": email,});
    print(response);
    return ProfileModel.fromJson(jsonDecode(response.body));
  }
}
