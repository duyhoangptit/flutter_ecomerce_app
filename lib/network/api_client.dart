import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/data/spref/spref.dart';

class ApiClient {
  static final BaseOptions _options = BaseOptions(
    baseUrl: "http://localhost:3056",
    connectTimeout: const Duration(microseconds: 5000),
    receiveTimeout: const Duration(microseconds: 3000),
  );

  static final Dio _dio = Dio(_options);

  ApiClient._internal() {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var token = await SPref.instance.get(SPrefCache.KEY_TOKEN);
          if (token != null && token != '') {
            request.headers['Authorization'] = 'Bearer $token';
          }
          var key = await SPref.instance.get(SPrefCache.API_KEY);
          if (key != null) {
            request.headers['x-api-key'] = '$key';
          }
          return handler.next(request);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            // handler refresh token expired
            // return callRefreshToken();
          }
        },
      ),
    );
  }
  static final ApiClient instance = ApiClient._internal();

  static final newDio() {
    return ApiClient.instance.dio;
}

  Dio get dio => _dio;

  void callRefreshToken(Dio dio, String token,
      String refreshToken, dynamic e, dynamic handler) async {
    try {
      await dio
          .post(
          "https://refresh.api",
          data: jsonEncode(
              {"refresh_token": refreshToken}))
          .then((value) async {
        if (value?.statusCode == 201) {
          //get new tokens ...
          print("access token$token");
          print("refresh token$refreshToken");
          //set bearer
          e.requestOptions.headers["Authorization"] =
              "Bearer $token";
          //create request with new access token
          final opts = Options(
              method: e.requestOptions.method,
              headers: e.requestOptions.headers);
          final cloneReq = await dio.request(e.requestOptions.path,
              options: opts,
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        }
        return e;
      });
      return null;
    } catch (e, st) {
      return null;
    }
  }
}
