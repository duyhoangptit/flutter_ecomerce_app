class Cart {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Cart({this.name, this.email, this.accessToken, this.refreshToken});

  factory Cart.fromJson(Map<String, dynamic> map) {
    return Cart(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}