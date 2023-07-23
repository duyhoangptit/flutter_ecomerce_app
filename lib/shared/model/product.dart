class Product {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Product({required this.name, required this.email, required this.accessToken, required this.refreshToken});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}