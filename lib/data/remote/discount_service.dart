import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/network/api_client.dart';

class DiscountService {
  Future<Response> getDiscountAmount(body) {
    return ApiClient.instance.dio.get('/api/v1/discount/amount', data: body);
  }

  Future<Response> getAllDiscountCodeWithProduct() {
    return ApiClient.instance.dio.get('/api/v1/discount/list-product-code');
  }
}