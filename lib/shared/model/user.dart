class User {
  String name;
  String email;
  String accessToken;
  String refreshToken;

  User({required this.name, required this.email, required this.accessToken, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
    );
  }
}