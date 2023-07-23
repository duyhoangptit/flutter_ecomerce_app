class Cart {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Cart({required this.name, required this.email, required this.accessToken, required this.refreshToken});

  factory Cart.fromJson(Map<String, dynamic> map) {
    return Cart(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}