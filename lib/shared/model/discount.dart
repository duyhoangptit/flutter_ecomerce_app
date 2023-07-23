class Discount {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  Discount({this.name, this.email, this.accessToken, this.refreshToken});

  factory Discount.fromJson(Map<String, dynamic> map) {
    return Discount(
      name: map['name'],
      email: map['email'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}