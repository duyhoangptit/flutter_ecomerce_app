class Product {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Product({this.name, this.email, this.accessToken, this.refreshToken});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}