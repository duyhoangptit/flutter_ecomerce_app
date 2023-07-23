class Discount {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Discount({required this.name, required this.email, required this.accessToken, required this.refreshToken});

  factory Discount.fromJson(Map<String, dynamic> map) {
    return Discount(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}