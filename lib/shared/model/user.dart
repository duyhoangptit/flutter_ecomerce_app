class User {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  User({this.name, this.email, this.accessToken, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
    );
  }
}