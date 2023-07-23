import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/data/spref/spref.dart';

class ApiClient {
  static BaseOptions _options = new BaseOptions(
    baseUrl: "http://localhost:3056",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Dio _dio = Dio(_options);

  ApiClient._internal() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options myOption) async {
      var token = await SPref.instance.get(SPrefCache.KEY_TOKEN);
      if (token != null) {
        myOption.headers["Authorization"] = "Bearer " + token;
      }
      var key = await SPref.instance.get(SPrefCache.API_KEY);
      if (key != null) {
        myOption.headers["x-api-key"] = key;
      }

      return myOption;
    }));
  }
  static final ApiClient instance = ApiClient._internal();

  static final newDio() {
    return ApiClient.instance.dio;
}

  Dio get dio => _dio;
}
