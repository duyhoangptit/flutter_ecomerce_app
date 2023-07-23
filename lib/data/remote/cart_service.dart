import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/network/api_client.dart';

class CartService {
  Future<Response> addItemToCart(body) {
    return ApiClient.instance.dio.post('/api/v1/cart', body);
  }

  Future<Response> getItemInCart(String userId) {
    return ApiClient.instance.dio.post('/api/v1/cart?userId=' + userId);
  }

  Future<Response> updateItemInCart(String cartId) {
    return ApiClient.instance.dio.put('/api/v1/cart/' + cartId);
  }

  Future<Response> deleteItemIn() {
    return ApiClient.instance.dio.delete('/api/v1/cart');
  }
}