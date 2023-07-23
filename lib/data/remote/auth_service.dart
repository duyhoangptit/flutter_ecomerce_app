import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/network/api_client.dart';

class AuthService {
  Future<Response> signIn(String email, String pass) {
    return ApiClient.instance.dio
        .post('/api/v1/auth/login', data: {'email': email, 'password': pass});
  }

  Future<Response> signUp(name, email, password, msisdn) {
    return ApiClient.instance.dio
        .post('/api/v1/auth/register', data: {'name': name, 'email': email, 'password': pass, 'msisdn': msisdn});
  }

  Future<Response> logout() {
    return ApiClient.instance.dio
        .post('/api/v1/auth/logout');
  }

  Future<Response> getRefreshToken(refreshToken) {
    return ApiClient.instance.dio
        .post('/api/v1/auth/refresh-token', options: {
          'refresh-token': refreshToken
    });
  }
}
