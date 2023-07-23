import 'package:flutter_ecomerce_app/base/base_event.dart';

class SignInEvent extends BaseEvent {
  String email;
  String pass;

  SignInEvent({
    required this.email,
    required this.pass,
  });
}
