import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/data/remote/auth_service.dart';
import 'package:flutter_ecomerce_app/shared/model/user.dart';
import 'package:flutter_ecomerce_app/data/spref/spref.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';

class AuthRepo {
  AuthService _authService;

  AuthRepo({required AuthService authService}) : _authService = authService;

  Future<User> signIn(String email, String pass) async {
    var c = Completer<User>();
    try {
      var response = await _authService.signIn(email, pass);
      var userData = User.fromJson(response.data['data']);
      SPref.instance.set(SPrefCache.REFRESH_TOKEN, userData.refreshToken);
      SPref.instance.set(SPrefCache.ACCESS_TOKEN, userData.accessToken);
      // complete
      c.complete(userData);
    } on DioError {
      c.completeError('Đăng nhập thất bại');
    } catch(e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<User> signUp(String name, String email, String pass, String msisdn) async {
    var c = Completer<User>();
    try {
      var response = await _authService.signUp(name, email, pass, msisdn);
      var userData = User.fromJson(response.data['data']);
      // encrypt and cache refresh_token, access_token
      SPref.instance.set(SPrefCache.REFRESH_TOKEN, userData.refreshToken);
      SPref.instance.set(SPrefCache.ACCESS_TOKEN, userData.accessToken);
      // complete
      c.complete(userData);
    } on DioError {
      c.completeError('Đăng ký thất bại');
    } catch(e) {
      c.completeError(e);
    }
    return c.future;
  }
}