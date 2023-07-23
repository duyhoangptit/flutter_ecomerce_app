import 'package:dio/dio.dart';
import 'package:flutter_ecomerce_app/network/api_client.dart';

class ProductService {

  Future<Response> getProducts() {
    return ApiClient.instance.dio
        .get('/api/v1/product/published/all');
  }

  Future<Response> searchProducts(String keySearch) {
    return ApiClient.instance.dio
        .get('/api/v1/product/search/' + keySearch);
  }

}