import 'dart:convert';
import 'dart:developer';

import 'package:fursan_cart/repository/api/Api_exception.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final String basePath =
      // "http://192.168.1.9:3010/api";
  "http://fursancart.rootsys.in/api";
  // String tokenn =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjbGJuaXQzZ28wMDAwenIwYWVmdG1xMTc5IiwiZW1haWwiOiJzZXZtcGlvQGdtYWlsLmNvbXR5YyIsImlhdCI6MTY3MTYxMjU3NSwiZXhwIjoxNjcyMjE3Mzc1fQ.YlCjUTZ58EiR5OOY5xrVH8eFcYcMz2LjQ-JlUN74kBs";
  Future<Response> invokeAPI(
      {required String path,
      required String method,
      required Object? body}) async {
    print(body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');
    print(prefs.getString('token'));
    print(prefs.getString('token'));
    print("Invoke Api worked");
    print(method);
    print(token);

    Map<String, String> headerParams = {};
    if (method == 'POST' || method == 'GET' || method == 'PATCH') {
      print("Methode POST OR GET");
      headerParams = {
        "authorization": "Bearer $token",
        'Accept': 'application/json',
        // 'Content-Type': 'application/json'
      };
    }
    Response response;
print(headerParams);
    String url = basePath + path;
    // String searchurl =  basePath + 'search/movie'+'?api_key=$token'+ path;
    print('========================================' + url);

    // print(searchurl);
    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url), headers: headerParams, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: nullableHeaderParams);
    }
    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers["content-type"];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
