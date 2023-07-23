class Order {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Order({required this.name, required this.email, required this.accessToken, required this.refreshToken});

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}