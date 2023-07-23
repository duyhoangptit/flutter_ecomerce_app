import 'package:flutter/widgets.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';

class SignUpEvent extends BaseEvent {
  String email;
  String pass;
  String msisdn;
  String name;

  SignInEvent({
    @required this.name,
    @required this.email,
    @required this.pass,
    @required this.msisdn,
  });
}
