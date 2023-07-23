import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/network/api_client.dart';

class OrderService {

  Future<Response> checkoutReview(body) {
    return ApiClient.instance.dio.get('/api/v1/order/review', body);
  }

  Future<Response> createOrder(body) {
    return ApiClient.instance.dio.get('/api/v1/order', body);
  }

}