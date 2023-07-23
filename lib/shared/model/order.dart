class Order {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Order({this.name, this.email, this.accessToken, this.refreshToken});

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}